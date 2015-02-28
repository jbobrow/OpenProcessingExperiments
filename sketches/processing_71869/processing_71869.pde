
// Matheson G. Mods:14/15 Computer Programming 1
/* @pjs globalKeyEvents="true"; */
int g=10;
int b=15;
int r=20;
int change1=3;
int change2=1;
int change3=1;
int d=10;
int s=15;
int changed=10;
int changes=15;
void setup()
{
  size(300, 300);
}
void draw()
{
  stroke(0);
  fill(0, 0, 0, 10);
  rect(0, 0, 300, 300);
  if (mouseButton==RIGHT)
  {


    stroke(r, g, b);
    ellipse(mouseX, mouseY, 10, 10);
    g=g+change3;
    r=r+change2;
    b=b+change1;
    if ( b> 255)
    { 
      change1=-1;
    }
    if (b<0)
    {
      change1=2;
    }
  }
  if (r>255)
  { 
    change2=-1;
  }
  if (r<0)
  { 
    change2=1;
  }
  if (g>255)
  { 
    change3=-1;
  }
  if (g<0)
  {
    change3=3;
  }
}
void mouseDragged()
{
  if (mouseButton==RIGHT)
  { 

    stroke(r, g, b);
    ellipse(300-mouseX, 300- mouseY, 10, 10);
  }
  else
  {
    if (mouseButton==LEFT)
    { 
      stroke(255, 155, 0);
      rect(mouseX, mouseY, 50, 50 );
      rect(300-mouseX, mouseY, 50, 50);
      stroke(250, 11, 3);
      line(mouseX, 150, 150, 250);
      line(300-mouseX, 150, 150, 250);
    }
  }
  if (keyPressed==true&&key;=='s')
  {
    stroke(74, 129, 193);
    bezier(20, 20, mouseX, 10, 10, mouseY, 280, 280);
    stroke(7, 240, 137);
    bezier(280, 280, mouseX, 10, 10, mouseY, 20, 20);
    stroke(g, r, b);
  }

  else {
    bezier(10, 300, mouseX, 50, 50, mouseY, 300, 20); 
    g=g+change3;
    r=r+change2;
    b=b+change1;
    if ( b> 255)
    { 
      change1=-1;
    }
    if (b<0)
    {
      change1=2;
    }
  }
  if (r>255)
  { 
    change2=-1;
  }
  if (r<0)
  { 
    change2=1;
  }
  if (g>255)
  { 
    change3=-1;
  }
  if (g<0)
  {
    change3=3;
  }
}

