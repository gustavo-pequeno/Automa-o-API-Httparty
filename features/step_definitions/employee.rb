  #GET --------------------------------------------------------------------
  Dado('que o usuario consulte informacoes de funcionario') do
    @getlist = Employee_Requests.new
    @assert = Assertions.new
  end
  
  Quando('ele realizar a pesquisa') do
    @list_employee = @getlist.find_employee
  end
  
  Então('uma lista de funcionarios deve retornar') do
    @assert.request_sucess(@list_employee.code, @list_employee.message)
  end

  #POST --------------------------------------------------------------------
  Dado('que o usuario cadastre um novo funcionario') do
    @create = Employee_Requests.new
    @assert = Assertions.new
  end
  
  Quando('ele enviar as informacoes do funcionario') do
    @create_employee = @create.create_employee(DATABASE[:name][:name5], DATABASE[:salary][:salary5], DATABASE[:age][:age5])
    puts @create_employee
  end
  
  Entao('esse funcionario sera cadastrado') do
    @assert.request_sucess(@create_employee.code, @create_employee.message)
    expect(@create_employee["status"]).to eql 'success'
    expect(@create_employee["message"]).to eql 'Successfully! Record has been added.'
    expect(@create_employee['data']["employee_name"]).to eql (DATABASE[:name][:name5])
    expect(@create_employee['data']['employee_salary']).to eql (DATABASE[:salary][:salary5]) 
    expect(@create_employee['data']['employee_age']).to eql (DATABASE[:age][:age5])
    # puts @create_employeee.code
    # puts @create_employeee.msg
    # puts @create_employeee["status"]
    # puts @create_employeee.parsed_response["data"]["employee_name"]
  end

  #PUT --------------------------------------------------------------------
  Dado('que o usuario altere uma informacao de funcionario') do
   @request = Employee_Requests.new
   @assert = Assertions.new
  end
  
  Quando('ele enviar as novas informacoes') do
    @update_employee = @request.update_employee(@request.find_employee['data'][0]['id'], 'Beatriz Morais', 10000, 20)
    puts @update_employee

  end
  
  Entao('as informacoes serao alteradas') do
    @assert.request_sucess(@update_employee.code, @update_employee.message)
    expect(@update_employee["status"]).to eql 'success'
    expect(@update_employee["message"]).to eql 'Successfully! Record has been updated.'
    expect(@update_employee['data']["employee_name"]).to eql 'Beatriz Morais'
    expect(@update_employee['data']['employee_salary']).to eql (10000)
    expect(@update_employee['data']['employee_age']).to eql (20)
  end

  #DELETE --------------------------------------------------------------------

  Dado('que o usuario queira deletar um funcionario') do
   @request = Employee_Requests.new
   @assert = Assertions.new
  end
  
  Quando('ele enviar a identificacao unica') do
    @delete_employee = @request.delete_employee(@request.find_employee['data'][0]['id'])
  end
  
  Entao('esse funcionario sera deletado do sistema') do
    @assert.request_sucess(@delete_employee.code, @delete_employee.message)
    expect(@delete_employee["status"]).to eql 'success'
    expect(@delete_employee['data']).to eql '1'
    expect(@delete_employee["message"]).to eql 'Successfully! Record has been deleted'
  end