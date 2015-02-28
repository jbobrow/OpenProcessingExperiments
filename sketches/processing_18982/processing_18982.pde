
// conditionals I

void setup() {
  size(300, 300);  
}

//--------------------------------------------------------
void draw() {
  background(64);
  
  if (mouseX > width/2) {
    rect(width/2, 0, width/2, height);
  }
  else {
    rect(0, 0, width/2, height);  
  }
}

