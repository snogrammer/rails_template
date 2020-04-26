# frozen_string_literal: true

module ApplicationHelper
  # Javascript Pack helper for controller-based JS
  def javascript_controller_pack_tag_helper
    javascript_pack_tag params[:controller]
  rescue Webpacker::Manifest::MissingEntryError
    begin
      # Fallback retry for nested controllers
      namespace = params[:controller].split('/').first
      javascript_pack_tag namespace
    rescue StandardError
      nil
    end
  end

  def notification_type(name)
    case name.to_sym
    when :notice
      'info'
    when :alert
      'danger'
    else
      name
    end
  end
end
