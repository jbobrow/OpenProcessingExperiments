
void setup() {
  size(600, 600);
  background(80,30,50);
  strokeWeight(2);
  float trans=80;
  float r=120;
  smooth();
  for (float x=0; x<= width; x=x+random(1,6)) {
    for (float y=0;y<=height;y=y+random(1,6)) {
      stroke(r,70,90,trans);
      point(x+random(-15,15), y+random(-15,15));
     
    }
  }
}


