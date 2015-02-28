
int posx;
int posy;
/* definit as variaveis para a posição*/

void setup (){
  size (500,500);
  smooth();
  posx=100;
  posy=100;
}  
/* as definições do programa mais os valores iniciais das posições*/

void draw(){
  background(0);
  noStroke();
  fill (random(255), random(255), random(255));
  /* definir a cor do background e fazer o randam da cor das "bolas"*/
  
  ellipse (posx, 100, 100, 100);
  posx=posx+5;
  /*bola a mexer na horizontal*/
  
  ellipse (100, posy, 100, 100);
  posy=posy+5;
  /*bola a mexer na vertical*/
  
  ellipse (posx, posy, 100,100);
  /*bola a mexer na diagonal*/
  
  if (posx>width){
    posx=0;
  }
  
  if (posy>height){
    posy=0;
  }
  /*condição que faz com que quando as posições forem igual a largura e altura
  da janela a valor da posição é alterado para 0, começando assim de novo a 
  animação*/
}

