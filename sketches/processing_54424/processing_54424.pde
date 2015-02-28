
import traer.physics.*;

Particle mouse;
Particle[] particles;
Particle[] originParticles;
ParticleSystem physics;
PImage image; 
int widthSmall;
int heightSmall;
int dimension = 8;
color[] colors;

void setup() {
  size(350, 248);
  image = loadImage("dragon.jpg");
  if (image.width > 350 || image.height > 350)
    image.resize(350, 0);
  widthSmall = image.width / dimension;
  heightSmall = image.height / dimension;
  int numPixelsSmall = widthSmall * heightSmall;
  smooth();
  physics = new ParticleSystem(0, 0.05f);
  mouse = physics.makeParticle();
  mouse.makeFixed();
  particles = new Particle[numPixelsSmall];
  originParticles = new Particle[numPixelsSmall];
  colors = new int[numPixelsSmall];
  image.loadPixels();
  float minMass = 0.4f; 
  float maxMass = 0.8f; 
  for (int x = 1; x < widthSmall; x++) {
    for (int y = 1; y < heightSmall; y++) { 
      int index = y * widthSmall + x;
      colors[index] = image.pixels[y * dimension * image.width + x * dimension];
      if (colors[index] == -1) colors[index] = 0;
      particles[index] = physics.makeParticle(random(minMass, maxMass), 
      x * dimension, y * dimension, 0);
      originParticles[index] = physics.makeParticle(
      random(minMass, maxMass), x * dimension, y * dimension, 0);
      originParticles[index].makeFixed();
      physics.makeSpring(particles[index], originParticles[index], 0.2f, 0.1f, 0);
      physics.makeAttraction(particles[index], mouse, -10000, 0.1f);
    }
  }
}

void draw() {
  background(0);
  mouse.position().set(mouseX, mouseY, 0);
  physics.tick();
  float posx, posy;
  for (int x = 1; x < widthSmall; x++) {
    for (int y = 1; y < heightSmall; y++) {
      int index = y * widthSmall + x;
      posx = particles[index].position().x();
      posy = particles[index].position().y();
      float w = map(dist(posx, posy, mouseX, mouseY), 0, sqrt(width*width + height*height), dimension * 0.3, dimension * 1.3);			
      fill(colors[index]);
      ellipse(posx, posy, w, w*1.2);
    }
  }
}


