class Book < ActiveRecord::Base
  include Scopperfield::Base
  COVER_TYPES = %w{paper hard leather}
  attr_accessible :cover, :name, :pages, :readed, :readed_at

  class << self
    def paper_covered
      where(:cover => 'paper')
    end
  end

  scope_accessible :paper_covered
end
