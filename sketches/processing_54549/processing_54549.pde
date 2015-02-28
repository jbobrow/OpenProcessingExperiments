


void setup() {
 size(300, 300);
 background(0);
}


void draw() {
 stroke(255);
 strokeWeight(0);
 smooth();
 // Draw if mouse is pressed
 if (mousePressed) {
   line(pmouseX, pmouseY, mouseX, mouseY);
   fill(0);
   rect(pmouseX, pmouseY, mouseX, mouseY);
   ellipse(pmouseX, pmouseY, mouseX, mouseY);
 }
}

