
void setup() {
  size (300, 300);
  colorMode(HSB);
  smooth();
}


void draw() {
  background(0);
  ellipseMode(CENTER);
  for (int x=0; x<320; x+=15) {     //first ellipse - more often
    for (int y=25; y<300; y+=50) {  //second ellipse  - less often
      noFill();
      stroke(180, x, x);             //gradiant stroke of blue
      ellipse(x, y, 35, 80);
    }
  }
}


