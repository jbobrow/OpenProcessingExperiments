
class Particle
{
 float x,y,vx,vy,age;
  Particle()
{
  x= random(width);
  y = random(height);
  age = 0;
  vx = random(-5,5);
  vy = random(-5,5);
}

void update()
{
 x+=vx;
 y+=vy; 
  age++;
  
  
}
  
  void display()
  {
    ellipse(x,y,15,15);
    stroke(random(0,255),10,145);
    strokeWeight(3);
  }
  
}


ArrayList parts;
void setup()
{
  size(800,800);
  
  parts = new ArrayList();
  for(int i = 0; i < 1; i++)
  {
   parts.add(new Particle()); 
  }
  
}


void draw()
{
  background(0);
  noFill();
  parts.add(new Particle());
  for(int i = 0; i < parts.size();i++)
  {
   Particle p = (Particle) parts.get(i);
   p.update();
   p.display();
    if(p.age > 30)
    {
      parts.remove(i);
    }
  }
  
  
}
