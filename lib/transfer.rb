class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end

  def self.all
    @@all
  end

  def valid?
    sender.valid? == true && receiver.valid? == true && self.status == "pending" ? true : false
  end

  def execute_transaction
    if self.valid? == true && sender.balance >= amount
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end

end