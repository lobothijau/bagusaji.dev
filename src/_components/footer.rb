class Footer < SiteComponent
  attr_reader :email

  def initialize(email:)
    @email = email
  end
end