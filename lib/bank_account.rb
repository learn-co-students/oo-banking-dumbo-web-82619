class BankAccount
  attr_reader :name, :status
  attr_accessor :balance
  def initialize(name)
    @name = name 
    @balance = 1000
    @status = "open"
  end 

  def deposit(amt)
    @balance += amt 
  end 
  
  def display_balance 
    "Your balance is $#{@balance}." 
  end
  
  def status=(input)
    @status = input
  end 
  
  def valid? 
    if (@status == "open" && @balance > 0)
      true 
    else @status == "closed"
      false 
    end 
  end 
  
  def close_account 
    @status = "closed"
  end
      
end
