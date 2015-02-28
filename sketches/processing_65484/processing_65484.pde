

int WIDTH;
int HEIGHT;

ArrayList particles;
Particle tempParticle;
color leftColor;//Color for the left of the screen
color rightColor;//Color for the right of the screen
color particleColor;//Color lerped from leftColor and rightColor
long timer = 10;//How long until auto restart
long lastTime = 0;//Used with timer

void setup()
{
  size(800, 600, P2D);
  WIDTH = 800;
  HEIGHT = 600;
  frameRate(500);
  smooth();
  restart();
}

void restart()
{
  particles = new ArrayList();
  leftColor = color(random(255), random(255), random(255));
  rightColor = color(random(255), random(255), random(255));
  for(int i = 0; i < 3000; i++)
  {
    particleColor = lerpColor(leftColor, rightColor, float(i) / WIDTH);
    particles.add(new Particle(random(0, WIDTH), random(0, HEIGHT), particleColor));
  }
  noiseSeed(second());//Creates a new noise pattern
  background(0);
}

void draw()
{
  for(int i = 0; i < particles.size(); i++)
  {
    tempParticle = (Particle) particles.get(i);
    tempParticle.update();
    tempParticle.drawPoint();
  }
  
  if(second() - lastTime >= timer)
  {
    lastTime = second();
    restart();
  }
}

void mouseReleased()
{
  lastTime = second();
    restart();
}

class Particle
{
  float posX;
  float posY;
  float r, g, b, a;
  color clr;
  
  protected Particle(float x, float y, color c)
  {
    posX = x;
    posY = y;
    r = red(c);
    g = green(c);
    b = blue(c);
    a = 10;
  }
  
  public void update()
  {
    clr = lerpColor(leftColor, rightColor, (float)posX / WIDTH);
    r = red(clr);
    g = green(clr);
    b = blue(clr);
    posY += sin(noise(posX * 0.01, posY * 0.01) * TWO_PI);
    posX += cos(noise(posX * 0.01, posY * 0.01) * TWO_PI);
    if(posY < 0 || posY > HEIGHT - 1)
    {
      posY = random(0, HEIGHT);
      posX = random(0, WIDTH);
    }
    if(posX < 0 || posX > WIDTH - 1)
    {
      posY = random(0, HEIGHT);
      posX = random(0, WIDTH);
    }
  }
  
  public void drawPoint()
  {
    stroke(r, g, b, a);
    point(posX, posY);
  }
}

