
void setup() {
  size(600, 600);
}

void draw() {
  background(100);
  if (mouseY<=height/2 && mouseX<=width/2) {
    fill(255, 0, 0); 
    ellipse(width/2, height/2, 100, 100);
  } 
  else if (mouseY<=height/2) {
    fill(0, 255, 0); 
    ellipse(width/2, height/2, 100, 100);
  }
  if (mouseX<=width/2 && mouseY>=height/2) {
    fill(255, 0, 0); 
    rect(width/2-50, height/2-50, 100, 100);
  }
}


