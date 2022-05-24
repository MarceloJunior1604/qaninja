
  #Funcionalidade: Cadastro
  #Sendo um músico que possui equipamentos musicais
  #Quero fazer o meu cadastro no RockLov
  #Para que eu possa disponibilizá-los para locação

  Dado('que acesso a página de cadastro') do                                   
    visit "http://rocklov-web:3000/signup"
    
  end                                                                          
  #Cenário -- Fazer cadastro                                                                             
  Quando('submeto o meu cadastro completo') do    
    find("#fullName").set "Marcelo Junior"
    find("#email").set Faker::Internet.free_email
    find("#password").set "123456"
  click_button "Cadastrar"
  end                                                                          
                                                                               
  Então('sou redirecionado para o Dashboard') do     
    expect(page).to have_css ".dashboard"                          
    sleep 15
  end                                                                          

  #Cenário -- Submeter cadastro sem o nome
  Quando('submeto o meu cadastro sem o nome') do
    find("#email").set Faker::Internet.free_email
    find("#password").set "123456"

    click_button "Cadastrar"
  end
  
  Então('vejo a mensagem de alerta: Oops. Informe seu nome completo!') do
     alert = find(".alert-dark")
     expect(alert.text).to eql "Oops. Informe seu nome completo!"
  
  end

  #Cenário -- Submeter cadastro sem o email
  Quando('submeto o meu cadastro sem o email') do
    find("#fullName").set "Marcelo Junior"
    find("#password").set "1234"
    
    click_button "Cadastrar"
  end
  
  Então('vejo a mensagem de alerta: Oops. Informe um email válido!') do
     alert = find(".alert-dark")
     expect(alert.text).to eql "Oops. Informe um email válido!"
  end

  #Cenário -- Submeter cadastro com email incorreto
  Quando('submeto o meu cadastro com email incorreto') do
    find("#fullName").set "Marcelo Junior"
    find("#email").set "testeEmailIválido"
    find("#password").set "1234"

    click_button "Cadastrar"
  end

  Então('vejo a mensam de alerta: Oops. Informe um email válido!') do
    alert = find(".alert-dark")
    expect(alert.text).to eql "Oops. Informe um email válido!"
   end
   #find("#email").set Faker::Internet.free_email
  #Cenario -- Submeter cadastro sem a senha
  Quando('submeto o meu cadastro sem a senha') do
   find("#fullName").set "Marcelo Junior"
   find("#email").set Faker::Internet.free_email

   click_button "Cadastrar"
   sleep 5
  end
  
  Então('vejo a mensagem de alerta: Oops. Informe sua senha secreta!') do
    alert = find(".alert-dark")
    expect(alert.text).to eql "Oops. Informe sua senha secreta!"
  end