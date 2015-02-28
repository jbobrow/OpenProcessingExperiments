
import traer.physics.*;

Particle mouse;
Particle[] particles;
Particle[] originParticles;
ParticleSystem physics;
PImage image; 
int widthSmall;
int heightSmall;
int roundPosition = 0;
color[] colors;	
float[] round = {
};

void setup() {
  int dimension = 15;
  size(350, 248);
  image = loadImage("dragon.jpg");
  if (image.width > 350 || image.height > 248)
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
      if (colors[index] == -1) {
        colors[index] = 0;
      }
      particles[index] = physics.makeParticle(random(minMass, maxMass), 
      x * dimension, y * dimension, 0);
      originParticles[index] = physics.makeParticle(
      random(minMass, maxMass), x * dimension, y * dimension, 0);
      originParticles[index].makeFixed();
      physics.makeSpring(particles[index], originParticles[index], 0.2f, 0.1f, 0);
      physics.makeAttraction(particles[index], mouse, -10000, 0.1f);
    }
  }
  initRound(100);
}

void draw() {
  background(0);
  mouse.position().set(mouseX, mouseY, 0);
  physics.tick();
  float posx, posy;
  float rndStr = 0;
  restartRound();
  for (int x = 1; x < widthSmall; x++) {
    for (int y = 1; y < heightSmall; y++) {
      int index = y * widthSmall + x;
      posx = particles[index].position().x();
      posy = particles[index].position().y();
      if (colors[index] == 0) continue;			
      drawFlower(posx, posy, colors[index], rndStr);
    }
  }
}

void drawFlower(float startX, float startY, color color1, float randomLength) {
  for (int i = 0; i <= 10; i++) {
    drawPetal(startX, startY, color1, randomLength);
  }
}

void drawPetal(float startX, float startY, color color1, float randomStrength) {
  float x = startX, y = startY, nextX = 0, nextY = 0;
  float stepLength = 1.0f;
  float direction = getRound() * 2 * PI;
  for (int i = 0; i <= 5; i++) {
    stroke(color1);
    strokeWeight(1 -0.5f * (i / 5.0f));
    nextX = x + stepLength * cos(direction);
    nextY = y + stepLength * sin(direction);
    line(x, y, nextX, nextY);
    direction += randomStrength * (getRound() - 0.5);
    stepLength = stepLength / 1.05f;
    x = nextX;
    y = nextY;
  }
}

void initRound(int len) {
  round = new float[0];
  for (int i = 0; i < len; i++) {
    round = append(round, random(1));
  }
}

float getRound() {
  float result = round[roundPosition++];
  if (roundPosition >= round.length) {
    restartRound();
  }
  return result;
}

void restartRound() {
  roundPosition = 0;
}


