
/**
 * Wave
 * by Jeff Schumacher
 *
 * The screen is filled with points at random, which gravitate
 * toward alternating positions on the screen. The actual funtion
 * that determines a point's velocity is a sine function based on
 * the point's X position. The screen is a range between 0 and 4 PI.
 * The point's color is determined by its velocity.
 */

int numDrops = 800;
Droplet[] droplets = new Droplet[numDrops];
float mod = 1;
int count = 0;
int countDone = 0;

void setup() {
  size(640, 480, P2D);
  frameRate(30);
  
  for (int i=0; i<numDrops; i++) {
    droplets[i] = new Droplet((int)random(640), (int)random(480));
  }
  
  noStroke();
  fill(0, .5);
  background(0);
}

void draw() {
  rect(0, 0, 640, 480);
  
  count++;
  countDone = 0;
  for (int i=0; i<numDrops; i++) {
    droplets[i].run();
    if (droplets[i].done) countDone++;
  }
   
  if (count > 300 && countDone > numDrops * .8) {
    for (int i=0; i<numDrops; i++) {
      droplets[i].y += 2.0 - random(4.0);
      droplets[i].x += 2.0 - random(4.0);
    }
    count = 0;
    mod = -mod;
  }
}

class Droplet {
  float x, y;
  boolean done = false;
  
  Droplet(int xin, int yin) {
    x=xin;
    y=yin;
  }
  
  void run() {
    float vel = mod * sin(((float)x)/640.0 * 2 * TWO_PI);
    
    x += vel;
    
    if (abs(vel) < .01) {
      done = true;
    } else {
      done = false;
    }
    
    set((int)x, (int)y, color(abs(vel) * 255, 0, 255 - abs(vel) * 255));
  }
}

