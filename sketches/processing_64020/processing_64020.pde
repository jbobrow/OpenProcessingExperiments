
// not mine
// source:  Hamoid
// https://github.com/hamoid/Fun-Programming/blob/master/processing/ideas/2012/02/18/fall_into_paths2/fall_into_paths2.pde
// see it on YouTube: http://youtu.be/43EuLJECGI8

float i = 0;
float oldx;
float oldy;

Bezerk bezx;
Bezerk bezy;
Bezerk hues[] = new Bezerk[5];
Bezerk sats[] = new Bezerk[5];

// Offset is going to keep increasing.
// I start with a random offset so the branches 
// do not always point up at the beginning.
float offset = random(TWO_PI);

void setup() {
  size(640, 480);
  smooth();
  background(0);
  colorMode(HSB, 1);

  oldx = width / 2;
  oldy = height / 2;

  bezx = new Bezerk(0.01, 10);
  bezy = new Bezerk(0.01, 10);
  for (int i = 0; i<hues.length; i++) {
    hues[i] = new Bezerk(random(0.001, 0.009), 1);
    sats[i] = new Bezerk(random(0.003, 0.01), 0.7);
  }
}
void draw() {
  background(0);

  // 7000 iterations per frame
  for (int rep = 0; rep < 7000; rep++) {
    // noise value for the current position
    float n = noise(oldx/50 + bezx.getVal(), oldy/50 + bezy.getVal(), offset);

    int which = int(n*hues.length);
    stroke(hues[which].getVal(), sats[which].getVal(), 1, 0.02);
    // angle
    float a = n * TWO_PI + 20 * noise(offset);
    // distance
    float d = random(4, 7);
    // move using distance and angle
    float x = oldx + d * sin(a);
    float y = oldy + d * cos(a);

    //float at = atan2(x-oldx, y-oldy);

    // noise based line strokeWeight
    float w = max((40 + 10*sin(offset)) * noise(offset, oldx/50, oldy/50) - 10, 1);
    strokeWeight(w);

    line(oldx, oldy, x, y);

    // if we get out of the screen, jump back in
    if ((x < 0) || (y < 0) || (x > width) || (y > height)) {
      x = random(width);
      y = random(height);
    }  

    oldx = x;
    oldy = y;
  }
  offset += 0.005;
  
  for (int i = 0; i<hues.length; i++) {
    hues[i].next();
    sats[i].next();
  }
  bezx.next();
  bezy.next();

  // This is used to save 1000 frames on the disk

  //saveFrame("/tmp/video/seq-####.tga");
  //if(frameCount > 1000) {
  //  noLoop();
  //}

  // My /tmp folder is a ram disk, so saving is very fast
  // I convert the images to mp4 typing (I've got 4 cores):
  // ffmpeg -i seq-d.tga -r 25 -threads 4 video.mp4 

  // print frames per second
  println(1000.0 / (millis() / float(frameCount)));
}

// A random value interpolator based on a never ending bezier curve.
// When we reach destination (t == 1) then the end becomes the 
// beginning, the first control point is a mirror of the last 
// control point to make a smooth transition

class Bezerk {
  float[] bx = new float[4];
  float t = 0;
  float dt;
  float maximo;
  float val;

  Bezerk(float inct, float m) {
    maximo = m;
    dt = inct;
    for (int i = 0; i<4; i++) {
      bx[i] = random(maximo);
    }
    next();
  }
  float getVal() {
    return val;
  }
  void next() {
    t += dt;
    if (t > 1) {
      t = 0;
      bx[1] = bx[3] - (bx[2] - bx[3]);
      bx[0] = bx[3];
      bx[2] = random(maximo);
      bx[3] = random(maximo);
    }
    val = bezierPoint(bx[0], bx[1], bx[2], bx[3], t);
  }
}
