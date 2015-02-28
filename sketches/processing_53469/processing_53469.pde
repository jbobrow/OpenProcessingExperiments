
float angle = 0.0;

PShape flash;


void setup(){
  size(500,500);
  smooth();
  background(255);
  flash = loadShape("flash.svg");
  shapeMode(CENTER);
}


void draw(){
  
  float sinVal = sin(angle);
  
  float gray = map(sinVal, -1,1,0,mouseX);
  background(gray);
  angle+=0.1;
  shape(flash, width/2, height/2);
  
}


