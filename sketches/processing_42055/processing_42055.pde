
void setup() {
  size (800, 800);
  background (100);
  smooth ();
}
void draw () {
  stroke (random(255), random(255), random(255));
  strokeWeight (10);
  line (mouseX,400, pmouseX, pmouseY);
}


                
                
