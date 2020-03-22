# frozen_string_literal: true

# spec/support/wait_for_ajax.rb
module WaitForAjax
  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  rescue StandardError
    sleep 2 # anti-pattern, but no other solutions worked as reliably
    true
  end
end

RSpec.configure do |config|
  config.include WaitForAjax, type: :feature
end
