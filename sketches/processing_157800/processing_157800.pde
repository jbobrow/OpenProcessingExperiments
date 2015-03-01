
void setup() {
  size(640, 640);
}

void draw() {
  fill(0, 50);
  rect(-1, -1, width+1, height+1);
  translate(width/2, height/2);
  for (int x = -100; x <= 100; x+=10) {
    for (int y = -100; y <= 100; y+=10) {
      float d = dist(x, y, 0, 0);
      float d2 = sin(radians(d))*d;
      stroke(0, 150, 255, 255-d2*3);

      pushMatrix();
      translate(x*2, y*2);
      rotate(radians(frameCount));
      line(x, y, 0, 0);
      popMatrix();
      
      pushMatrix();
      translate(x*2, y*2);
      rotate(radians(-frameCount));
      line(x, y, 0, 0);
      popMatrix();
    }
  }
}



