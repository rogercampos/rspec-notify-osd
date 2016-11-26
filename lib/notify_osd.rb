require 'rspec/core/formatters/base_text_formatter'

class NotifyOsd < RSpec::Core::Formatters::BaseTextFormatter

  RSpec::Core::Formatters.register NotifyOsd, :dump_summary

  def initialize(output)
    super(output)
  end

  def dump_summary(notification)
    @failure_count = notification.failure_count

    body = "Finished in #{notification.formatted_duration}\n#{notification.totals_line}"

    name = File.basename(File.expand_path '.')

    if @failure_count > 0
      title =  "#{name}: #{@failure_count} failed example#{@failure_count == 1 ? nil : 's'}"
    else
      title =  "#{name}: Success"
    end

    say title, body
  end

  private

  def say(title, body)
    urgency =  @failure_count > 0 ? "critical" : "normal"
    icon = @failure_count > 0 ? "failure.png" : "success.png"
    icon_path = File.join(File.dirname(__FILE__), "..", "images", icon)
    `notify-send -i #{icon_path} -u #{urgency} "#{title}" "#{body}"`
  end
end
