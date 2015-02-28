
int totalObjectos; // numero total de objectos

int LAYER2_totalObjectos; // numero total de objectos para a segunda camada


float posX, posY; // variaveis para a posição horizontal e vertical do circulo dos objectos
float r,g,b; // variaveis para a cor dos objectos
float s; // variavel que estipula a espessura do stroke  


void setup() { // definição dos elementos estáticos 
  

  size (600,600);// define a área de composição
  background (0); // define a cor de fundo neste caso preto
  smooth();// suaviza a composição 
  noLoop();// sem movimento 
  
 
  totalObjectos = 500; // definição do total de objectos, neste caso 500
  LAYER2_totalObjectos = 140; // definição do total de objectos na segunda layer
  
  

}

void draw(){ // definição dos elementos em animação
  background(0);//define a cor de fundo para que o fundo se mantenha sempre preto
  
  for ( int i = 0; i <totalObjectos; i++) // função em que a composição começa em 0 até ao numero total de objectos já estipulado
  {
     posX = random (width); // define que a posição horizontal varia entre a largura total
     posY = random (height); // define que a posição vertical varia entre a altura total
     triangle(random(0,width), random(0,height), random(58), random(20), random(86), random(75));// os triangulos 
     r = random(255); // define um valor para a componente vermelha entre 0 e 255
     g = random(255); // define um valor para a componente verde entre 0 e 255
     b = random(255); // define um valor para a componente azul entre 0 e 255
     noStroke();// os objectos não têm contorno
     fill(r,g,b);// o preenchimento dos objectos com as variáveis RGB já definidas anteriormente
  }
  
   for ( int i = 0; i < LAYER2_totalObjectos; i++)//função em que a composição na segunda layer começa em 0 até ao numero total de objectos já estipulado
  {
     posX = random (width*2); // define que a posição horizontal varia entre 0 e o dobro da largura  
     posY = random (height*2); // define que a posição vertical varia entre 0 e o dobro da altura
     fill(0);// o preenhimento dos objectos é preto
     s= random(1,7);// define que a espessura do stroke varia entre 1 a 7 
     stroke(s);// a espessura tem valores entre 1 a 7  
     float diametro =random(0,80);// o diametro dos objectos varia entre 0 a 80
     ellipse(posX,posY,diametro,diametro);// as elipses vão se situar entre 0 e o dobro da largura(posX) e o dobro da altura(posY) e o diametro vai variar entre 0 a 80
  }
}





