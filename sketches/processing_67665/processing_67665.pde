

ArrayList particles;
PImage sky;

void setup()
{
  size(800, 600, P2D);
  frameRate(60);
  rectMode(CENTER);
  noStroke();
  
  sky = createImage(width, height, RGB);
  for(int i = 0; i < width; i++)
  {
    for(int j = 0; j < height; j++)
    {
      sky.pixels[i + j * width] = lerpColor(#157ABC, #66B9F0, (float)j/height);
    }
  }
  restart();
}

void restart()
{
  particles = new ArrayList();
  background(sky);
}

void mouseReleased()
{
  particles.add(new Particle(mouseX, mouseY, 50, color(255), 12));
}

void keyReleased()
{
  if(key == 32)
    restart();
  else
    filter(BLUR);
}

void draw()
{
  for(int i = 0; i < particles.size(); i++)
  {
    Particle p = (Particle) particles.get(i);
    if(p.alive)
    {
      p.drawParticle();
      p.reproduce();
    }
    else
      particles.remove(i);
  }
}

class Particle
{
  PVector position;
  float oppacity;
  float w;
  color clr;
  boolean alive;
  
  protected Particle(float x, float y, float wth, color c, float o)
  {
    position = new PVector(x, y);
    w = wth;
    clr = c;
    oppacity = o;
    alive = true;
  }
  
  public void reproduce()
  {
    if(w > 1)
    {
      for(int i = 0; i < 2; i++)
      {
        float newX = position.x + random(-w, w);
        float newY = position.y + random(-w/2, w/4);
        float r = random(10);
        float newW = w - r;
        if(newW < 1)
          newW = 1;
        particles.add(new Particle(newX, newY, newW, clr, oppacity));
        alive = false;
      }
    }
  }
  
  public void drawParticle()
  {
    fill(clr, oppacity);
    ellipse(position.x, position.y, w, w);
  }
}

