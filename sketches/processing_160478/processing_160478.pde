
int lineThickness =10;


void setup(){
  size (400,400);
  strokeWeight (lineThickness);
  background (255);
}

void draw() {
  if (mousePressed) {
    line (pmouseX, pmouseY, mouseX, mouseY);
    stroke((random(255)),(random(255)),random(255));

  }
}

