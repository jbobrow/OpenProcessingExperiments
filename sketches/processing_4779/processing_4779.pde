
// similar to something I wrote in Scout
//
// mouse-left  attracts
// mouse-right repels

int   WIN_WIDTH = 512;
float MAX_DIST = sqrt(pow(WIN_WIDTH,2) + pow(WIN_WIDTH, 2)); // max distance between points
int   N_PARTS =  4096;

PVector[] pos = new PVector[N_PARTS];
PVector[] dir = new PVector[N_PARTS];
PVector[] force = new PVector[N_PARTS];


void setup() {
  size(WIN_WIDTH, WIN_WIDTH, P2D);
  noSmooth();
  stroke(255);
  strokeWeight(1);

  randomSeed(0);
  for(int i=0; i<N_PARTS; ++i) {
    pos[i] = new PVector(random(float(WIN_WIDTH)),
                         random(float(WIN_WIDTH)),
                         0.0);
    dir[i] = new PVector(random(-1.0, 1.0),
                         random(-1.0, 1.0),
                         0.0);
  }
}


PVector t1 = new PVector(0.0, 0.0, 0.0);
PVector max = new PVector(float(WIN_WIDTH), float(WIN_WIDTH), float(WIN_WIDTH));
PVector min = new PVector(0.0, 0.0, 0.0);
PVector zero = new PVector(0.0, 0.0, 0.0);

void draw() {
  fill(32, 32, 128, 255);
  rect(0, 0, WIN_WIDTH, WIN_WIDTH);

  PVector mouse = new PVector(float(mouseX), float(mouseY), 0.0);
  PVector force_i = new PVector(0.0, 0.0, 0.0);

  for(int i=0; i<N_PARTS; ++i) {

    force_i.set(zero);
    if (mousePressed) {

      // force is to/from the mouse, and increases inversely proportional
      // to the square of the distance.
      force_i = PVector.sub(mouse, pos[i]);
      if (mouseButton == RIGHT)
        force_i.mult(-1.0);

      force_i.div(max);
      float mag_i = force_i.mag();
      force_i.mult(mag_i * mag_i);
    }

    dir[i].add(force_i);
    dir[i].limit(3.0);

    t1 = PVector.add(pos[i], dir[i]);

    if (t1.x > max.x) {
      t1.x = max.x - (t1.x - max.x);
      dir[i].x *= -1.0;
    }
    else if (t1.x < min.x) {
      t1.x = 0.0 - t1.x;
      dir[i].x *= -1.0;
    }

    if (t1.y > max.y) {
      t1.y = max.y - (t1.y - max.y);
      dir[i].y *= -1.0;
    }
    else if (t1.y < min.y) {
      t1.y = 0.0 - t1.y;
      dir[i].y *= -1.0;
    }

    pos[i].set(t1);
  }


  // draw points
  for(int i=0; i<N_PARTS; ++i) {
    point(pos[i].x, pos[i].y);
  }
}

