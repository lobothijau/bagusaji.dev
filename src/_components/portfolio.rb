class Portfolio < SiteComponent
  attr_reader :name, :description, :link, :thumbnail

  def initialize(name:, description:, link:, thumbnail:)
    @name, @description, @link, @thumbnail =
      name, description, link, thumbnail
  end

  def link_options
    external_link? ? {target: "_blank"} : {}
  end

  private

  def external_link?
    !!@link.external
  end
end
