
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
boolean isClose = false;

public void setup() {
  int dimension = 24;
  size(500, 354);
  image = loadImage("dragon.jpg");
  if (image.width > 500 || image.height > 354)
    image.resize(500, 0);
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

public void draw() {
  background(0);
  mouse.position().set(mouseX, mouseY, 0);
  physics.tick();
  float posx = 100, posy = 100;
  float rndStr = 0;
  restartRound();

  for (int x = 1; x < widthSmall; x++) {
    for (int y = 1; y < heightSmall; y++) {
      int index = y * widthSmall + x;
      posx = particles[index].position().x();
      posy = particles[index].position().y();
      if (colors[index] == 0) continue;		
      float distance = dist(mouseX, mouseY, posx, posy);
      rndStr = distance * 0.01f;
      isClose = (distance < 30);
      drawFlower(posx, posy, rndStr, colors[index]);
    }
  }
}

public void drawFlower(float startX, float startY, float randomLength, color c) {
  float[][] color1 = {
    {
      red(c), green(c), blue(c)
    }
    , {
      1, 0, 0
    }
  };
  float[][] color2 = {
    {
      1, 1, 1
    }
    , {
      0, 0, 1
    }
  };
  for (int i = 0; i <= 10; i++) {
    float[] c1 = randomizeList(color1[0], color1[1]);
    float[] c2 = randomizeList(color2[0], color2[1]);
    drawPetal(startX, startY, randomLength, c1, c2);
  }
}

public void drawPetal(float startX, float startY, float randomStrength, float[] color1, float[] color2) {
  float x = startX, y = startY, nextX = 0, nextY = 0;
  float stepLength = 3.0f;
  float direction = getRound() * 2 * PI;
  for (int i = 0; i <= 5; i++) {
    stroke((color2[0]-color1[0])*i/15.0f + color1[0], 
    (color2[1]-color1[1])*i/15.0f + color1[1], 
    (color2[2]-color1[2])*i/15.0f + color1[2]);
    strokeWeight(1 -0.5f * (i / 5.0f));
    nextX = x + stepLength * cos(direction);
    nextY = y + stepLength * sin(direction);
    line(x, y, nextX, nextY);
    direction += randomStrength * (getRound() - 0.5f);
    stepLength = stepLength / 1.05f;
    x = nextX;
    y = nextY;
  }
}

public void initRound(int len) {
  round = new float[0];
  for (int i = 0; i < len; i++) {
    round = append(round, random(1));
  }
}

public float getRound() {
  float result = round[roundPosition++];
  if (roundPosition >= round.length) {
    restartRound();
  }
  return result;
}

public void restartRound() {
  roundPosition = 0;
}

float[] randomizeList(float[] list, float[] mask) {
  float[] result = {
  };
  float rnd;
  for (int i=0;i<list.length;i++) {
    if (mask[i]==1) {
      rnd = getRound();
      result = append(result, (isClose?random(1):rnd)*list[i]);
    } 
    else {
      result = append(result, list[i]);
    }
  }
  return result;
}


