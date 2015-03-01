
// More fun and games with what-if mathematics.
// What if the stars in the Milky Way were formed at an even time interval across the existence of the galaxy?
// This graphic plays with that concept.
// Each star represents approx. 2.4 billion stars.
// Each second represents approx. 100 million years.

import java.util.Random;

PImage img;
int x, y;
Random rand = new Random(641);

void setup() {
  size(640, 480);
  background(000);  
  img = loadImage("http://i.imgur.com/VN5xRb9.png");
}

void draw() {
  frameRate(1);
  image(img, 0, 300);
    
    int ms = second();  
    if (ms % 1 == 0) {
      x = rand.nextInt(641);
      y = rand.nextInt(481); 
      
      pushMatrix();
      translate(x, y);
      star(0, 0, 3, 10, 10); 
      popMatrix();
    } else {
      x = 0;
      y = 0;
    }
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
