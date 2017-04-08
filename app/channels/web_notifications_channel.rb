
class WebNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "web_notifications_#{current_user.id.to_s}"
  end

  def unsubscribed

  end
end
