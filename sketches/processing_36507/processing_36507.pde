
Boolean drawing;

void setup() {
  
  size(300, 300);
  drawing = false;
}

void draw() {
  background(0);
  
  if (mouseY < height/2) {
    fill(0,0,255);
    rect(25, 25, 25, mouseY);
    fill(0,255,0);
    rect(0, 25, mouseX, 25);
  }
  
  if (mouseY < height/2) {
    fill(255,0,0);
    ellipse(width/2, mouseY, 55, 55);
  }
  
  if (mouseY > height/2) {
    fill(255,0,0);
    rect(150, 200, mouseX, 25);
    fill(0,0,255);
    rect(100, 150, 25, mouseY);
    
    
  }
  if (mouseY > height/2) {
    fill(0,255,0);
    ellipse(width/2, mouseY, 55, 55);
  }
}

