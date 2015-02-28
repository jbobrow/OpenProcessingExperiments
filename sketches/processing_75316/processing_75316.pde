
int dimensione;
float x;


void setup() {
  size (400, 400, P2D);
  smooth(4);
  background(172, 157, 240);
}


void draw() {
  x= random (200);
  fill(x, x+20, x+150);
  ellipse (width/2, height/2, dimensione , dimensione);
  if (mousePressed) {
   dimensione = dimensione + 1;
  }
  
 if (dimensione > width) {
    dimensione=0;
  }


  }
