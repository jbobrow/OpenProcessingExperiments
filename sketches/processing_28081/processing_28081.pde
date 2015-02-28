
boolean lines = false;
boolean gravity = false;
int particleCount = 300;

Particle[] particles = new Particle[particleCount+1];


void setup() {
  size(500,500);
  colorMode(RGB, 400);
  frameRate(60);
  smooth();
  fill (255);
  
  for (int x = particleCount; x >= 0; x--) {
    particles[x] = new Particle();
    
  }
}
void draw() {
  background(400);
  
  for (int i = particleCount; i >= 0; i--) {
    Particle particle = (Particle) particles[i];
    particle.update(i);
  }
}
class Particle {
  float x;
  float y;
  float vx;
  float vy;
  Particle() {
    stroke(random(0,66),random(0,79),random(0,152));
    strokeWeight(30);
    x = 10;
    y = 10;
  }
  float getx() {
    return x;
  }
  float gety() {
    return y;
  }
  void update(int num) {
   vx *= 0.90;
   vy *= 0.90;
   for (int i = particleCount; i >= 0; i--)  {
     if (i != num) {
        boolean drawthis = false;
        float redshade = 0;
        float blueshade = 0;
        Particle particle = (Particle) particles[i];
        float tx = particle.getx();
        float ty = particle.gety();
        float radius = dist(x,y,tx,ty);
        if (radius < 45) {
           drawthis = true;
           float angle = atan2(y-ty,x-tx);
           if (radius < 30) {
             
             
               //change to 45
               

            if (lines) {
               redshade = 13 * (30 - radius);
             }
             vx += (30 - radius) * 0.07 * cos(angle);
             vy += (30 - radius) * 0.07 * sin(angle);
           }
           if (radius > 25) {
             if (lines) {
               blueshade = 90 * (500 - radius);
             }
             vx -= (25 - radius) * 0.005 * cos(angle);
             vy -= (25 - radius) * 0.005 * sin(angle);
           }
        }
        if (lines) {
          if (drawthis) {
             stroke (redshade, 0, blueshade);
             line(x,y,tx,ty);
          }
        }
      }
    }
    if (mousePressed) {
      float tx = mouseX;
      float ty = mouseY;
      float radius = dist(x,y,tx,ty);
      if (radius < 50) {
        float angle = atan2(ty-y,tx-x);
        if (mouseButton == LEFT) {
          vx -= radius * 0.07 * cos(angle);
          vy -= radius * 0.07 * sin(angle);
          stroke(radius * 4,0,0);
        }
        else {
          vx += radius * 0.07 * cos(angle);
          vy += radius * 0.07 * sin(angle);
          stroke(255);
        }
        if (lines) line (x,y,tx,ty);
      }
    }  
    int px = (int)x;
    int py = (int)y;
    x += vx;
    y += vy;
    if (gravity == true) vy += 0.7;
    if (x > width-11) {
      if (abs(vx) == vx) vx *= -1.0;
      x = width-11;
    }
    if (x < 11) {
      if (abs(vx) != vx) vx *= -1.0;
      x = 11;
    }
    if (y < 11) {
      if (abs(vy) != vy) vy *= -1.0;
      y = 11;
    }
    if (y > height-11) {
      if (abs(vy) == vy) vy *= -1.0;
      vx *= 0.6;
      y = height-11;
    }
    if (!lines) {
      stroke (0);
      line(px,py,int(x),int(y));
    }
  }
} 
void keyPressed() {
  if (key == 'g' || key == 'G') {
    if (gravity) gravity = false;
    else gravity = true;
  }
  else {
    if (lines) lines = false;
    else lines = true;
  }
}

