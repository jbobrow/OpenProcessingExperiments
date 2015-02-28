


Particle[] particles;
int numOfParticles = 20000;

int startSpd = 20;
float bounce = 0.7;
float gravity = 1;
float speed= 0.5;
float mouseGrav = 300;

int particle_opacity = 120;
int eraser_opacity = 250;
int colour = 1;

int frameWidth = 700;
int frameHeight = 400;

void setup() 
{
  size(frameWidth, frameHeight, P2D);
  colorMode(RGB, 255);
  background(0);

  createParticles();
}

void draw() 
{
  stroke(0);
  fill(0, eraser_opacity);
  rect(0, 0, frameWidth, frameHeight);
  
  if(colour>=255)
  {
    colour = 1;
  }
  
  stroke(20, 160, colour++ , particle_opacity);
  for (int i=0;i<numOfParticles;i++) {
    particles[i].move();
    particles[i].render();
  }
}

void createParticles() 
{
  int startSpd = 20;
  particles = new Particle[numOfParticles];
  
  for (int i=0;i<numOfParticles;i++) {
    particles[i] = new Particle(random(frameWidth), 100*frameHeight/10+random(frameHeight), startSpd*(random(1)-0.5), startSpd*(random(1)-0.5));
  }
}

void mousePressed()
{
  if (mouseButton == LEFT) {
  speed = 0;
  gravity = 10;
  }
  if (mouseButton == RIGHT) {
    speed = -1;
    mouseGrav = 150;
  }
}

void mouseReleased() 
{
  speed = 0.5;
  gravity = 1;
  mouseGrav = 300;
}


