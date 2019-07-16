class Employee
  attr_reader :name, :title, :salary
  attr_accessor :boss
  def initialize(name,salary,title,boss=nil)
    @name = name
    @title = title
    @salary = salary
    self.boss = boss
  end

  def bonus(multiplier)
    bonus = salary * multiplier
  end

  def boss=(employee)
    unless boss.nil?
      boss.add_employee(self)
    end
  end

end