
//Author: Dulce Andino
//Purpose: Assignment 2 ;"A Window with a View"
//Concept: Spiral Illusion through Ellipses
//Reference: Circular Paths in Processing--> http://www.youtube.com/watch?v=MOec_tdnx8A
//           An Empty Aquarium by C.S. You (time related info)
//           http://processing.org/reference/


void setup() {
  size (500, 500);
  background (0);
  stroke(r, g, b);
  smooth();
  int x=1;
}

float x1, y1, rad1;
int deg=0;
int r=255;
int g=255;
int b=255;

int A=second();
int B=minute();


// completes 360 degrees every 3 seconds(clockwise)
void espiralUno() {

  deg=deg+5/A; 
  rad1=(PI/180)*deg;
  x1=sin(rad1)*80+(width/2);
  y1=cos(rad1)*80+(height/2);
  stroke(r, g, b);
  noFill();
  ellipse (x1, y1, 80, 80);
  if (deg>=360) {
    r=floor(random(255));
    g=floor(random(255));
    b=floor(random(255));
    deg=0;
  }
}
//completes 360 degrees every second (counter-clockwise)
void espiralDos() {
  deg=deg+3; 
  rad1=(2*PI/180)*deg;
  x1=sin(-rad1)*140+(width/2);
  y1=cos(-rad1)*140+(height/2);
  stroke(b, r, g);
  noFill();
  ellipse (x1, y1, 60, 60);
}
//completes 360 degrees every 3 seconds    (clockwise)
void espiralTres() {
  deg=deg+2/B; 
  rad1=(PI/180)*deg;
  x1=sin(rad1)*195+(width/2);
  y1=cos(rad1)*195+(height/2);

  stroke(r, b, g);
  noFill();
  ellipse (x1, y1, 90, 90);
}


void draw() {

  espiralUno();
  
  espiralDos();
 
  espiralTres();
}

void keyPressed() {
  saveFrame("espirales-####.jpg");
}
 


