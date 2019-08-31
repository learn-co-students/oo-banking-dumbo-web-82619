class BankAccount
  attr_reader :name, :transfer
  attr_accessor :balance, :status
  @@all = []
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@all << self
  end

  def self.all
    @@all
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.balance <= 0 || self.status == "closed" ? false : true
  end

  def close_account
    self.status = "closed"
  end

end

