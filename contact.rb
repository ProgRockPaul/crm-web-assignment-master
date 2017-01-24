# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!
require './test/contact_test.rb'

class Contact
    attr_accessor :first_name, :last_name, :email, :note
    attr_reader :id
#
  @@contacts = []
  @@id = 1

  def self.all
    @@contacts
  end

  def initialize(first_name, last_name, email, note)
    @id = @@id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @@id += 1
  end
  #
  def self.create(first_name, last_name, email, note)
    new_contact = self.new(first_name, last_name, email, note)
    @@contacts << new_contact
    new_contact
  end
  #

  # This method should accept an id as an argument
  # and return the contact who has that id

  def self.find(id)
    @@contacts.each do |contact|
      if id == contact.id
        return contact
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)
    # puts value
    # puts value.class
    case attribute
    when 'first_name'
       @first_name = value
    when 'last_name'
       @last_name = value
    when 'email'
       @email = value
    when 'note'
       @note = value
    end
  end
  #
  #   puts "What attribute would you like to update? Please enter: first_name, last_name, email, or note. Then enter a new value."
  #   attribute = gets.chomp
  #   new_value = gets.chomp
  #   case attribute
  #      when "first_name"
  #        self.first_name = new_value
  #      when "last_name"
  #        self.last_name = new_value
  #      when "email"
  #        self.email = new_value
  #      when "note"
  #        self.note = new_value
  #   end
  #   return self
  # end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
      case attribute
      when 'first_name'
        @@contacts.each do |contact|
          if value == contact.first_name
            return contact
          end
        end
        "No match for #{value}"
      when 'last_name'
        @@contacts.each do |contact|
          if value == contact.last_name
            return contact
          end
        end
        "No match for #{value}"
      when 'email'
        @@contacts.each do |contact|
          if value == contact.email
            return contact
          end
        end
        "No match for #{value}"
      when 'note'
        @@contacts.each do |contact|
          if value == contact.note
            return contact
          end
        end
        "No match for #{value}"
      end
  end
# when attribute is "first_name" and value is "Betty", find all frist names matching Betty.
  #
  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    return "#{first_name} #{last_name}"
  end
  #
  # # This method should delete the contact
  # # HINT: Check the Array class docs for built-in methods that might be useful here

  def delete
    @@contacts.delete(self)
    @@contacts
  end
end

paul = Contact.new('Paul', 'Walsh', 'twentytwentyk@live.com', 'Local Bard')
john = Contact.new('John', 'Petrucci', 'bearucci@gmail.com', 'Local Bear')
