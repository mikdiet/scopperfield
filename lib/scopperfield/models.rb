module Scopperfield
  class Models
    include ActiveModel::AttributeMethods
    extend ActiveModel::Naming

    class << self
      def model_name
        ActiveModel::Name.new(self, parent)
      end
    end
  end
end
