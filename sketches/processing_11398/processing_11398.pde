
float r;
float g;
float b;
float a;
float x;
float y;

void setup(){
  size(200,200);
  background(255);
  rectMode(CENTER);
  smooth();
}

// paint rectangles in random colors and radnom size by mousemoving. :)
void draw(){
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  x = random(50);
  y = random(50);
  stroke(r,g,b,a);
  fill(r,g,b,a);
  rect(mouseX,mouseY,x,y);
}

