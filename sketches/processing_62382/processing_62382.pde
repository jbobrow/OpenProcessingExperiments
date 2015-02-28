
void setup() {
  size(800, 800);
  frameRate(60);
  smooth();
}
  
void draw() {
  float spacing = dist (pmouseX, pmouseY, mouseX, mouseY);
  if (spacing > 3) {
    spacing = 3;
  }
  strokeWeight (8-spacing);
  
  line (pmouseX, pmouseY, mouseX, mouseY);
  println (spacing);
}

void mouseClicked () {
  background(random(255), random(255), random(255), 50);
}

  
void keyPressed () {
 if (key == 's') {
   println("Image sichern");
   saveFrame("processing-####.png");
 }
  
}


