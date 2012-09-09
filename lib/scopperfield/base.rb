module Scopperfield
  module Base
    extend ActiveSupport::Concern

    included do
      @scopperfield_model = const_set(name.pluralize, Class.new(Scopperfield::Models)).new
    end

    module ClassMethods

      def scope_accessible(*scopes)
        @accessible_scopperfield_scopes = (accessible_scopperfield_scopes + scopes.map(&:to_sym)).uniq
      end

      def scope_invertible(list)
      end

      # Syntactic sugar
      def scopperfield(*options)
        if options.present?
          scopperfield_scope(*options)
        else
          scopperfield_model
        end
      end

      def scopperfield_model
        @scopperfield_model
      end

      def scopperfield_scope(params, options = {})
        result_scope = scoped
        if params.is_a? Hash
          params.each do |name, value|
            next unless accessible_scopperfield_scopes.include? name.to_sym
            result_scope = result_scope.send(name) if value
          end
        end
        result_scope
      end

    protected
      def accessible_scopperfield_scopes
        @accessible_scopperfield_scopes ||= []
      end
    end
  end
end
