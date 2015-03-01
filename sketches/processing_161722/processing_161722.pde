
void setup() {
  size(640, 640);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  fill(255, 20);
  rect(width/2, height/2, width, height);
  translate(width/2, height/2);
  fill(0, 10);
  for (int i = 0; i < 360; i+=6) {
    float x = sin(radians(i)) * 150;
    float y = cos(radians(i)) * 150;
    pushMatrix();
    translate(x, y);
    rotate(i-radians(frameCount));
    rect(0, 0, 100, 100);
    popMatrix();
  }
}



