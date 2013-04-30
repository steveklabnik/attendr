module AttendeesHelper
  def attendance_fields_for(form, attendee)
    if attendee.attended?
      concat(content_tag(:td, "✔"))
      concat(form.hidden_field :attended, :value => false)
      concat(content_tag(:td, form.submit("Didn't attend")))
    else
      concat(form.hidden_field :attended, :value => true)
      concat(content_tag(:td, form.submit("Attended")))
      concat(content_tag(:td, "✔"))
    end
  end
end
