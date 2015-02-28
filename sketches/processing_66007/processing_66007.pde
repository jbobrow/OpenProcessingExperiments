
/*

Clone 1 
Inspired by : http://simpledesktops.com/browse/desktops/2012/jul/20/clone/
from "Simple Desktops"
 
Coded by @ramayac
*/

int stepw = 40;
int steph = 35;
color tope, izquierda, derecha;

void setup(){
  size(600, 400);
  noStroke();
  setColorH();
  setColorV();
  //background(255);
  //smooth();
}

void setColorH(){
  tope = color(71, 191, 166);
}

void setColorV(){
  izquierda = color(94, 209, 184);
  derecha = color(179, 227, 207);
}

void incColorHorizontal(){
  //if(c%4 != 0) return;
  float r = red(tope)+7.55;
  float g = green(tope)+1.65;
  float b = blue(tope)-0.25;  
  tope = color(r, g, b);
}

void incColorVertical(){
  float r = red(izquierda)+9.6;
  float g = green(izquierda)+2;
  float b = blue(izquierda)-5;
  izquierda = color(r, g, b);
  
  r = red(derecha)+3.9;
  g = green(derecha)+1;
  b = blue(derecha)-0.75;
  derecha = color(r, g, b);
}

//As you can see, the drawing is quite simple.
void draw(){
  background(color(94, 209, 184));

  for(int j = -35; j < height+steph; j=j+steph){ 
    
    setColorH();
    for(int i = -20; i < width+stepw; i=i+stepw){
      if(j%2 == 0){
        cuadro(i+20, j);
      } else {
        cuadro(i, j);
      }
      
      incColorHorizontal();
    }
    incColorVertical();
  }
  
  noLoop();
}

//Here we draw 3 quads to look like a cube.
void cuadro(int x, int y){
  pushMatrix();
  translate(x, y);
  
  fill(tope);
  quad(0, 10, 20, 0, 40, 10, 20, 20); //tope
  
  fill(izquierda);
  quad(0, 10, 20, 20, 20, 45, 0, 35); //izquierda
  
  fill(derecha);
  quad(20, 20, 40, 10, 40, 35, 20, 45); //derecha
  
  popMatrix();
}
