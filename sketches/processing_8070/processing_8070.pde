
void setup(){
  size(400,400);
  background(255, 255, 255);
  noFill();
}

void draw(){
  if (mousePressed) {
    stroke(random(255), random(255), random(255));
    ellipse(mouseX,mouseY,random(25),random(25));
  }
}

void keyTyped() {
  background(255, 255, 255);
}

