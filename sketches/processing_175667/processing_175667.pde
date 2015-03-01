
void setup() {
  size(500,400);
  background(#DC1DF2);
  colorMode(HSB,306,85,96);
  smooth();
}

void draw() {
  
 if (mousePressed) {
    rect(mouseX,mouseY,60,60); // different shape
    fill(random(247),35,223);
  } else {
    fill(random(28),211,173);
  }
  ellipse(mouseX,mouseY,60,60); //click on mouse so it changes shape

 }
