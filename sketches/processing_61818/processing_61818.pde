
void setup(){
  size(500,500);
  background(255);
  smooth();
}
/*definições do programa*/

void draw(){  
  float x3= random(50,100);
  float x4= random(50,100);
  float y3= random(50,100);
  float y4= random(50,100);
  /*definição das coordenadas maximas que os pontos podem ter,
  a "bounding" box*/
  fill(0);
  /*com cor preta*/
  strokeWeight (1);
  /*tamanho de linha 1*/
  line (x3,y3,x4,y4);
  /*as linhas*/
  
  float x1= random(125,375);
  float x2= random(125, 375);
  float y1= random(125,375);
  float y2= random(125,375);
  fill(0);
  strokeWeight (1);
  line (x1,y1,x2,y2);
  /*o mesmo so que em maior*/
}

