
float r;
float g;
float b;
float a;
float diam;
float x;
float y;
float stroke;

void setup () {
  size (1360,720);
  background (175);
  smooth ();
}

void draw (){
  r = random (255);
  g = random (255);
  b = random (255);
  a = random (255);
  diam = random (120);
  x = random (width);
  y = random (height);
  
  stroke = random (100);
  fill (r,g,b,a);
  ellipse (x,y,diam,diam);
}



