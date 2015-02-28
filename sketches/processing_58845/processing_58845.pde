
void setup() {
  size(1000, 600);
  frameRate(60);
  smooth();
}
 
void draw() {
  if (mousePressed == true) {
 
 
    fill(0, random(255), random(255), 50);
    ellipse(0.01,0.01,0.01,0.01);
  }
 
  float spacing = dist (pmouseX, pmouseY, mouseX, mouseY);
 
  if (spacing > 3) {
    spacing = 3;
  }


  
  strokeWeight (3-spacing);
 
  line (pmouseX, pmouseY, mouseX, mouseY);
}
 
void keyPressed () {
 if (key == 's') {
   println("Image sichern");
   saveFrame("processing-####.png");
 }
 
}



