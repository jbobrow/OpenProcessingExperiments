
int TO;//variavel para o numero total de ellipses


void setup(){/*Função que serve para definir as definições*/
  size (500,500);//tamanho da tela
  background(200);//cor de fundo
  smooth();//suavizar as formas
  noLoop();//definir para que não haja loop na composição
  TO = 200;//numero total de ellipses na composição
}

void draw(){/*Função para desenhar*/
  
    float r = random (255);//variavel da cor vermelha(red)
    float g = random (255);//variavel da cor verde(green)
    float b = random (255);//variavel da cor azul(blue)
    float PosX = width/2;//variavel para a posição x das ellipses/linhas
    float PosY = height/2;//variavel para a posição y das ellipses/linhas
    float PosX2 = PosX;//variavel que dita que x é igual a x2 das linhas
    float PosY2 = PosY;//variavel que dita que y é igual a y2 das linhas
    for (int i = 0; i < TO; i++){//ciclo para as ellipses/linhas até desenhar 200 objectos
      PosX = width/2+random(-i,i);//gerar um numero para a posição x
      PosY = height/2+random(-i,i);//gerar um numero para a posição y
      float tamanho = random(20);//variavel para o tamanho das ellipses
      //...........................................
      stroke(0);//cor das linhas
      //line(x,y,x2,y2);
      line(PosX,PosY,PosX2,PosY2);//desenho das linhas
      //...........................................
      fill(r,g,b);//cor das ellipses maiores
      ellipse(PosX,PosY,tamanho,tamanho);//desenho das ellipses maiores
      //...........................................
      fill(255);//cor das ellipses menores
      ellipse(PosX,PosY,tamanho/4,tamanho/4);//desenho das ellipses menores
  }
}

