
int pensize = 10;

void setup() {
  size(500,400);
  background(0,255,0);
}

void draw() {
  stroke(237,19,219);
  fill(0);
  
  if (mousePressed) {
    ellipse(mouseX, mouseY, pensize, pensize);
  }
}

// switch pensize back and forth every time a key is pressed
void keyPressed() {
  if (pensize == 10) {
    pensize = 20;
  } else if (pensize == 20) {
    pensize = 30;    
  } else {
    pensize = 10;
  }
}
