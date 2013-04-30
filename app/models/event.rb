class Event < ActiveRecord::Base
  has_many :attendees

  before_create :generate_slug

  def self.from_csv(file, name)
    csv = CSV.parse(file, headers: true, header_converters:  :symbol)

    @event = Event.create(name: name)

    csv.each do |row|
      Attendee.create!(row.to_hash.merge({event_id: @event.id}))
    end
  end

  def filename
    "#{name.gsub(/\W/, "-").downcase}-export-#{Time.now.to_i}.csv"
  end

  def to_csv
    headers = Attendee.attribute_names

    CSV.generate do |csv|
      csv << headers

      Attendee.all.each do |attendee|
        csv << headers.collect {|col| attendee.send(col) }
      end
    end
  end

  def to_param
    slug
  end

  def generate_slug
    self.slug = SecureRandom.uuid
  end
end
