
//adjust wind with keys 'w' and 'W'

Particle[] particles = new Particle[200];

void setup()
{
  size(400,400);
  smooth();
  
  // Create the particles
  for (int i=0; i<particles.length; i++) {
    particles[i] = new Particle();
  }
}

void draw()
{
  background(0);
  // Draw and update however many have been allowed to enter
  for (int i=0; i<particles.length; i++) particles[i].draw();
  for (int i=0; i<particles.length; i++) particles[i].update();
}

class Particle {
  float x, y;    // current position
  float vx,vy;  // velocity
  float timer;   // time left before estinguishing
  float dt = 2;  // estinguishing speed
  float g = 0.02; // gravity
  float r = 5;   // radius
  boolean on=false;
  
  Particle() { }

  // Place at original position, fully opaque, with random vertical velocity
  void initialize()
  {
    on = true;
    x = random(width); y = random(-30,-5);
  vy = random(0,1);
  vx=0;
    timer = 255;
    dt = random(0.1,5);
  }
  
  void draw()
  {
    if(!on) return;
    fill(64,timer); stroke(255,timer);
    ellipse(x,y,2*r,2*r);
  }
  
  void update()
  {
    // initialize if necessary 
    if(!on) { if(random(0,1) < 0.5) initialize(); return; }
    
    timer -= dt;    // decay the transparency
    
    //gravity
    vy += g;
    y += vy;
    
    //wind
    keyPressed();
    x += vx;
    // When exit screen or totally transparent, re-initialize
    if (timer < 0) {
      on = false;
    }
  }
  
  void keyPressed() 
  {
    if (key=='w') {vx-=0.01;}
    if (key=='W') {vx+=0.01;}
    //constrain wind
    if (vx<-0.5) {vx=-0.5;}
    if (vx>0.5) {vx=0.5;}
}
}



