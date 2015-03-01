
class Particle
{

  float x, y, vx, vy, diam, a;
  boolean dead = false;

  Particle(float _x, float _y)
  {
    x = _x;
    y = _y;
    diam = random(5, 50);
    a = 1;
    vx = mVelx*.07+random(-5, 5);
    vy = mVely*.07+random(-5, 5);
  }

  void update()
  {
    vx += noise(x*.01, y*.01, frameCount*.02)-.5;
    vy += noise(x*.01, y*.01, frameCount*.02+35674)-.5;

    x+=vx;
    y+=vy;
    a*=.98;

    //diam = diam - 1;  
    diam++;

    if (a < .000004)
    {
      dead = true;
    }
  }

  void display()
  {
    float r = atan2(vy, vx);
    
    fill(random(0,150), random(0,150), random(0,150), 255);

    pushMatrix();
    translate(x, y);
    rotate(r);
    ellipse(-x, -y, diam, diam);
    popMatrix();
    
    
  }
}


ArrayList parts;
float mVelx, mVely;

void setup()
{
  size(800, 600, P3D);

  // Construct array list
  parts = new ArrayList();

}

void draw()
{
  background(0); 
  noStroke();

  for (int i = 0; i < parts.size();)
  {  
    Particle p = (Particle) parts.get(i);
    if (p.dead == true)
    {
      parts.remove(i);
    }
    
    p.update();
    p.display();
    i++;
    
  }
  
    
   
}

void mouseDragged()
{
  for (int i = 0; i < 5; i++)
  {
     parts.add(new Particle(mouseX, mouseY)); 
  }
}



