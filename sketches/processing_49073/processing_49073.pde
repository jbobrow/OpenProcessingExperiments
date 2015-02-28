
void setup() {
  size(600, 400);
  smooth();
}

void draw() {
  if (mousePressed) {
    fill(255,165,0);
  } else {
    fill(160,32,240);
  }
 
  
triangle( mouseX, mouseY, 240, mouseX, mouseY, 240);
}


