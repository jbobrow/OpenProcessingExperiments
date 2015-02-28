
size(500,500); // tamanho da janela
background(#F2C531); // cor de fundo

noStroke(); //// definição dos circulos grandes sem outline
smooth();// definição do contorno


    for (int x = 1; x < 10; x = x+1) { // numero de quadrados
      
      rect( x * 48 , width/2, 25,25); // espaçamento e tamanho dos quadrados
      fill (#62230A); // preenchimento dos quadrados
    }
    


