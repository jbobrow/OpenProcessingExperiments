
int _num = 3;     
Circle[] _circleArr = {}; //array
 
void setup() 
{
  //background(0);  //for a painting
  size(500,500);
  drawCircles();
}
 
void draw() 
{  
  background(0); //for bubbles
 
  for (int i=0; i<_circleArr.length; i++) 
  {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
}
 
void mouseReleased() 
{
  drawCircles();
  drawCircles();
  drawCircles();
  drawCircles();
  drawCircles();
  drawCircles();
}
 
void drawCircles() 
{
  for (int i=0; i<_num; i++) 
  {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}

class Circle //array def -> drawn is only the array, nothing is drawn by itself
{
  float x, y;
  float radius;
  color linecol, fillcol;
  float xmove, ymove;
 
  Circle() 
  {
    x = random(width);
    y = random(height);
    radius = random(100) +10;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
 
    xmove = random(3) - 1.5;
    ymove = random(3) - 1.5;
  }
 
  void drawMe() 
  {
    noStroke();
    fill(fillcol,linecol);
    ellipse(x, y, radius, radius);
  }
 
  void updateMe() 
  {
    x += xmove;
    y += ymove;
    
    for (int i=0; i<_circleArr.length; i++) 
    {
      Circle otherCirc = _circleArr[i];
      
      if (otherCirc != this) 
      {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius - otherCirc.radius;
        
        if (overlap < 0) 
        {
          strokeWeight(4);
          float midx, midy;
          midx = (x + otherCirc.x)/2;
          midy = (y + otherCirc.y)/2;
          stroke(linecol,150);
          noFill();
          ellipse(midx, midy, overlap, overlap);
        }
      }
    }
 
    drawMe();
  }
}
