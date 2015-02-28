
PImage b;


void setup(){
  size (640, 480);
  smooth();
  b=loadImage ("Testtubes.png");
   image (b, 0, 0, 640, 480);
}
void draw(){
  background (255);
  
  fill (#ED1C24);
  int s=second();
  rect (219, 480, 55, -s*8);
 
  fill (#FFF200);
  int m=minute();
  rect (290, 480, 60, -m*8);
  
  fill (#19FF00);
  int h=hour();
  rect (360, 480, 100, -h*20);
  
   image (b, 0, 0, 640, 480);
  
}

