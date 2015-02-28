
void setup() {
 size(600, 600);
 smooth();
}


void draw() {
  if (mousePressed == true) {


    fill(0, random(255), random(255), 50);
    ellipse(mouseX, mouseY, dist (pmouseX, pmouseY, mouseX, mouseY), dist (pmouseX, pmouseY, mouseX, mouseY));
  }
  
 stroke(255);
 strokeWeight(4);
 smooth();
 // Draw if mouse is pressed
   line(pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed () {
 if (key == 's') {
   println("Frame abspeichern");
   saveFrame("screenshot-####.tif");
 }
}



