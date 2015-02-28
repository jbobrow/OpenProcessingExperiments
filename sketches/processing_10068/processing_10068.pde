
float angle = 0.0;
float speed = 0.05;
float radius = 30.0;
float sx = 3.0;
float sy = 1.0;

void setup(){
  size(100,100);
  noStroke();
  smooth();
}

void draw(){
  fill(0,4);
  rect(0,0,width,height);
  angle += speed;
  float sinval = sin(angle);
  float cosval = cos(angle);
  float x = 50 + (cosval*radius);
  float y = 50 + (sinval*radius);
  fill(255);
  ellipse (x,y,2,2);
  float x2 = x + cos(angle*sx)*radius/2;
  float y2 = y + sin(angle*sy)*radius/2;
  ellipse(x2,y2,6,6);
}
  

