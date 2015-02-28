
Segment[] segments;
float del = 4;
float targetX;
float targetY;
float targetSize = 5;
boolean toggle = true;
void setup()
{
  size(800,600);
  segments = new Segment[100];
  for(int i=0;i<segments.length;i++)
  {
    segments[i] = new Segment(200,200+i*10,0);
  }
  background(255);
}
void draw()
{
  targetX += (mouseX-targetX)/del;
  targetY += (mouseY-targetY)/del;
  for(int i=segments.length-1;i>=0;i--)
  {
    if(mousePressed)
    {
      if(mouseButton == LEFT)
      {
        targetSize += .1;
      }
      if(mouseButton == RIGHT)
      {
        targetSize -= .1;
      }
    }
    segments[i].len += (targetSize-segments[i].len)/del;
    if(targetSize <= 5)
    {
      targetSize = 5;
    }
    if(i<segments.length-1)
    {
      segments[i].rot = atan2(segments[i+1].y-segments[i].y,segments[i+1].x-segments[i].x);
      segments[i].x = segments[i+1].x-cos(segments[i].rot)*segments[i].len;
      segments[i].y = segments[i+1].y-sin(segments[i].rot)*segments[i].len;
    }
    if(i==segments.length-1)
    {
      segments[segments.length-1].rot = atan2(targetY-segments[segments.length-1].y,targetX-segments[segments.length-1].x);
      segments[segments.length-1].x = targetX-cos(segments[segments.length-1].rot)*segments[segments.length-1].len;
      segments[segments.length-1].y = targetY-sin(segments[segments.length-1].rot)*segments[segments.length-1].len;
    }
    segments[i].display();
  }
}
void keyPressed()
{
  if(toggle)
  {
    for(int i=segments.length-1;i>=0;i--)
    {
      segments[i].col = color(255,255,255,50);
    }
  }
  else
  {
    for(int i=segments.length-1;i>=0;i--)
    {
      segments[i].col = color(0,0,0,50);
    }
  }
  toggle = !toggle;
}

class Segment
{
  float x,y;
  float rot;
  float len;
  color col;
  Segment(float tempx,float tempy,float temprot)
  {
    x = tempx;
    y = tempy;
    rot = temprot;

    len = 5;
    col = color(0,0,0,50);
  }
  void display()
  {
    pushMatrix();

    translate(x,y);
    rotate(rot);
    strokeWeight(1);
    stroke(col);
    line(0,0,len,0);

    popMatrix();
  }
}


