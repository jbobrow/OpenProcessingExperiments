
nave[] n;
  
void setup()
{
  size(700,700);
  smooth(56);
  fill(0);
 
  n = new nave[50];
  for (int i=0; i<50; i++)
  {
    n[i] = new nave();
    n[i].y = random(-height, height);
    n[i].a = (int)random(10, 50);
    n[i].s = (int)random(1, 10);
  }
}
  
void draw()
{
  background(0);
  for (int i=0; i<n.length; i++)
  {
    n[i].move();
    n[i].show();
  }
  for (int i=0; i<n.length; i++)
  {
   
  }
}

class nave
{
  float x, y;
  int a, s;

  
  void show()
  {
    fill(0,0,255);
    ellipse(570,570,200,200);
    fill(122,122,122);
    rect(x, y, a, a);
    fill(255,0,0);
    ellipse(x,y,a,a);
   fill(255); 
   ellipse(x,y,s,s);
  fill(0,200,255); 
   ellipse(a,s,x,y); 
 
}
  
  void move()
  {
    x += ( mouseX - width/2  ) * 0.02 * s;
    y += ( mouseY - height/2 ) * 0.02 * s;
    x=x+random(10, 20);
    y=y+random(10, 20);
    if (x < -5)
    {
      x = 470;
    }
    if (x > 470)
    {
      x = 0;
    }
    if (y < -5)
    {
      y = 470;
    }
    if (y > 470)
    {
      y = 0;
    }
   
    }
  }

void keyPressed()
{
  
    for (int i=0; i<100; i++)
    {
      n[i].a=n[i].a-1;
    }
}



