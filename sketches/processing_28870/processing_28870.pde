

int particleCount = 150;
 
Particle[] particles = new Particle[particleCount+1];
PImage bg;
boolean click = false;
 
  boolean once = true;
 
void setup() {
  size(800,200);
  colorMode(RGB, 255);
  bg = loadImage("background.jpg");
  frameRate(30);
  smooth();
  fill (255);
 
  for (int x = particleCount; x >= 0; x--) {
    particles[x] = new Particle();
  }
}

void draw() {
  
  if(once){image(bg,0,0);
  once = false;
  }
  if(click){
  image(bg,0,0);
  for (int i = particleCount; i >= 0; i--) {
    Particle particle = (Particle) particles[i];
    particle.update(i);
  }
  }
}

void mouseClicked (){
  if(click == false) click = true;
  else 
  if(click == true) click = false;
  
}

