
/*imanes con letra y raton y polos opuestos con raton
 Adrià Sánchez Gallego*/
cuadraditos[] c;
 
void setup()
{
  size(500, 500);
  noStroke();
  smooth();
 
  c= new cuadraditos[100];
  for (int i=0; i<100; i++)
  {
    c[i]=new cuadraditos();
    c[i].x=round(random(10));
    c[i].y=round(random(10));
    c[i].m1=round(random(5));
    c[i].m2=round(random(5));
    if (c[i].m1==0)
    {
      c[i].m1=random(-3, -1);
    }
    if (c[i].m1==1)
    {
      c[i].m1=random(1, 3);
    }
    if (c[i].m2==0)
    {
      c[i].m2=random(-3, -1);
    }
    if (c[i].m2==1)
    {
      c[i].m1=random(1, 3);
    }
  }
}
 
void draw()
{
  fill(0, 140);
  rect(0, 0, width, height);
  for (int i=0; i<100; i++)
  {
    c[i].show();
    c[i].bounce();
    if (mousePressed)
    {
      c[i].x = mouseX + random(-40, 40);
      c[i].y = mouseY + random(0, 40);
    }
  }
 
}
 
class cuadraditos
{
  float x, y, m1, m2;
 
  void show()
  {
    fill(0,255,0);
    //fill(125, 255, 145);
    rect(x, y, 10, 10);
    fill(255);
    ellipse(x, y, 5, 5);
    
  }
 
  void bounce()
  {
 
 
    x=x+m1;
    y=y+m2;
 
    if (x<=mouseX+20 && x>=mouseX && y>=mouseY-5 && y<=mouseY)
    {
      m1=random(1, 10);
      m2=random(-3, -1);
    }
    if (x<=mouseX+20 && x>=mouseX && y<=mouseY+25 && y>=mouseY)
    {
      m1=random(1, 3);
      m2=random(1, 3);
    }
 
    if (x>=mouseX-5 && x<=mouseX && y<=mouseY+25 && y>=mouseY)
    {
      m1=random(-3, -1);
      m2=random(-3, -1);
    }
    if (x>=mouseX-5 && x<=mouseX && y>=mouseY-5 && y<=mouseY)
    {
      m1=random(-3, -1);
      m2=random(1, 3);
    }
    if (x>500)
    {
      m1=random(-3, -1);
    }
    if (x<5)
    {
      m1=random(1, 3);
    }
    if (y>500)
    {
      m2=random(-3, -1);
    }
    if (y<50)
    {
     m2=random(1, 3);
    }
     
  }
}
void keyPressed()
{
  if (key == 'z'|| key == 'z')
    for (int i=0; i<100; i++)
    {
      c[i].m2=c[i].m2-1;
    }
}


