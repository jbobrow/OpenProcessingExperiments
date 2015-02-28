
// conditionals II
// multiple choices
// multiple conditions

void setup() {
  size(300, 300);  
  colorMode(HSB);
}

//--------------------------------------------------------
void draw() {
  background(64);
  
  // bottom right
  if (mouseX > width/2 && mouseY > height/2) {
    fill(0, 255, 255);
    rect(width/2, height/2, width/2, height/2);
  }
  // top right
  else if (mouseX > width/2 && mouseY < height/2) {
    fill(16, 255, 255);
    rect(width/2, 0, width/2, height/2);
  }
  // top left
  else if (mouseX < width/2 && mouseY < height/2) {
    fill(32, 255, 255);
    rect(0, 0, width/2, height/2);
  }
  // bottom left
  else if (mouseX < width/2 && mouseY > height/2) {
    fill(48, 255, 255);
    rect(0, height/2, width/2, height/2);  
  }
}


