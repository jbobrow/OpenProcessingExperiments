

int totalObjectos; // numero total de objectos

float posX, posY; // variaveis para a posição horizontal e vertical dos objectos
float posX_2, posY_2;// variaveis para a posição horizontal e vertical dos objectos
float tamanho;// variavel para o tamanho dos objectos
float tamanho2;// variavel para o tamanho dos objectos
float r,g,b; // variaveis para a cor 
float s; // variavel que estipula a espessura do stroke 

float limiteHorizontal, limiteVertical; // variaveis para o limite horizontal e vertical onde se vão compreender os objectos 


void setup() { // definição dos elementos estáticos 
  
size(500,500);// define a área de composição
  background (255); // define a cor de fundo
  smooth();// suaviza a composição
  /*noLoop();*/ // o comando que não permite movimento está invisivel ou seja, a composição terá movimento
  
 
  totalObjectos = 500;// numero total de objectos
  limiteHorizontal = 100;// a composição terá limite horizontal em 100
  limiteVertical = 100; // a composição terá limite vertical em 100

}

void draw(){ //
  background(255);// define a cor de fundo para que o fundo se mantenha sempre branco
  
  for ( int i = 0; i <totalObjectos; i++) // função em que a composição começa em 0 até o numero total de objectos, que neste caso são 500
  {
     posX = random (width/2-limiteHorizontal, width/2 +limiteHorizontal); // define que a posição horizontal varia entre metade da altura da janela menos o limite horizontal(100) 
     posY = random (height/2-limiteVertical, height/2 + limiteVertical); // define que a posição vertical varia entre metade da largura da janela menos o limite vertical (100)
     posX_2 = random (width/2-limiteHorizontal, width/2 +limiteHorizontal); // define que a posição horizontal varia entre metade da altura da janela menos o limite horizontal(100)
     posY_2 = random (height/2-limiteVertical, height/2 + limiteVertical); // define que a posição vertical varia entre metade da largura da janela menos o limite vertical (100)
      tamanho = random (width/2-limiteHorizontal, width/2 +limiteHorizontal);// define que o tamanho dos objectos variam entre metade da altura da janela menos o limite horizontal
     tamanho2 = random (width/2-limiteHorizontal, width/2 +limiteHorizontal); // define que o tamanho dos objectos variam entre metade da altura da janela menos o limite vertical
     r = random(255); // define um valor para a componente vermelha entre 0 e 255
     g = random(255); // define um valor para a componente verde entre 0 e 255
     b = random(255); // define um valor para a componente azul entre 0 e 255
     s = random (1,10); // define que a espessura do stroke varia entre 1 a 10
     
     strokeWeight(s);// define que a espessura do stroke varia entre 1 a 10
     fill(r,g,b);// o preenchimento dos objectos com as variáveis RGB 
     triangle(posX,posY,posX_2,posY_2,tamanho,tamanho2);// os triângulos vão se situar nas coordenadas anteriormente estipuladas
     
     
  }
  
} 
  
  
  





