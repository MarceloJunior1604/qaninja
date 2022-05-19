Dado('que acesso a página de cadastro') do                                   
    visit "http://rocklov-web:3000/signup"
  end                                                                          
                                                                               
  Quando('submeto o meu cadastro completo') do                                 
    find("#fullName").set "Marcelo"
    find("#email").set "Marcelo@bol.com.br"
    find("#password").set "qaninja"

    clock_button "Cadastrar"

    sleep 10
  end                                                                          
                                                                               
  Então('sou redirecionado para o Dashboard') do                               
    
  end                                                                          