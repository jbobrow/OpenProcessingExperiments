
/*
Grid
Inspired by : http://simpledesktops.com/browse/desktops/2013/feb/14/the-grid/
from "Simple Desktops"

Coded by @ramayac
*/
 
int stepw = 40;
int steph = 35;
color cuerpo, borde;
int k = 0, l = 0;
//#174C4F, cuerpo
//#207178, borde
 
void setup(){
  size(800, 600);
  noStroke();
  cuerpo = color(#174C4F);
  borde = color(#207178);
  smooth();
  frameRate(24);
}

void draw(){
  background(cuerpo);
  noFill();
  stroke(borde);
 
  k++; l++;
 
  for(int j = -35*2; j < height+steph; j=j+steph){
    for(int i = -20*2; i < width+stepw; i=i+stepw){
      if(j%2 == 0){
        cuadro(i+20+k, j+l);
      } else {
        cuadro(i+k, j+l);
      }
    }
  }
  
  if(l>=steph*2) l = 0;
  if(k>=stepw) k = 0;
  
  //noLoop();
}
 
//Here we draw 3 quads to look like a cube.
void cuadro(int x, int y){
  pushMatrix();
  translate(x, y);
  quad(0, 10, 20, 0, 40, 10, 20, 20); //up
  quad(0, 10, 20, 20, 20, 45, 0, 35); //left
  quad(20, 20, 40, 10, 40, 35, 20, 45); //right
  popMatrix();
}
