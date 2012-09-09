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
        invertible_scopperfield_scopes.merge! list
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
            next unless accessible_scope?(name)
            if value
              result_scope = result_scope.send(name)
            else
              invertion = scope_invertion_of(name)
              if invertion && accessible_scope?(invertion)
                result_scope = result_scope.send(invertion)
              end
            end
          end
        end
        result_scope
      end

    protected
      def accessible_scopperfield_scopes
        @accessible_scopperfield_scopes ||= []
      end

      def accessible_scope?(name)
        accessible_scopperfield_scopes.include? name.to_sym
      end

      def invertible_scopperfield_scopes
        @invertible_scopperfield_scopes ||= {}.with_indifferent_access
      end

      def scope_invertion_of(name)
        invertible_scopperfield_scopes[name]
      end
    end
  end
end
