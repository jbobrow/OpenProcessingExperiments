
int counter;

// definitions for the sketch
void setup() {
  size(300, 200);

  background(80, 120, 30);
}

void draw() {

  if (mousePressed) {
    fill(230, 15, 10);
    rect(mouseX, mouseY, 30, 30);
  } 
  else {
    fill(255);


    //mouseX
    //mouseY
    ellipse(mouseX, mouseY, 30, 30);
  }
}
