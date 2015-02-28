

Particle[] particles;
int[] highestPoints;
color c1;
color c2;
color c3;

void setup()
{
  size(600, 400, JAVA2D);
  frameRate(40);
  background(0);
  colorMode(HSB, 200);
  smooth();
  restart();
}

void restart()
{
  background(0);
  particles = new Particle[width * height];
  for(int i = 0; i < width * height; i++)
  {
    particles[i] = null;
  }
  highestPoints = new int[width];
  for(int i = 0; i < width; i++)
  {
    highestPoints[i] = height;
  }
  
  c1 = color(random(200), random(100, 150), random(100, 150));
  c2 = color(hue(c1) + random(-5, 5), saturation(c1) + random(-5, 5), brightness(c1) + random(-5, 5));
  c3 = color(hue(c1) + random(-5, 5), saturation(c1) + random(-5, 5), brightness(c1) + random(-5, 5));
}

void mouseReleased()
{
  restart();
}

void draw()
{
  for(int a = 0; a < 500; a++)
  {
    int newX = round(random(width - 1));
    int newY = highestPoints[newX] - 1;
    if(newY != height - 1)
    {
      if(newY != -1)
      {
        if(newX != 0 && particles[newX - 1 + newY * width] != null)
        {
          float h = particles[newX - 1 + newY * width].h + random(-2, 2);
          float s = particles[newX - 1 + newY * width].s + random(-2, 2);
          float b = particles[newX - 1 + newY * width].b + random(-2, 2);
          particles[newX + newY * width] = new Particle(newX, newY, h, s, b);
          highestPoints[newX]--;
          particles[newX + newY * width].drawParticle();
        }
        else if(newX != width - 1 && particles[newX + 1 + newY * width] != null)
        {
          float h = particles[newX + 1 + newY * width].h + random(-2, 2);
          float s = particles[newX + 1 + newY * width].s + random(-2, 2);
          float b = particles[newX + 1 + newY * width].b + random(-2, 2);
          particles[newX + newY * width] = new Particle(newX, newY, h, s, b);
          highestPoints[newX]--;
          particles[newX + newY * width].drawParticle();
        }
        else
        {
          float h = particles[newX + (newY + 1) * width].h + random(-2, 2);
          float s = particles[newX + (newY + 1) * width].s + random(-2, 2);
          float b = particles[newX + (newY + 1) * width].b + random(-2, 2);
          particles[newX + newY * width] = new Particle(newX, newY, h, s, b);
          highestPoints[newX]--;
          particles[newX + newY * width].drawParticle();
        }
      }
      else
      {
        //highestPoints[newX] = height;
      }
    }
    else
    {
      if(newX != 0 && particles[newX - 1 + newY * width] != null)
      {
        float h = particles[newX - 1 + newY * width].h + random(-2, 2);
        float s = particles[newX - 1 + newY * width].s + random(-2, 2);
        float b = particles[newX - 1 + newY * width].b + random(-2, 2);
        particles[newX + newY * width] = new Particle(newX, newY, h, s, b);
        highestPoints[newX]--;
        particles[newX + newY * width].drawParticle();
      }
      else if(newX != width - 1 && particles[newX + 1 + newY * width] != null)
      {
        float h = particles[newX + 1 + newY * width].h + random(-2, 2);
        float s = particles[newX + 1 + newY * width].s + random(-2, 2);
        float b = particles[newX + 1 + newY * width].b + random(-2, 2);
        particles[newX + newY * width] = new Particle(newX, newY, h, s, b);
        highestPoints[newX]--;
        particles[newX + newY * width].drawParticle();
      }
      else
      {
        int c = round(random(0, 2));
        switch(c)
        {
          case 0:
            particles[newX + newY * width] = new Particle(newX, newY, hue(c1), saturation(c1), brightness(c1));
            break;
          case 1:
            particles[newX + newY * width] = new Particle(newX, newY, hue(c2), saturation(c2), brightness(c2));
            break;
          case 2:
            particles[newX + newY * width] = new Particle(newX, newY, hue(c3), saturation(c3), brightness(c3));
            break;
        }
        highestPoints[newX]--;
        particles[newX + newY * width].drawParticle();
      }
    }
  }
}

class Particle
{
  int posX;
  int posY;
  float h;
  float s;
  float b;
  
  protected Particle(int x, int y, float hu, float sat, float bright)
  {
    posX = x;
    posY = y;
    h = hu;
    s = sat;
    b = bright;
  }
  
  public void drawParticle()
  {
    stroke(h, s, b);
    point(posX, posY);
  }
  
}

