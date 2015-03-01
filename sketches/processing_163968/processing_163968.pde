
void setup() {
  size(640, 640);
  fill(0, 150, 255, 125);
  noStroke();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (int i = 0; i < 360; i+=10) {
    /* Change 60 to any number divisible by 10. */
    if ((i % 60) != 0) {
      float angleX  = sin(radians(i+frameCount*2));
      float angleY  = cos(radians(i+frameCount*2));
      /* Instead of adding 64, try 32 or other numbers. Map mouseX like in my previous sketches. */
      float angleX2 = sin(radians(i+64+frameCount*2));
      float angleY2 = cos(radians(i+64+frameCount*2));
      
      beginShape();
      vertex(angleX * 200, angleY * 200);
      vertex(angleX2 * 200, angleY2 * 200);
      vertex(angleX * 100, angleY * 100);
      vertex(angleX2 * 100, angleY2 * 100);
      endShape();
    }
  }
}



