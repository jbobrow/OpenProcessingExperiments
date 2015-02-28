
int i = 10;
int w = i/5;


void setup(){
  size (500, 500);
  smooth();
  background (30);
  }

void draw(){
  if (mousePressed && (mouseButton == LEFT)) {
  strokeWeight(w);
  fill(250,250,0,40);
  ellipse(mouseX, mouseY, i, i);
  i = i + 10;
  } else {
  i = 10;
  }
}
