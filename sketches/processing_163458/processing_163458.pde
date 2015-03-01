
  float y = 0.0;

void setup() {
  size(500,500);
}

void draw() {
  frameRate(40);
  println(frameCount);
  background(y*.5,100,100);
  y += .85;
  noStroke();
  fill(y/2,150,y/.9999999);
  rect(0,y,500,y-200);
  if (y>500) {
    y = 0;
  }
}


