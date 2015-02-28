
 int x = 0;
  int y = 0;

void setup() {
  size(800,800);
  frameRate(120);
  background(0);
  smooth();
  noStroke();
 
}

void draw() {
  x = mouseX;
  y = mouseY;
  if (mouseY<400) {
ellipse(x,y,20,20);
  fill(random(0,255),random(0,255),random(0,255),random(0,100));
 
  } else {
 
  ellipse(x,y,20,20);
  fill(random(0,255),random(0,255),random(0,255));
}
}

