

float a = 0;
float b = 0;
float c = 0;
float cChange = 1;
 
void setup() {
  size(500, 500);
  colorMode(HSB, 500);
}
 
void draw() {
  background(a, b, c); 
  
  if (mouseX > 0 && mouseX < 500) { 
    a = mouseX + 1;
  }
  if (mouseY > 0 && mouseY < 500) { 
    b = mouseY + 1;
  }
  if (mousePressed) { 
    c = c + cChange;
  }
  if (mousePressed && b > 500 || b < 0) {
    cChange = cChange * -1;
  }
}


