

Particle[] particles;
color colorCenter;
color colorOuter;
final int particleCount = 2000;
float leastDist;
float greatestDist;

void setup()
{
  size(600, 600, P2D);
  background(0);
  frameRate(500);
  smooth();
  colorMode(HSB, 200);
  restart();
}

void restart()
{
  colorCenter = color(random(200), random(100, 200), random(100, 200));
  colorOuter = color(random(200), random(100, 200), random(100, 200));
  particles = new Particle[particleCount];
  for(int i = 0; i < particleCount; i++)
  {
    particles[i] = new Particle(random(0.01, 1), random(360), i);
  }
  background(0);
  noiseSeed(second());
}

void keyReleased()
{
  restart();
}

void draw()
{
  for(int i = 0; i < particleCount; i++)
  {
    particles[i].update();
  }
}

class Particle
{
  float posX;
  float posY;
  float speed;
  float angle;
  float distance;
  
  protected Particle(float s, float a, float d)
  {
    speed = s;
    angle = a;
    distance = d;
    posX = distance * cos(radians(angle)) + width/2;
    posY = distance * sin(radians(angle)) + height/2;
  }
  
  public void update()
  {
    distance = noise(sin(radians(posX)), cos(radians(posY)), cos(radians(millis()))) * (width/2);
    if(distance < leastDist)
      leastDist = distance;
    if(distance > greatestDist)
      greatestDist = distance;
    angle += speed;
    posX = distance * cos(radians(angle)) + width/2;
    posY = distance * sin(radians(angle)) + height/2;
    stroke(lerpColor(colorOuter, colorCenter, norm(distance, leastDist, greatestDist)), 5);
    point(posX, posY);    
  }
}

