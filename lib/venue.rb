class Venue <ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:name, {:presence => true})

  before_save(:title_cased)

  private
    define_method(:title_cased) do
      self.name=(name().titlecase)
    end
end
