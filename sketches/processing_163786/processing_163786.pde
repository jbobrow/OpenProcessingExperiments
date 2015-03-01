
void setup() {
  size(600,600);
  frameRate(5);
  smooth(200);
}

void draw() {
  background(#251C5F);
  fill(255,255,0);
  ellipse(100,100,100,100); //the moon

  stroke(255,167,223);
  strokeWeight(random(2));
  for (float x=0; x< width; x+=7) {
    float rainX = random(0, width);
    float rainSz = random(5, 10);
    line(rainX, x, rainX, x + rainSz);
  }
}

