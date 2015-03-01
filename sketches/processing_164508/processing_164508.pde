

PVector p1, p2;
Line l;
void setup()
{
  background(255);
  size(400,400);
  p1 = new PVector(10,10,0);
  p2 = new PVector(200,200,0);
  l = new Line(p1,p2);
  smooth();
  frameRate(10);
}

void draw()
{
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  //background(255,240);
  stroke(0);
  strokeWeight(1);
  l.draw();
    stroke(255,0,0,150);
  strokeWeight(10);
  PVector p1 = l.pointAt(abs(0.5+0.5*sin(frameCount/10.0)));
  point(p1.x,p1.y);
}

class Line
{
  
  PVector s,e;
  float px, py;
  
  Line(PVector p1, PVector p2)
  {
    s = p1;
    e = p2;
    px = p2.x-p1.x;
    py = p2.y-p1.y;
  }
  
  
  PVector pointAt(float t)
  {
    float x = p1.x+px*t;
    float y = p1.y+py*t;
    return new PVector(x,y);
  }
  
  void draw()
  {
    beginShape();
    for(float t = 0; t <= 1; t+=0.01)
    {
      PVector p = pointAt(t);
      vertex(p.x,p.y);
    }
    endShape();
  }
  
}


