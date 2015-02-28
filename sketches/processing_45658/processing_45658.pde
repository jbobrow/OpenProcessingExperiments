
void setup() {
  size (600, 600);
  background (0);
  smooth ();
}
void draw () {
  stroke (random(255), random(255), random(255));
  strokeWeight (5);
  line (mouseX,300, pmouseX, pmouseY);
}
 
void keyPressed() {
     if (key== DELETE) background(0);
  }

