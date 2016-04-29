# == Schema Information
#
# Table name: clients
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  marital_status   :integer          default(0)
#  first_name       :string
#  second_name      :string
#  last_name        :string
#  second_last_name :string
#  birth_date       :datetime
#  gender           :integer
#  email            :string
#  phone_number     :string
#  cellphone_number :string
#  has_kids         :boolean          default(FALSE)
#  is_vip           :boolean          default(FALSE)
#  client_since     :datetime
#  deleted_at       :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  client_prospect  :boolean          default(FALSE)
#  client           :boolean          default(FALSE)
#

class Client < ActiveRecord::Base
	belongs_to :user, inverse_of: :clients

	has_many :spouses, inverse_of: :client
	accepts_nested_attributes_for :spouses, allow_destroy: true

	has_many :prospects, inverse_of: :client
	has_many :policies, inverse_of: :client

	# TODO: remove this shieeeet
	has_many :events, inverse_of: :client

	has_many :offsprings, inverse_of: :client
	accepts_nested_attributes_for :offsprings, allow_destroy: true
	
	has_many :addresses, inverse_of: :client
	accepts_nested_attributes_for :addresses, allow_destroy: true

	enum marital_status: [:single, :married, :widowed]
	enum gender: [:male, :female, :other]

	scope :real_clients, -> { where(real_client: true) }
	scope :client_prospects, -> { where(client_prospect: true, real_client: false) }
	scope :prospects, -> { where(real_client: false, client_prospect: false) }
	scope :any_prospects, -> {where(real_client: false)}

	def real_client?
		real_client
	end

	def client_prospect?
		client_prospect && !real_client
	end

	def prospect?
		!real_client && !client_prospect
	end

	def full_name
		return "#{first_name}  #{second_name}  #{last_name}  #{second_last_name}"
	end


	# Full calendar data
	def title
		"#{first_name} #{last_name}"
	end

	def date
		birth_date.strftime("%Y-%m-%d") if birth_date
	end

	def link
		"/clients/#{id}"
	end

	def color
		"#F00"
	end

	def as_json(options={})
	  super(only: [], methods: [:title, :date, :link, :color])
	end

end
