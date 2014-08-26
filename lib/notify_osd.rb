class NotifyOsd
  # This registers the notifications this formatter supports, and tells
  # us that this was written against the RSpec 3.x formatter API.
  RSpec::Core::Formatters.register self, :dump_summary

  def initialize(output)
    @output = output
  end

  def dump_summary(summary)
    duration = summary[:duration]
    example_count = summary[:examples].count
    failure_count = summary[:failed_examples].count
    pending_count = summary[:pending_examples].count

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

  private

  def format_duration(duration)
    "#{duration} s"
  end

  def summary_line(example_count, failure_count, pending_count)
    "Examples: #{example_count}\nFailures: #{failure_count}\nPending: #{pending_count}"
  end

  def say(title, body)
    icon = @failure_count > 0 ? "failure.png" : "success.png"
    icon_path = File.join(File.dirname(__FILE__), "..", "images", icon)
    `notify-send -i #{icon_path} "#{body}"`
  end
end
