
void setup() {
  size(500, 500);
  smooth();
  background(255);
  frameRate(60);
}

void draw() { 
   noStroke();
   fill(255, 255, 255, 20);
   rect(0, 0, width, height);
   //  big pinky
   bullseye(5, 3, 50, random(200, 255), random(50, 150), random(100, 230), mouseX, mouseY);
   //  little bluey
   bullseye(3, 2, 30, random(0, 100), random(200, 255), random(200, 255), mouseY, mouseX);
   //  little yellowey
   bullseye(3, 2, 30, random(150, 255), random(200, 255), random(0, 180), width-mouseX, height-mouseY);
   }

void bullseye (float rings, float thickness, float spacing, 
                float color1, float color2, float color3, 
                float xPosition, float yPosition) {
  stroke(color1, color2, color3);
  strokeWeight(thickness);
  noFill();
  for (int i=0;i <= rings;i++) {
    ellipse(xPosition, yPosition, i*spacing, i*spacing);
  }
}
