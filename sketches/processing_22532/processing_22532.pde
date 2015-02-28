
//create a brush stroke

void setup() {
 size(300, 300);
 background(0);
}


void draw() {
 stroke(135,50,96);
 strokeWeight(4);
 smooth();
 // Draw if mouse is pressed
 if (mousePressed) {
  line(pmouseX, pmouseY, mouseX, mouseY);
 }
}

