
float bola;
float cor;
int tmn;

void setup () {
frameRate (800);
size (600,500);
background (255);
  
}

void draw () {
   if (mousePressed == true) {
  fill (random (255),random (255),random (255));
  noStroke ();
  //stroke (random (255),random (255),random (255));
  ellipse (300, 250, random (900),random (800));
  rotate (PI/3.0);
   }
}  
