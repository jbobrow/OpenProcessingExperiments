


class Particle {
  PVector pos = new PVector();
  //PVector velocity;
  PVector velocity = new PVector();
  
  Particle(float x, float y, float vx, float vy) {
    pos.x = x;
    pos.y = y;
    velocity.x = vx;
    velocity.y = vy;
  }
  
  void update(float randx, float randy) {
    pos.x += (randx - pos.x)/velocity.x;
    pos.y += (randy - pos.y)/velocity.y;
  }
  
  void draw() {
   fill(225, 232, 239, 90);
   noStroke();
   smooth();
   ellipse(pos.x, pos.y, 30, 30); 
  }
}


Particle[] particles = new Particle[100];
float[] randx = new float[100];
float[] randy = new float[100];
float rx;
float ry;
float rtargetx;
float rtargety;

void setup() {
  size(640, 400);
  frameRate(60);
  
  for (int i=0; i < 100; i++) {
    rx = random(0, width);
    ry = random(0, height);
    particles[i] = new Particle(rx, ry, 20, 20);
    randx[i] = random(0, width);
    randy[i] = random(0, height);
  }
}

void draw() {
  background(0);
  for (int index=0; index < 100; index++) {
    rtargetx = random(0, width);
    rtargety = random(0, height);
    particles[index].update(randx[index], randy[index]);
    particles[index].draw();
  }
}

