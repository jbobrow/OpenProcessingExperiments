
void setup() {
  size(600, 600);
  background(0);
  float w = 60;
  float trans=80;
  float r=120;
  smooth();
  for (float x=30; x<= width-30; x=x+60) {
    for (float y=30;y<=height-30;y=y+60) {
      stroke(255);
      strokeWeight(w);
      point(x+random(-8,8), y+random(-8,8));
      w = random (30,75);
     
      
    }
  }
}


