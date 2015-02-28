
ArrayList ParticleExplosions;

void setup()
{
  size(400, 300); 
  background(0);
  noStroke();
  
  ParticleExplosions = new ArrayList();
}

void draw()
{
  background(0);

  if (ParticleExplosions.size() > 0)
  {
    for (int i=0; i < ParticleExplosions.size(); i++)
    {
      println("test");
      ParticleExplosion p = (ParticleExplosion) ParticleExplosions.get(i);
      p.drawdisplay();
      if (p.no_more_particles)
      {
        ParticleExplosions.remove(i);
      
        println("removed particle explosion");  
      }
    }
  }
}

void mousePressed()
{
  ParticleExplosions.add(new ParticleExplosion());
}

class ParticleExplosion
{
  boolean no_more_particles = false;
  int num_particles = 6;
  Particle[] particles = new Particle[num_particles];

  void drawdisplay() {
    for (int i = num_particles - 1; i >= 0; i--)
    {
      particles[i].update();
      particles[i].display();

      no_more_particles = true;
      if (particles[i].opacity > 1)
      {
        no_more_particles = false;
      }
    }
  }

  ParticleExplosion()
  {
    for (int i=0; i < num_particles; i++)
    {
      particles[i] = new Particle();
    }
  }
}

class Particle
{
  float posX;
  float posY;

  float directionX;
  float directionY;

  float speed;

  float opacity = 255;

  Particle() 
  {
    posX = mouseX;
    posY = mouseY;

    directionX = random(-1, 1);
    directionY = random(-1, 1);

    speed = random(2, 2.5);
  }

  void update() 
  {
    posX += speed * directionX;
    posY += speed * directionY;

    opacity -= 8f;
    speed -= 0.05f;
  }

  void display()
  {
    fill(255, opacity);
    rect(posX, posY, 1, 1);
  }
}


