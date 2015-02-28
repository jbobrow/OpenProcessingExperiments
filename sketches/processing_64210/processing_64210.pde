
float r ;
float g ;
float b ;
float a ;
float depronto ;
float es ;
float num ;



void setup() {
  size(400,400);
  smooth();
  background(20,0,7);
  frameRate(30);
}

void draw() {
  r = random(255);
  g = random(255);
  b = random(30);
  a = random(155);
  depronto = random(width);
  es = random(height);
  num = random(10);

  noStroke();
  fill(r,g,b,a);
  triangle(depronto,es,num,num,mouseX,mouseY);
}

void keyPressed() {
  background(r,g,b);
}
