module Scopperfield
  class Models
    include ActiveModel::AttributeMethods
    include ActiveModel::MassAssignmentSecurity
    extend ActiveModel::Naming

    class << self
      def model_name
        ActiveModel::Name.new(self, parent)
      end

      def register_accessible_scopes(*scopes)
        attr_accessor(*scopes)
        attr_accessible(*scopes)
        define_attribute_methods(scopes)
      end
    end

    def assign_attributes(new_attributes)
      attributes = new_attributes.stringify_keys
      attributes.each do |k, v|
        if respond_to?("#{k}=")
          send("#{k}=", v)
          self.attributes.merge! k => send(k)
        end
      end
    end

    def attributes
      @attributes ||= {}
    end

    def persisted?
    end

    def to_key
    end
  end
end
