
void setup() {
  size(600, 600);
  background(0);
  strokeWeight(63);
  float trans=80;
  float r=120;
  smooth();
  for (float x=30; x<= width-30; x=x+60) {
    for (float y=30;y<=height-30;y=y+60) {
      stroke(255);
      point(x, y);
     
    }
  }
}


