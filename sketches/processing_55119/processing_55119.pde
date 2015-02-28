
void setup() {
  size (450,450);
  background (#79d0ed);
  smooth();
}

void draw() {
  noStroke();
  fill(255,30);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,random(25,60),random(25,60));
}

void keyPressed(){
  tint (255,20);
}
 

void mouseClicked() {
  if (mouseButton == LEFT) {
    background (#79d0ed);
  }
}
