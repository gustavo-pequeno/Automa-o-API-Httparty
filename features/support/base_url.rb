module Employee
    include HTTParty
    #@token = HTTParty.post("Url da Api de Token")
    base_uri 'http://dummy.restapiexample.com/api/v1'
    format :json
    headers 'Content-Type': 'application/json'
    #headers 'Content-Type': 'application/json', 'Authorization: 'Bearer' + @token.parsed_response('Campo do Response Que Retorna O Token')
end