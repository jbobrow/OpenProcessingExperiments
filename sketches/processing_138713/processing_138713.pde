
/*
 Andor Salga
 March 2014
 Simple MetaBalls WIP
 
 - flattened out nested loop
 - replaced int() with floor() to speed things up
 -
 
 I also have a GLSL metaball demo which is much more
 interesting: http://www.shadertoy.com/view/4dB3Dc
 */

MetaBall balls[];
PImage img;

final int NUM_BALLS = 4;
final float MIN_SIZE = 8.0f;
final float MAX_SIZE = 20.0f;
final int NUM_BANDS = 7;
float BAND;
int HALF_W;
int HALF_H;

class MetaBall {
  private PVector pos;
  private float radius;
  private PVector dir;
  
  MetaBall(float r) {
    this.dir = new PVector(random(-1, 1), random(-1, 1));
    this.dir.normalize();
    this.pos = new PVector(0, 0);
    this.radius = r;
  }

  void update() {
    pos.add(dir);

    if (abs(pos.x) > width/2) {
      dir.x *= -1;
    }
    if (abs(pos.y) > height/2) {
      dir.y *= -1;
    }
  }
}

void setup() {
  size(340, 220, P2D);
  balls = new MetaBall[NUM_BALLS];
  img = createImage(width, height, ALPHA);
  img.loadPixels();

  HALF_W = width/2;
  HALF_H = height/2;

  BAND = 255.0/NUM_BANDS;

  for (int i = 0; i < NUM_BALLS; i++) {
    balls[i] = new MetaBall(random(MIN_SIZE, MIN_SIZE*1.5f));
    //new PVector(width/2,height/2), MIN_SIZE);
  }
}

float colorLookup(float i) {
  return floor((i/255.0) * NUM_BANDS) * BAND;
}

void draw() {

  int t = millis();
  background();
  for (int i = 0; i < NUM_BALLS; i++) {
    balls[i].update();
  }

  // non-nested loop gives us about +5 ms per frame
  for (int i = 0; i < height * width; i++) {
    float col = 0.0f;

    for (int m = 0; m < NUM_BALLS; m++) {
      int y = floor(i / width); // faster than using int
      int x = i % width;

      float xx = (balls[m].pos.x + HALF_W) - x;
      float yy = (balls[m].pos.y + HALF_H) - y;

      col += balls[m].radius / sqrt( xx * xx + yy * yy);
    }
    img.pixels[i] = color(colorLookup(255 * col), 255.0f);
  }

  img.updatePixels();
  image(img, 0, 0);

  int diff = millis() - t;
  //text(diff, 50, 30);
  //text(frameRate, 50, 50);
}

