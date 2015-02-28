
void setup() {
  size(600, 600);
  background(0);
  strokeWeight(60);
  float trans=80;
  float r=120;
  int abst = 60;
  int abst2 = 60;
  smooth();
  for (float x=30; x<= width; x=x+abst) {
    for (float y=30;y<=height;y=y+abst2) {
      stroke(255);
      point(x, y);
      if(random(100)<20) {
      abst=100;
      } else {
        abst=60;
      }
     if(random(100)<20) {
      abst2=100;
      } else {
        abst2=60;
      }
    }
  }
}


