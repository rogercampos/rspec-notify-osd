require 'rspec/core/formatters/base_text_formatter'

class NotifyOsd < RSpec::Core::Formatters::BaseTextFormatter
  def dump_summary(duration, example_count, failure_count, pending_count)
    body = []
    body << "Finished in #{format_duration duration}"
    body << summary_line(example_count, failure_count, pending_count)

    name = File.basename(File.expand_path '.')

    title = if failure_count > 0
      "\u26D4 #{name}: #{failure_count} failed example#{failure_count == 1 ? nil : 's'}"
    else
      "\u2705 #{name}: Success"
    end

    @failure_count = failure_count
    say title, body.join("\n")
  end

  def dump_pending; end
  def dump_failures; end
  def message(message); end

  private

  def say(title, body)
    icon = @failure_count > 0 ? "failure.png" : "success.png"
    icon_path = File.join(File.dirname(__FILE__), "..", "images", icon)
    `notify-send -i #{icon_path} "#{body}"`
  end
end
