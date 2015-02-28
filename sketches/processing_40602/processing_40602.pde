
// a simple program to draw wandering paths

float x1,x2,y1,y2;
color c1,c2;

void setup(){
  size(200,200);
  background(200);
  x1 = random(50,150);
  y1 = random(50,150);
  x2 = random(50,150);
  y2 = random(50,150);
  c1 = color(255);
  c2 = color(150);
}

void draw(){

  x1 = x1 + random(-1,1);
  y1 = y1 + random(-1,1);
  x2 = x2 + random(-1,1);
  y2 = y2 + random(-1,1);

  stroke(c1);
  point(x1,y1);
  stroke(c2);
  point(x2,y2);
} 

                
