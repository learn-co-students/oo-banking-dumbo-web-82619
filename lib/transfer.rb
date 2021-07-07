class Transfer
  
  attr_reader :sender, :receiver
  attr_accessor :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 
  
  def valid?
    if self.sender.valid? == true && self.receiver.valid? == true
      return true
    else 
      return false
    end 
  end 
  
  def execute_transaction
    
    # if self.valid? == false
    if self.receiver.status == "closed"
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
      
    elsif self.sender.balance < self.amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
      
    elsif self.status == "pending"
      self.sender.balance -= 50
      self.receiver.balance += 50
      self.status = "complete"
    end 

  end 
  
  
  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += 50
      self.receiver.balance -= 50
      self.status = "reversed"
    end 
  end 
    
end




