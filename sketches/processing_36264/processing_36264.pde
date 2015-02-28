
boolean lines = false;
boolean gravity = true;

int particleCount = 600;
 
Particle[] particles = new Particle[particleCount+1];

PImage b;

void setup() {
  size(700,400);
  frameRate(60);
  b = loadImage ("fade.png");
  smooth();
  background(255);
  //fill (255);
 
  for (int x = particleCount; x >= 0; x--) {
    particles[x] = new Particle();
  }
}
void draw() {
  image(b,0,0); 
  noStroke();
  noCursor();
  fill(0,0,0,40);
  rect(0,0,1000,1000);
  for (int i = particleCount; i >= 0; i--) {
    Particle particle = (Particle) particles[i];
    particle.update(i);
  }
}

//Particles

class Particle {
  float x;
  float y;
  float vx;
  float vy;
  float randy = random(255);
  float nispe = random(10);
  float mx = mouseX;
  float my = mouseY;
   
  Particle() {
    x = 5;
    y = 5;
    nispe =0;
  }
  float getx() {
    return x;
  }
  float gety() {
    return y;
  }
  
//partset
  
  void update(int num) {
    vx *= 0.90;
    vy *= 0.90;
    for (int i = particleCount; i >= 0; i--) {
      if (i != num) {
        boolean drawthis = false;
        Particle particle = (Particle) particles[i];
        float tx = particle.getx();
        float ty = particle.gety();
        float radius = dist(x,y,tx,ty);
    
    //particle repulsion//
        //wave effect//
        if (radius < 32) {
        //swarm effect//
        //if (radius < 34) {
          drawthis = true;
          float angle = atan2(y-ty,x-tx);
          if (radius < 45) {
            vx += (25 - radius) * 0.07 * cos(angle);
            vy += (25 - radius) * 0.07 * sin(angle);
          }
          if (radius > 40) {
            vx -= (25 - radius) * 0.02 * cos(angle);
            vy -= (25 - radius) * 0.02 * sin(angle);
          }
        }
      }
    }
    
    //Mouse functions
    
    if (mousePressed) {
      float tx = mouseX;
      float ty = mouseY;
      float radius = dist(x,y,tx,ty);
      if (radius < 400) {
        float angle = atan2(ty-y,tx-x);
        //attracts particles       
        if (mouseButton == LEFT) {
          vx += radius * 0.01 * cos(angle);
          vy += radius * 0.01 * sin(angle);
          stroke(radius * 4,0,0);
        }
        //repells particles
        if (mouseButton == RIGHT) {
          vx -= radius * .05 * sin(angle);
          vy -= radius * .05 * cos(angle);
          stroke(radius * 4,0,0);
        }
      }
    } 
    
    //If statements keeping particles in the box
    
    int px = (int)x;
    int py = (int)y;
    x += vx;
    y += vy;
    if (x > width) {
      if (abs(vx) == vx) vx *= -1.0;
      x = width;
    }
    if (x < 0) {
      if (abs(vx) != vx) vx *= -1.0;
      x = 0;
    }
    if (y < 0) {
      if (abs(vy) != vy) vy *= -1.0;
      y = 0;
    }
    if (y > height) {
      if (abs(vy) == vy) vy *= -1.0;
      vx *= 0.6;
      y = height;
    }
      strokeWeight(2);
      stroke (0);
      fill(255);
      //rect(px,py,1,1);
      ellipse(px,py,1,1);
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

