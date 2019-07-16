require_relative "employee.rb"
require 'set'

class Manager < Employee
  attr_reader :employees

  def initialize(name,salary,title,boss=nil)
    super(name,salary,title,boss)
    @employees = []
    boss = self unless boss.nil? 
    find_all_employees
  end

  def bonus(multiplier)
     # sum of employee salaries * multiplier
     sum = employees.inject(0) { |acc,employee| acc + employee.salary }
     bonus = sum * multiplier
  end



  def add_employee(employee)
    employees << employee
    employee
  end

  # def find_all_employees
  #   queue = [self]

  #   until queue.empty?
  #     current_employee = queue.shift
  #     if current_employee.is_a?(Manager)
  #       queue << current_employee.employees
  #       self.employees + current_employee.employees
  #     end
  #     self.employees + current_employee
  #     end
  #   end
  # end

end

ned = Manager.new('Ned',1000000,'Founder', nil)
darren = Manager.new('Darren', 78000, 'TA Manager', ned)
shawna = Employee.new('Shawna', 12000, 'TA', darren)
david = Employee.new('David', 10000, 'TA', darren)

p ned.bonus(1)
p david.bonus(1)
p darren.bonus(1)