
int x = 0;
int geschwindigkeit = 1;
 
void setup() {
  size(800, 200);
  smooth();
  background(255);
}

void draw() {
  x = x + geschwindigkeit;
  if ((x > width) || (x < 0)) {
    geschwindigkeit = geschwindigkeit * -1;
  } 
  stroke(0, 20);
  strokeWeight(random(10));
  noFill();
  // draw line
  line(x + random(-10,10), 0, x + random(-10,10), random(height));
  
  // save thumbnail when mouse is pressed
  if (mousePressed) {
    saveFrame("thumbnail.png");
  }
}




