
void setup() {
  size(600, 600);
  background(80,30,50);
  strokeWeight(2);
  float trans=80;
  float r=120;
  smooth();
  for (float x=0; x<= width; x=x+random(8,20)) {
    for (float y=0;y<=height;y=y+random(8,20)) {
      stroke(r,70,90,trans);
      point(x+random(-15,15), y+random(-15,15));
     if (random(100)<10) {
       strokeWeight(random(10,50));
     } else {
       strokeWeight(random(10));
     }
       
    }
  }
}


