Dado('que acesso a página de cadastro') do                                   
    visit "http://rocklov-web:3000/signup"
    
  end                                                                          
                                                                               
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