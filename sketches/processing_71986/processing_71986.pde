
void setup() {
  size(400,400);
  
}

void draw() {
  
  fill(255);
  noStroke();
  ellipse(mouseX, mouseY, 10,10);
  
}

void mousePressed() {
  
  fill(255,0,0,50);
  noStroke();
  rect(0,0,width,height);
  
  }
