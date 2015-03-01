
float a = 0;

float px, py;
float angle;
float radius =90;
float frequency = .1;

 
void setup(){
  size(500,500);
  smooth();
  noStroke();
  background(255);
}

void draw(){

 float x1 = sin(a) * 50;
 float y1 = cos(a) * 50;

  px = width/2 + cos(radians(angle))*(radius);
  py = height/2 + sin(radians(angle))*(radius);

 
  fill(0,0,128);
 
  ellipse (px+x1, py+y1, 3,3);
  
 angle -= frequency;
  

  a = a + 0.1;
  
}
