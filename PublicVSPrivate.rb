class Employee

	attr_accessor :name, :email
	attr_writer :salary
	attr_reader :deposit_account

	def initialize(name, email, salary, deposit_account)
		@name = name
		@email = email
		@salary = salary
		@deposit_account = deposit_account
	end

	def to_s
		"#{name} <email: #{email}> acct: #{hide_acount_number}"
	end


  def vacation_days
    coefficient * 7  
  end

  def bonus
    coefficient * 1000
  end
	  private
		def hide_acount_number
			cad = ""
			n = @deposit_account.length
			for i in 0...n
				if @deposit_account[i] != '-'
					cad = cad + @deposit_account[i]
				end
			end
		  puts "la cadena esta quedando asi: #{cad}"

			account = ""
			for i in 0...(cad.length-4)
				account = account + "*"
			end
			account = account + cad.slice(n-6,4)
			account
		end

		def coefficient
		    coefficients = { 1 => 0...1_000, 1.2 => 1_000...2_000, 1.4 => 2_000...5_000, 1.5 => 5_000..10_000 }
	    	coefficients.find { |coefficient, range| range.include? @salary }.first
		end

end

#empleado = Employee.new("santiago", "sabefo@gmail.com", 500, "12345678")
#puts empleado.to_s

employee = Employee.new('Juan Perez', 'juan@gmail.com', 1_800, '123-456-512')

employee.to_s
# => "Juan Perez <email: juan@gmail.com> acct: *****6512"

str = "The employee information is #{employee}"
puts str
# => "The employee information is Juan Perez <email: juan@gmail.com> acct: *****6512"

puts str == "The employee information is Juan Perez <email: juan@gmail.com> acct: *****6512"

puts employee.vacation_days == 8.4
puts employee.bonus == 1_200





