

void setup(){/*Função que serve para fazer as definições*/
 size(500,500);//tamanho da tela
 smooth();//suavizar as formas
 noLoop();//definir para que não haja loop na composição

}

void draw(){/*Função para desenhar*/
 background(100);//cor de fundo
 for (int i = 0; i < 200; i = i+1){//ciclo para a ellipse 1 até desenhar 200 objectos
 float PosX = random(width/4-50,width/4+50);// variavel da posição x da ellipse 1
 float PosY = random(height/4-60,height/4+60);//variavel da posição y da ellipse 1
 float tam = 20;//variavel do tamanho da ellipse 1
 float r = random(255);//variavel para a cor vermelha (red) da ellipse 1
 float g = random(255);//variavel para a cor verde (green) da ellipse 1
 float b = random(255);//variavel para a cor azul (blue) da ellipse 1
 fill(r,g,b,70);//cor da ellipse 1
 ellipse(PosX,PosY,tam,tam);//desenho das ellipses 1
 }
 
//.................................................................
 for (int a = 0; a <200; a = a+1){//ciclo para a ellipse 2 até desenhar 200 objectos
  float PosX2 = random(width-width/4-50,width-width/4+50);//variavel de x da ellipse2
  float PosY2 = random(height-height/4-60,height-height/4+60);//variavel de y da ellipse2
  float tama = 20;//variavel do tamanho da ellipse2
  float r2 = random(255);//variavel da cor vermelha (red) da ellipse2
  float g2 = random(255);//variavel da cor verde (green) da ellipse2
  float b2 = random(255);//variavel da cor azul (blue) da ellipse2
  fill(r2,g2,b2,70);//cor da ellipse2
  ellipse(PosX2,PosY2,tama,tama);//desenho das ellipses2
 }
//.................................................................
 for (int f = 0; f <200; f = f+1){//ciclo dos triângulos até desenhar 200 objectos
  float PosX3 = random(width/2-30,width/2+30);//variavel de x1 dos triângulos
  float PosY3 = random(0,height);//variavel de y1 dos triângulos
  float PosX3b = random(width/2-30,width/2+30);//variavel de x2 dos triângulos
  float PosY3b = random(0,height);//variavel de y2 dos triângulos
  float PosX3c = random(width/2-30,width/2+30);//variavel de x3 dos triângulos
  float PosY3c = random(0,height);//variavel de y3 dos triângulos
  float g3 = random(255);//variavel da cor verde (green) dos triângulos
  fill(0,g3,0,50);//cor dos triângulos
  //triangle(x1,y1,x2,y2,x3,y3)
  triangle(PosX3,PosY3,PosX3b,PosY3b,PosX3c,PosY3c);//desenho dos triângulos
 } 
 
}


