
void setup() {
 size(700, 700);
 background(0);
}


void draw() {
 stroke(random(255));
 strokeWeight(100);
 smooth();
 // Draw if mouse is pressed
 if (mousePressed) {
   line(pmouseX, pmouseY, mouseX, mouseY);
 }
}


