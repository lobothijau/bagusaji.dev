module ResourceExtensions
  module RubyResource
    def formatted_date
      date.strftime("%B %e, %Y")
    end

    def series?
      data.series.present?
    end

    def back_href
      data.back_href || "/articles"
    end
  end
end

Bridgetown::Resource.register_extension ResourceExtensions
