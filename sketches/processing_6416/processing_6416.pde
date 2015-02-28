
void setup() {
  size(200, 200);
  background(255);
  smooth();
}

void draw(){
  if (frameCount % 10 == 0) {
    translate(100, 100);
    fill(frameCount * 3 % 255, frameCount * 5 % 255,
      frameCount * 7 % 255);
    rotate(radians(frameCount * 2)  % 360);
    rect(0, 0, 80, 20);
  }
}



