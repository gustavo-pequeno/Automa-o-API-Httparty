#language: pt

Funcionalidade: Pesquisar Funcionarios
    Para averiguar informacoes
    O usuário do sistema
    Deseja poder consultar informacoes dos funcionarios

    Cenario: Buscar informacoes de funcionario
        Dado que o usuario consulte informacoes de funcionario
        Quando ele realizar a pesquisa
        Então ouma lista de funcionarios deve retornar
    
    @segundo_cenario
    Cenario: Cadastrar  funcionario
        Dado que o usuario cadastre um novo funcionario
        Quando ele enviar as informacoes do funcionario
        Entao esse funcionario sera cadastrado
    
    @terceiro_cenario
    Cenario: Alterar informacoes cadastrais
    Dado que o usuario altere uma informacao de funcionario
    Quando ele enviar as novas informacoes
    Entao as informacoes serao alteradas