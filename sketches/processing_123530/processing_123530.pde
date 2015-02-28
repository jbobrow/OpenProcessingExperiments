
float x, y;
float angle = 0;
float ma = 3;
float r = 150;
float mr = .1;


void setup() {
  size(400, 400);
  background(0);
}


void draw() {
  fill(random(255), random(255), random(255));  
  float x = cos(radians(angle))*r + 200;
  float y = sin(radians(angle))*r + 200;
  ellipse(x, y, 25, 25);
  angle -= ma;
  r-=mr;
  if (r<20)mr*=-1;
  if (r>150)mr*=-1;
}



