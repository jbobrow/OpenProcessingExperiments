
void setup() {
  size(250, 250);
  background(150);
  frameRate(100);
}

void draw() {
  noStroke();
  fill(100,random(100,255),255,50);
  
  if(mousePressed == true) {
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
background(random(50,150));
  }
}
