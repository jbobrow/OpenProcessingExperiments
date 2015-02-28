
/*
Pine Trees
Inspired by : http://simpledesktops.com/browse/desktops/2013/feb/18/pine-trees/
from "Simple Desktops"

Coded by @ramayac
*/
 
int stepx, stepy;
color fondo, color1;

void setup(){
  size(790, 575);
  noStroke();
  
  stepx = 66;
  stepy = 115;
  
  fondo = color(#CFE8CC);
  color1 = color(#4A925C);
  smooth();
}

void draw(){
  background(fondo);
  noStroke();
  
  fill(color1, 175); 
  for(int i = -stepx; i <= width+stepx; i = i+stepx){
    for(int j = -stepy; j <= width+stepy; j = j+stepy){
      triangulo(i, j);
    }
  }
  
  noLoop();
}

void triangulo(int x, int y){
  pushMatrix();
  translate(x, y);
  triangle(0, 115, 66, 0, 135, 115);
  popMatrix();
}
