
void setup() {
  size(600, 600);
  background(0);
}


void draw() {
  
  stroke(0);
  strokeWeight(5);
  fill(255);
  ellipse(mouseX, mouseY, 100, 100);

  stroke(255);
  strokeWeight(5);
  fill(0);
  ellipse(mouseY, mouseX, 100, 100);
  


if(mousePressed) {


    background(0);
  }
}

