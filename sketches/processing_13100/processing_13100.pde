
float y= 25.0;
float speed= 3.0;
float angle=0.0;
float x=0;
float z=0;
float a=20.0;
void setup ()  {
  size (800,800);
  background (100,75,250);
  smooth();
  
}

void draw() {
  fill (200, 70, random(255));
  
  angle= (angle + 0.05);
  if (keyPressed) {
    if (key=='v'){
      z=z+1;
  rotate(angle);
  translate(120,z);
}
  
  }
  if (keyPressed) {
    if (key=='b'){
      x=x+1;
      rotate (angle+8);
      translate (x,120);
  fill (200, random(255),70);
  }
  rect (0, 70,a,a);
}
}

