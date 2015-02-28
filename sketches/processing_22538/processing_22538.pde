
//create a brush stroke

void setup() {
 size(300, 300);
 background(0);
}


void draw() {
 stroke(150,45,68);
 strokeWeight(4);
 smooth();
 // Draw if mouse is pressed
 if (mousePressed) {
   stroke(mouseX,mouseY,80,80);
  line(pmouseX, pmouseY, mouseX,mouseY);
 }
}

