module Scopperfield
  module Base
    extend ActiveSupport::Concern

    included do
      @scopperfield_model = const_set(name.pluralize, Class.new(Scopperfield::Models)).new
    end

    module ClassMethods

      def scope_accessible(*scopes)
        scopperfield_model.class.register_accessible_scopes(*scopes)
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
          scopperfield_model.assign_attributes(params)
          scopperfield_model.attributes.each do |name, value|
            if value
              result_scope = result_scope.send(name)
            else
              invertion = scope_invertion_of(name)
              if invertion
                result_scope = result_scope.send(invertion)
              end
            end
          end
        end
        result_scope
      end

    protected
      def invertible_scopperfield_scopes
        @invertible_scopperfield_scopes ||= {}.with_indifferent_access
      end

      def scope_invertion_of(name)
        invertible_scopperfield_scopes[name]
      end
    end
  end
end
