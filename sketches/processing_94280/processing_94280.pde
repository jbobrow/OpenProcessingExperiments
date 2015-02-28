
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
  r =(0-75);
  g =(0-100);
  b =(0-50);
  a = random (255);
  diam = random (120);
  x =(mouseX);
  y =(mouseY);

  
  stroke = random (255);
  fill (r,g,b,a);
  ellipse (x,y,diam,diam);
  
  mouseX = mouseX+500;
  
}

 


