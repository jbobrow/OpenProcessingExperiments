
float x=-90;
int lim;

void setup()
{
  size(500, 500);
  fill(100, 50, 0);
}

void draw()
{
  background(0);
  translate(250, 450);
  noStroke();
  rect(0, 0, 5, -80);
  translate(0, -80);
  ang=radians(map(mouseX, 0, 500, 0, 90));
  x=x+0.02;
  galho(80);
}

void galho(float t)
{
  t=t*0.8;
  if(t>10)
  {
    pushMatrix();
    rotate(ang);
    noStroke();
    rect(0, 0, 5, -t);
    if(t<20)
    {
      stroke(0, 255, 0);
      line(0, 0, 0, -t);
      line(5, 0, 5, -t);
    }
    translate(0, -t);
    galho(t);
    popMatrix();
    pushMatrix();
    rotate(-ang);
    noStroke();
    rect(0, 0, 5, -t);
    if(t<20)
    {
      stroke(0, 255, 0);
      line(0, 0, 0, -t);
      line(5, 0, 5, -t);
    }
    translate(0, -t);
    galho(t);
    popMatrix();
  }
}

void keyPressed()
{
  if(key==CODED)
  {
    if(keyCode==UP)
    {
      lim=lim+1;
    }
    else
    {
      if(keyCode==DOWN)
      {
        if(lim>0)
        {
          lim=lim-1;
        }
      }
    }
  }
}
