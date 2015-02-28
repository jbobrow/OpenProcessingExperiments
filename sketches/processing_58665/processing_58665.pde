
size(500,500); // define o tamanho da janela
background(255); // define o cor de fundo

noStroke(); // retira a linha de contorno das formas
smooth(); // suaviza as formas


    for (int x = 1; x < 10; x = x+1) { // indica o numero de repetições da variavel x
      
      fill(216, 13, 108); // cor de preenchimento da forma
      rect( x * 50 , 250, 20,1000); // construção da forma com a variavel x a repetir 10 vezes e *50 indica o espaçamento entre elas
      
    }

