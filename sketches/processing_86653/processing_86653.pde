
//AUTOR:ARANTXA PAVIA LOPEZ DE FELIPE
 
supertres[] b;
 
void setup()
{
  size(800, 600);
  noStroke();
  smooth();
 
  b= new supertres[200];
  for (int i=0; i<200; i++)
  {
    b[i]=new supertres();
    b[i].x=round(random(800));
    b[i].y=round(random(600));
    b[i].m1=round(random(1));
    b[i].m2=round(random(1));
    if (b[i].m1==0)
    {
      b[i].m1=random(-3, -1);
    }
    if (b[i].m1==1)
    {
      b[i].m1=random(1, 3);
    }
    if (b[i].m2==0)
    {
      b[i].m2=random(-3, -1);
    }
    if (b[i].m2==1)
    {
      b[i].m1=random(1, 3);
    }
  }
}
 
void draw()
{
  fill(0, 140);
  rect(0, 0, width, height);
  for (int i=0; i<200; i++)
  {
    b[i].show();
    b[i].bounce();
  }
 
}
 
class supertres
{
  float x, y, m1, m2;
 
  void show()
  {
    //fill(0,255,0);
    //megazero o boira
     fill(237,34,176);
    ellipse(60, x,y,80);
    
    //cuadradets
    //lila flojito
    fill(242,169,233);
    rect(x, y, 50, 50);
    //lila fuerte
    fill(162,15,148);
    rect(x, y, 40, 40);
    //azul
    fill(48,15,162);
    rect(x, y, 30, 30);
    //rojo
    fill(247,10,42);
    rect(x, y, 20, 20);
    //turquesa
    fill(10,247,206);
    rect(x, y, 10, 10);
  }
 
  void bounce()
  {
 
 
    x=x+m1;
    y=y+m2;
 
    if (x<=mouseX+18 && x>=mouseX && y>=mouseY-5 && y<=mouseY)
    {
      m1=random(1, 3);
      m2=random(-3, -1);
    }
    if (x<=mouseX+18 && x>=mouseX && y<=mouseY+25 && y>=mouseY)
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
    if (x>795)
    {
      m1=random(-3, -1);
    }
    if (x<5)
    {
      m1=random(1, 3);
    }
    if (y>595)
    {
      m2=random(-3, -1);
    }
    if (y<5)
    {
      m2=random(1, 3);
    }
  }
}


