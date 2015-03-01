

  float x;
  float y; 

void setup() {
  size(600, 600);
  background(#B70909);
  fill(#4A51F5);
  stroke(#4A51F5);
}

void draw() {
  
if(mousePressed) {
    line(x, y, mouseX, mouseY);
}
      x = mouseX;
      y = mouseY;
}


