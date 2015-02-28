
int counter;

void setup() {
  size(1000, 500); 
 
  }

void draw() {
  background(255);
  noStroke();
  fill(255,0,250,255);
  ellipse(900, mouseY, 20, 20);
  fill(0,250,255);
  ellipse(mouseX, 10, 20, 20);
  fill(10,250,50);
  ellipse(mouseX, mouseY, 20, 20);

  }
