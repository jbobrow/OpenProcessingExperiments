
E[] b;
 
void setup()
{
  size(600, 600);
  noStroke();
  smooth();
 
  b= new E[250];
  for (int i=0; i<250; i++)
  {
    b[i]=new E();
    b[i].x=round(random(600));
    b[i].y=round(random(600));
    b[i].z1=round(random(1));
    b[i].z2=round(random(1));
    if (b[i].z1==0)
    {
      b[i].z1=random(-3, -1);
    }
    if (b[i].z1==1)
    {
      b[i].z1=random(1, 3);
    }
    if (b[i].z2==0)
    {
      b[i].z2=random(-3, -1);
    }
    if (b[i].z2==1)
    {
      b[i].z1=random(1, 3);
    }
  }
}
 
void draw()
{
  fill(0, 100);
  rect(0, 0, width, height);
  //no utilizo array.
  for (int i=0; i<250; i++)
  {
    b[i].show();
    b[i].bounce();
  }
 
}
 
class E
{
  float x, y, z1, z2;
 
  void show()
  {
    //fill(rosa);
    fill(105, 0, 145);
    ellipse(x, y, 7, 7);
    //fill (dentro de fill)
    fill(200);
    ellipse(x, y, 2, 2);
  }
 
  void bounce()
  {
 
 
    x=x+z1;
    y=y+z2;
 
    if (x<=mouseX+100 && x>=mouseX && y>=mouseY-5 && y<=mouseY )
    {
      z1=random( 1, 3 );
      z2=random( -3, -1 );
    }
        if (x>595)
    {
      z1=random( -3, -1 );
    }
    if (x<5)
    {
      z1=random( 1, 3 );
    }
    if (y>595)
    {
      z2=random( -3, -1 );
    }
    if (y<5)
    {
      z2=random( 1, 3 );
    }
    if (x<=mouseX+100 && x>=mouseX && y<=mouseY+25 && y>=mouseY )
    {
      z1=random( 1, 3 );
      z2=random( 1, 3 );
    }
 
    if (x>=mouseX-5 && x<=mouseX && y<=mouseY+25 && y>=mouseY )
    {
      z1=random( -3, -1 );
      z2=random( -3, -1 );
    }
    if (x>=mouseX-5 && x<=mouseX && y>=mouseY-5 && y<=mouseY )
    {
      z1=random( -3, -1 );
      z2=random( 1, 3 );
    }

  }
}


