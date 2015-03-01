
void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  if (mousePressed) {
    fill(255);
    noStroke();
    rect(0,0,500,500);
    stroke(20);
    fill(20);
    line(width, height, mouseX, mouseY);
    line(0, 0, mouseY, mouseX);
    line (width, 0, mouseX, mouseY);
    line (0, height, mouseY, mouseX);    
    ellipse(mouseX,mouseY,2,2);
    ellipse(mouseY,mouseX,2,2);
    
  } else { 
    fill(255);
    noStroke();
    rect(0,0,500,500);
    stroke(100);
    fill(100);
     line(width, height, mouseX, mouseY);
    line(0, 0, mouseY, mouseX);
    line (width, 0, mouseX, mouseY);
    line (0, height, mouseY, mouseX);
    ellipse(mouseX,mouseY,2,2);
    ellipse(mouseY,mouseX,2,2);
  }
}

