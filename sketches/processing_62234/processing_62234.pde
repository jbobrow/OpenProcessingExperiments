
int x = 250;
int y = 250;
int w = 200;
int h = 150;

void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(0, 0, 255);
  stroke(100);

  if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {

    fill(0, 255, 0);
  }  
  else {
    fill(255, 0, 0);
  }

  rect(x, y, w, h);
} 


