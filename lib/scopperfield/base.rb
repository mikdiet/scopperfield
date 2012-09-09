module Scopperfield
  module Base
    extend ActiveSupport::Concern

    included do
      @scopperfield_model = const_set(name.pluralize, Class.new(Scopperfield::Models)).new
    end

    module ClassMethods

      def scope_accessible(*scopes)
      end

      def scopperfield_model
        @scopperfield_model
      end
    end
  end
end
