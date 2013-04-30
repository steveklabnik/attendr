class Event < ActiveRecord::Base
  has_many :attendees

  before_create :generate_slug

  def self.from_csv(file, name)
    Event.create(name: name).tap do |event|
      CSV.foreach(file, headers: true, header_converters: :symbol, encoding: Encoding::UTF_8) do |row|
        Attendee.create!(row.to_hash.merge({event_id: event.id}))
      end
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
