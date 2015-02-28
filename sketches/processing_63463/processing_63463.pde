
void setup(){//definiçao das opçoes de setup
  
  size (600, 600);//tamanho da janela
  
  background (0);//cor de fundo (preto)
  
  smooth();//suavizar as formas
  
  noLoop();// sem movimento, imagem estatica
}

void draw(){// definiçao das opçoes de desenho
 for (int y = 0; y < 25; y++){// variavel para a posição x com o numero de objectos =  25
  
   for (int x = 0; x < 25; x = x+1){// variavel para a posição y com o numero de objectos =  25
    
    fill (0, random (255), random (255));// definiçao da cor aletario no verde e azul
    rect ( x * 25, y * 25, 15, 15);// desenho de quadrados a formar uma grelha com a posição x e y em conformidade com as variaveis

  
   }
 }
  
}

