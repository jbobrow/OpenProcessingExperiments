
void setup() {
  size(600, 600);
  frameRate(30);
  smooth();
}

void draw() {
  if (mousePressed == true) {


    fill(0, random(255), random(255), 50);
    ellipse(mouseX, mouseY, dist (pmouseX, pmouseY, mouseX, mouseY), dist (pmouseX, pmouseY, mouseX, mouseY));
  }

  float abstand = dist (pmouseX, pmouseY, mouseX, mouseY);

  if (abstand > 20) {
    abstand = 20;
  }
  strokeWeight (20- abstand); 

  line (pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed () {
 if (key == 's') {
   println("Frame abspeichern");
   saveFrame("screenshot-####.png");
 }
}


