class Book < ActiveRecord::Base
  include Scopperfield::Base
  COVER_TYPES = %w{paper hard leather}
  attr_accessible :cover, :name, :pages, :readed, :readed_at

  class << self
    def paper_covered
      where(:cover => 'paper')
    end

    def hard_covered
      where(:cover => 'hard')
    end

    def leather_covered
      where(:cover => 'leather')
    end

    def readed
      where(:readed => true)
    end

    def unreaded
      where(:readed => false)
    end
  end

  scope_accessible :paper_covered, :readed, :unreaded
  scope_invertible :readed => :unreaded
end
