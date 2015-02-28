
float x, y, w, h;

void setup()
{
  size(400, 400);
  x= width/2;
  y= height/2;
  w= width;
  h=height;
}

void draw()
{
  background(0, 0, random(255));
  figure();
  if (keyPressed)
  {
    if (key=='a')
      x=x-width*.01;
    else if (key=='d')
      x=x+ width*.01; 
    else if (key=='w')
      y=y-height*.01;
    else if (key=='x')
      y=y+height*.01;
    else if (key==CODED)
    {
      if (keyCode==UP)
      { 
        w=w*1.02;
        h=h*1.02;
      }
    }
  }
  if (mousePressed==true)
  {
    w=w/1.02;
    h=h/1.02;
  }
}
void figure()
{
  noStroke();

  fill(255,255,random(255));
  ellipse(x,y,w*.64,h*.64);
  fill(255,255,random(255));
  ellipse(x,y,w*.58,h*.58);
  fill(255,255,random(255));
  ellipse(x,y,w*.54,h*.54);
  fill(255,255,0);
  ellipse(x, y, w*.5, h*.5);
  fill(0);
  ellipse(x-w*.1,y-h*.1,w*.04,h*.04);
  ellipse(x+w*.1,y-h*.1,w*.04,h*.04);
  fill(255,60,70);
  arc(x, y*1.01, w*.4, h*.4, 0, PI);
  
}
