
void setup() {
  size(400,410);
}

void draw() {
  background(0);
  stroke(0);
  
  if (mouseX <= (width / 2) && mouseY <= (height / 2)) {
    fill(255, 0, 0);
    rect(0, 0, width / 2, height / 2);
  }
  
  if (mouseX > (width / 2) && mouseY <= (height / 2)) {
    fill(0, 255, 0);
    rect(width / 2, 0, width / 2, height / 2);
  }
  
  if (mouseX <= (width / 2) && mouseY > (height / 2)) {
    fill(0, 0, 255);
    rect(0, height / 2, width / 2, height / 2);
  }
  
  if (mouseX > (width / 2) && mouseY > (height / 2)) {
    fill(255, 255, 0);
    rect(width / 2, height / 2, width / 2, height / 2);
  }
  
  for (int i = 0; i < 256; i++) {
    fill(255, 255 - i, 255 - i);
    noStroke();
    rect(i + (i * 1), height - 10, 2, 10);
  }
} 




