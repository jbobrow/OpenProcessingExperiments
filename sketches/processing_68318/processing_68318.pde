
int WIDTH = 600;
int HEIGHT = 400;
ArrayList pts = new ArrayList();

float cr, cg, cb;

void setup()
{
  size(600,400);
  cr = random(100)+50;
  cg = random(100)+50;
  cb = random(100)+50;
}

void draw()
{
  fill(0,45);
  rect(0,0,WIDTH,HEIGHT);
  fill(255);
  
  for (int i = 0; i < pts.size(); i++)
  {
    Particle p = (Particle) pts.get(i);
  
    p.update();
    p.display();
    
    for (int j = 0; j < pts.size(); j++)
    {
      if (i == j)
      {
        continue;
      }
      else
      {
        Particle q = (Particle) pts.get(j);
        if (p.checkCollision(q) == true)
        {
          p.collide();
          q.collide();
          int[] r = new int[10];
          for (int count = 0; count < 5; count++)
          {
            r[count*2] = floor(p.getx());
            r[(count*2)+1] = floor(p.gety());
          }
          for (int count = 0; count < 5; count++)
          {
            for (int count2 = 0; count2 < pts.size(); count2++)
            {
              if (pts.size() < 6)
              {
                strokeWeight(floor(random(pts.size()))+1);
              }
              else
              {
                strokeWeight(floor(random(6))+1);
              }
              stroke(0,random(200),random(80)+160);
              int nr1 = floor(random(201)) - 100;
              int nr2 = floor(random(201)) - 100;
              line(r[count*2],r[(count*2)+1],r[count*2]+nr1,r[(count*2)+1]+nr2);
              r[count*2] += nr1;
              r[(count*2)+1] += nr2;
            }
          }
          strokeWeight(1);
        }
        stroke(cr,cg,cb);
        cr += random(8)-4;
        cg += random(8)-4;
        cb += random(8)-4;
        if (cr < 50) {cr = 50;} else if (cr > 150) {cr = 150;}
        if (cg < 50) {cg = 50;} else if (cg > 150) {cg = 150;}
        if (cb < 50) {cb = 50;} else if (cr > 150) {cb = 150;}
        line(p.getx(),p.gety(),q.getx(),q.gety());
        stroke(190);
      }
    }
  
    if (mousePressed && mouseButton == LEFT && i == pts.size()-1)
    {
      p.snap(mouseX,mouseY);
    }
    
    if (p.getx() < -30 || p.getx() > WIDTH+30 || p.gety() > HEIGHT+30)
    {
      pts.remove(i);
    }
  }
  
  stroke(190);
  line(0,HEIGHT-20,WIDTH,HEIGHT-20);
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    pts.add(new Particle(mouseX,mouseY,0.0,0.0));
  }
  if (mouseButton == RIGHT)
  {
    for (int i = pts.size()-1; i >= 0; i--)
    {
      pts.remove(i);
    }
  }
}

void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    Particle p = (Particle) pts.get(pts.size()-1);
    p.release(mouseX,mouseY,pmouseX,pmouseY);
  }
}

class Particle
{
  float x;
  float y;
  float mx;
  float my;
  color c;
  
  Particle(float x, float y, float mx, float my)
  {
    this.x = x;
    this.y = y;
    this.mx = mx;
    this.my = my;
    
    c = color(random(150)+100,random(150)+100,random(150)+100);
  }
  
  void snap(float x, float y)
  {
    this.x = x;
    this.y = y;
    mx = 0;
    my = 0;
  }
  
  void release(float x1, float y1, float x2, float y2)
  {
    mx = x1-x2;
    my = y1-y2;
    
    if (my == 0)
    {
      my = 1;
    }
  }
  
  void update()
  {
    mx *= 0.996;    
    x += mx;
    y += my;
    
    if (x < 0 || x > WIDTH)
    {
      mx = -mx;
    }
    
    if (y > HEIGHT-20)
    {
      //my *= 0.95;
      my = -my;
    }
    else if (my > 0.0)
    {
      my *= 1.1;
      if (my > 15)
      {
        my = 15;
      }
    }
    else if (my < 0.0)
    {
      my *= 0.9;
      if (my > -1)
      {
        my = 1;
      }
    }
  }
  
  void display()
  {
    fill(c);
    ellipse(x,y,10,10);
  }
  
  boolean checkCollision(Particle q)
  {
    if (x < q.getx()+5 && x > q.getx()-5 && y < q.gety()+5 && y > q.gety()-5)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  void collide()
  {
    mx = -mx*2.0;
    my = -my*2.0;
    
    if (mx > 15)
    {
      mx = 15;
    }
    if (mx < -15)
    {
      mx = -15;
    }
  }
  
  float getx()
  {
    return x;
  }
  
  float gety()
  {
    return y;
  }
  
  float getmx()
  {
    return mx;
  }
  
  float getmy()
  {
    return my;
  }
  
  color getc()
  {
    return c;
  }
}

