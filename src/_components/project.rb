class Project < SiteComponent
  attr_reader :name, :description, :link, :logo, :thumbnail

  def initialize(name:, description:, link:, logo:, thumbnail:)
    @name, @description, @link, @logo, @thumbnail =
      name, description, link, logo, thumbnail
  end

  def link_options
    external_link? ? {target: "_blank"} : {}
  end

  private

  def external_link?
    !!@link.external
  end
end
