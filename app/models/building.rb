class Building < ActiveRecord::Base
	before_save :calculate_net_budget
	belongs_to :user
	has_many :installments
	#validate :check_over_discount
	#before_save :overdue_transform
	validates_presence_of :title, :total_budget


	def overdue_transform
		self.installments.where( 'status =  ?  AND installment_date < ?'  , "scheduled", Date.today )
	end

	private

	def calculate_net_budget
		self.net_budget = self.total_budget - self.discount
	end
end
