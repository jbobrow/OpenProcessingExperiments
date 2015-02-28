
int counter;

void setup() {
  size(200, 200);
  background(255);
  smooth();
  noStroke();
}

void draw(){
  if (frameCount % 10 == 0) {
    fill(frameCount * random(255) % random(255), frameCount * 5 % random(255),
      frameCount * random(7) % random(255));
    pushMatrix();
    translate(random(100), random(100));
    rotate(radians(frameCount * 2  % 360));
    rect(20, -20, 100, 10);
    popMatrix();
  }
}

