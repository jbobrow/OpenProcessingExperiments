
Balloon b;
ArrayList<Balloon> balloons;
boolean fire;
int col;

Particle[] particles1;
Particle[] particles2;

int amountP = 100;
int amountPcount = 100;

color from = color(255);
color to = color(50);

void setup()
{
  size(700, 400);
  frameRate(60);
  background(0);
  smooth();
  b = new Balloon();
  balloons = new ArrayList<Balloon>();
  fill(255);
  particles1 = new Particle[amountP*100];
  particles2 = new Particle[amountP*100];
}

void draw() {

  background(0);
  stroke(255);
  noStroke();

  for (int i = 0; i < balloons.size(); i++)
  {
    balloons.get(i).draw();
  }


  if (fire) 
  {
    for (int k = 0; k < amountP; k++)
    {
      particles1[k].drawParticle();
      particles2[k].drawParticle();
    }
  }
}

void mouseReleased()
{ 
  if (mouseButton == LEFT) {
    b = new Balloon();
    balloons.add(b); 
  }
  else {
    for (int u = 0; u < 10; u++) {
      b = new Balloon();
      balloons.add(b); 
    }
  }
}

class Balloon
{
  float x;
  float y;
  float growth;

  Balloon()
  {
    x = random(0, 700);
    y = random(0, 400);
    growth = 0;
  }

  void draw()
  {
    float dx = x - mouseX;
    float dy = y - mouseY;
    boolean del;
    float balloonRadius = (5 + (growth/2) + 50);
    float distance = (float) Math.sqrt(((dx*dx) + (dy*dy)));
    
    growth = growth + (1 * (distance / 700));
    del = true;
    ellipse(x, y, 10 + growth, 10 + growth);

    del = false;

    for (int i = 0; i < balloons.size(); i++)
    {
      if (del == true)
      {
        break;
      }

      for (int j = 0; j < balloons.size(); j++)
      {
        if (i != j && balloons.get(i).touches(balloons.get(j)))
        {
          fire = true;
          for (int k = 0; k < amountPcount; k++)
          {
            col = lerpColor(to, from, random(0, 1));
            particles1[k] = new Particle(random(-30, 30), random(-30, 30), this.x, this.y, color(col), int(random(20, 100)));
            particles2[k] = new Particle(random(-30, 30), random(-30, 30), balloons.get(j).x, balloons.get(j).y, color(col), int(random(20, 100)));
          }
          amountPcount=amountPcount+100;
          if (amountPcount>=10000)
          {
            amountPcount = 100;
          }
          balloons.remove(i);
          balloons.remove(j-1);
          del = true;
          break;
        }
      }
    }

    background(0);
    for (Balloon b : balloons) {
      ellipse(b.x, b.y, 10 + b.growth, 10 + b.growth);
    }
  }

  boolean touches(Balloon other)
  {
    float dx = other.x - this.x;
    float dy = other.y - this.y;
    float distance = (5 + (other.growth/2)) + (5 + (this.growth/2));

    return (Math.hypot(dx, dy) < distance);
  }
}



class Particle {
  float  velY, velX;
  float x, y, px, py;
  float ballWidth, ballHeight;
  color col;
  int life;

  Particle(float velX_, float velY_, float x_, float y_, color col_, int life_) {
    velY = velY_;
    velX = velX_;
    ballHeight = 10;
    ballWidth = 10;
    x = x_;
    y = y_;
    px = x_;
    py = y_;
    col = col_;
    life = life_;
  }

  void drawParticle()
  {
    y = y + velY;
    x = x + velX;
    if (life > 0)
    {
      stroke(col, life);
      strokeWeight(5);

      line(px, py, x, y);
      px = x;
      py = y;
      life--;
    }
  }
}


