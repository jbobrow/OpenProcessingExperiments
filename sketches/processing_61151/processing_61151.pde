
int TO;//variavel para o numero total de ellipses
float PosX,PosY;//variavel para o posicionamento das ellipses
float tamanho;//variavel para o diametro das ellipses

void setup(){/*função que serve para fazer as definições*/
  size (500,500);//tamanho da tela
  smooth();//suavizar as formas
  noLoop();//definir para que não haja loop na composição
  TO = 20000;//numero total de ellipses na composição
  
}

void draw(){/*Função para desenhar*/
  background(125);//cor de fundo
  for (int i = 0; i < TO; i++){//ciclo para as ellipses até desenhar 20000 objectos
    PosX = map (i, 0, TO, 0, width);//posição x das ellipses//*esta linha de codigo foi retirada e ajustada de exemplos do professor
    PosY = random(height);//posição y das ellipses
    float tamanho = random(5,20);//variavel para o diametro das ellipses
    if (tamanho >19){// condição para o tamanho/cor das ellipses
      fill(155,125,255);//cor das ellipses
      ellipse(PosX,PosY,tamanho*2,tamanho*2);//desenho das ellipses1
    }else{
      fill(0,0,255);//cor das ellipses2
    }
     ellipse(PosX,PosY,tamanho,tamanho);//desenho das ellipses2
  }
}


