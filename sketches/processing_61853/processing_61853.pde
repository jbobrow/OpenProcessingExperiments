
PFont texto;// definição de uma variavel de texto
float h12;//definição de uma variavel das horas para metade

void setup(){// definiçoes do setup
  size (500, 500);// tamanho da janela de 500px por 500px
  smooth();// suavização das formas
  background (0);// definição da cor do fundo
  
  texto = loadFont ("CenturyGothic-48.vlw");// definição do tipo de letra(font) a atribuir à variavel de texto
  
  textFont (texto, 25);// atribuição dos valores do tamanho à fonte "texto"
}
void draw(){// definições de desenho
  translate (width/2-50, height/2-50);// definir o centro de translação para as coordenadas indicadas
  
  background (0);// definição do fundo para ficar limpo (sem rasto)
  noFill();// retirar o preenchimento às formas
  stroke (0, 255, 0); // atribuição de valores da cor
  ellipse (0, 0, 363, 363); //desenho de uma ellipse
  stroke (0, 0, 255);// atribuição de valores da cor
  ellipse (0, 0, 280, 280);//desenho de uma ellipse
  stroke (255, 0, 0);// atribuição  de valores da cor
  ellipse (0, 0, 200, 200);// desenho de uma ellipse

  
  
  float s;// definição de uma variavel para os segundos
  float m;// definição de uma variavel para os minutos
  float h;// definição de uma variavel para as horas
  
  s = second();//atribuição da funçao segundos à variavel "s"
  m = minute();// atribuição da função minutos à variavel "m"
  h = hour();// atribuição da função horas à variavel "h"
  h12 = h%12;// redefinição dos valores da variavel "h" para metade
  
  s = map (s, 0, 59, 0, 360);// mapeamento da variavel "s" para fazer uma rotação de 360
  m = map (m, 0, 59, 0, 360);// mapeamento da variavel "m" para fazer uma rotação de 360
  h = map (h12, 0, 12, 0, 360);// mapeamento da variavel "h" para fazer uma rotação de 360
  
  strokeWeight (20);// atribuição de um valor à expessura do outline das figuras
  

//horas--------------------

    float angleh = radians (h);//variavel para converter angulos em radianos
  
pushMatrix();// aplicação para reneiciar a rotação dos valores dos radianos
  rotate (angleh);// atribuição dos valores dos radianos para a rotação
  stroke (255, 0, 0);// definição dos valores das cores
  line (0, 0, 0, 100);//desenho de uma linha
popMatrix();// aplicação para finalizar a rotação dos valores dos radianos


//minutos-----------------
    float anglem = radians (m);//variavel para converter angulos em radianos
  
pushMatrix();// aplicação para reneiciar a rotação dos valores dos radianos
  rotate (anglem);// atribuição dos valores dos radianos para a rotação
  stroke (0, 0, 255);// definição dos valores das cores
  line (0, 0, 0, -140);//desenho de uma linha
popMatrix();// aplicação para finalizar a rotação dos valores dos radianos

  
    //segundos-----------------
  float angles = radians (s);//variavel para convertar angulos em radianos
  
pushMatrix();// aplicação para reneiciar a rotação dos valores dos radianos
  rotate (angles);// atribuição dos valores dos radianos para a rotação
  stroke (0, 255, 0);// definição dos valores das cores
  line (0, 0, 0, -180);//desenho de uma linha
popMatrix();// aplicação para finalizar a rotação dos valores dos radianos
  
  //numeração
 stroke (0);// definição dos valores da cor da espessura do outline
 fill (0);// sem preenchimento
 ellipse (0, 0, 20, 20);// desenho de uma ellipse
  
  s = second();//redifinição dos valores da variavel "s" para os segundos reais
  m = minute();//redifinição dos valores da variavel "m" para os minutos reais
  h = hour();//redifinição dos valores da variavel "h" para as horas reais
  
  fill (255);// atribuição dos valores da cor
  text ("S:" + s, 200, 200);//desenho de texto
  text ("M:" + m, 200, 250);//desenho de texto
  text ("H:" + h, 200, 300);//desenho de texto
  
  
}
  
  

