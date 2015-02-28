


void setup() {
  size(500, 500);
  smooth();
  background(0);
}


void draw() {
  for (float x=0; x>=0 && x<=width/2; x+=20) {
    for(float y=0;  y>=0 && y<=height; y+=20) {
      fill(random(45, 100), 150);
      ellipse(width/2+x, height/2, 20, 20);
      fill(random(100, 250), random(45, 100), random(45, 100), 10);
      ellipse(width/2, height/2, x, x);
      fill(random(100, 200), random(200, 255), random(200, 255), 40);
      rect(x, y, 15, 15);
    }
  }
}



