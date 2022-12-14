Dado('que o usuario consulte informacoes de funcionario') do
    @get_url = 'http://dummy.restapiexample.com/api/v1/employees'
  end
  
  Quando('ele realizar a pesquisa') do
    @list_employee = HTTParty.get(@get_url)
  end
  
  Então('ouma lista de funcionarios deve retornar') do
    expect(@list_employee.code).to eql 200
    expect(@list_employee.message).to eql 'OK'
  end

  Dado('que o usuario cadastre um novo funcionario') do
    @post_url = "http://dummy.restapiexample.com/api/v1/create"
  end
  
  Quando('ele enviar as informacoes do funcionario') do
    @create_employeee = HTTParty.post(@post_url, :headers => {'Content-Type': 'application/json'}, body: {      
        "id": 27,
        "employee_name": "Beatriz Morais",
        "employee_salary": 5000,
        "employee_age": 18,
        "profile_image": ""
    }.to_json)
      # puts @create_employeee
  end
  
  Entao('esse funcionario sera cadastrado') do
    expect(@create_employeee.code).to eql 200
    expect(@create_employeee.message).to eql 'OK'
    expect(@create_employeee["status"]).to eql 'success'
    expect(@create_employeee["message"]).to eql 'Successfully! Record has been added.'
    expect(@create_employeee['data']["employee_name"]).to eql 'Beatriz Morais'
    expect(@create_employeee['data']['employee_salary']).to eql (5000)
    expect(@create_employeee['data']['employee_age']).to eql (18)
    # puts @create_employeee.code
    # puts @create_employeee.msg
    # puts @create_employeee["status"]
    # puts @create_employeee.parsed_response["data"]["employee_name"]
  end

  Dado('que o usuario altere uma informacao de funcionario') do
    @put_url = 'http://dummy.restapiexample.com/api/v1/update/11'
  end
  
  Quando('ele enviar as novas informacoes') do
    @update_employeee = HTTParty.put(@put_url, :headers => {'Content-Type': 'application/json'}, body: {      
      "employee_name": "Beatriz Morais Lima",
      "employee_salary": 10000,
      "employee_age": 20,
      "profile_image": ""
  }.to_json)

  end
  
  Entao('as informacoes serao alteradas') do
    expect(@update_employeee.code).to eql (200)
    expect(@update_employeee.message).to eql 'OK'
    expect(@update_employeee["status"]).to eql 'success'
    expect(@update_employeee["message"]).to eql 'Successfully! Record has been updated.'
    expect(@update_employeee['data']["employee_name"]).to eql 'Beatriz Morais Lima'
    expect(@update_employeee['data']['employee_salary']).to eql (10000)
    expect(@update_employeee['data']['employee_age']).to eql (20)
  end