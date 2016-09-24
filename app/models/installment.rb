class Installment < ActiveRecord::Base
	#after_save :check_overdue
	#validate :check_over_schedule
	validate :check_over_payment
	belongs_to :building
	#validate :update_overdue
	#before_action :overdue_transform
	#validate :overdue_transform
	validates_presence_of :amount, :details
	
	def overdue_transform
		self.installments.where( 'status =  ?  AND installment_date < ?'  , "scheduled", Date.today )
	end

	def check_over_payment
		total_installment_amount = self.building.installments.sum(:amount) + self.amount
		if total_installment_amount > self.building.net_budget
			errors.add(:amount, "Payment exceeding")
		end
	end

	def check_over_schedule
		if self.installment_date < Date.today
			errors.add(:installment_date, "Given date is Completed")
		end
	end

	

				
	

	def check_overdue
		#total_overdue = self.building.installments.where( 'status = ?', "overdue")

		if self.installment_date > Date.today
			errors.add(:installment_date, "Given date is not yet came")
		end

		#if self.building.installments.where( 'status = ?', "overdue")
			#total_overdue > self.building.installments.where( 'installment_date = ?', Time.created_at )
		#	errors.add(:status, "Please Collect Overdue Amount")

	end
end


