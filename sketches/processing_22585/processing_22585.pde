
boolean[] TF = {false,true};
int _width = 640;
int _height = 480;
boolean erase;
int _alpha;

MovingPolygon r = new MovingPolygon(255,0,0,4);
MovingPolygon g = new MovingPolygon(0,255,0,3);
MovingPolygon b = new MovingPolygon(0,0,255,5);

void setup()
{
  size(_width,_height);
  background(0);
  smooth();
  erase = true;
  _alpha = 255;
}

void draw()
{
  if(erase)
    background(0);
  r.move();
  g.move();
  b.move();
}

void keyPressed()
{
  if(erase)
  {
    erase = false;
    _alpha = 16;
     background(0);
  }
   else
   {
     erase = true;
     _alpha = 255;
   }
}
// ContainedPoint, a point which moves inside some boundaries
class ContainedPoint
{
  public int x = 20;
  public int y = 20;
  int speedY = 1;
  int speedX = 1;
  int dirY = 1;
  int dirX = 1;
  int border = 0;
  int origX = 0;
  int origY = 0;
  int endX = 640;
  int endY = 480;
  int maxW = endX - border;
  int maxH = endY - border;
  int minW = 0 + border;
  int minH = 0 + border;

  ContainedPoint(int x, int y, int dirX, int dirY, int speedX, int speedY, int origX, int origY, int endX, int endY, int border)
  {
    this.x = x;
    this.y = y;
    this.dirX = dirX;
    this.dirY = dirY;
    this.speedX = speedX;
    this.speedY = speedY;
    
    this.border = border;
    this.origX = origX;
    this.origY = origY;
    this.endX = endX;
    this.endY = endY;
    
    this.maxW = this.endX - this.border;
    this.maxH = this.endY - this.border;
    this.minW = this.origX + this.border;
    this.minH = this.origY + this.border;
  }
  
  public void move()
  {
    this.x += this.speedX * this.dirX;
    this.y += this.speedY * this.dirY;

    if(this.x >= this.maxW)
      this.dirX = -1;
    else if(this.x <= this.minW)
      this.dirX = 1;
    if(this.y >= this.maxH)
      this.dirY = -1;
    else if(this.y <= this.minH)
      this.dirY = 1;
  } 
}

class MovingPolygon
{
  private ContainedPoint[] points;
  int r,g,b,q;

/*  MovingPolygon(int r,int g, int b)
  {
      int q = round(random(3,15));
      MovingPolygon(r,g,b,q);
  }*/
  MovingPolygon(int r,int g, int b, int q)
  {
    this.r = r;
    this.g = g;
    this.b = b;
    this.q = q;
    int x,y,dirX,dirY,speedX,speedY,origX,origY,endX,endY,border;
    points = new ContainedPoint[q];
    for(int i = 0; i < q; i++)
    {
      origX = 0;
      origY = 0;
      endX = _width;
      endY = _height;
      border = 0;
      x = round(random(origX,endX));
      y = round(random(origY,endY));
      if(TF[round(random(0,1))])
        dirX = 1;
      else
        dirX = -1;
      if(TF[round(random(0,1))])
        dirY = 1;
      else
        dirY = -1;
      speedX = round(random(0,20));speedX = 5;
      speedY = round(random(0,20));speedY = 5;
      this.points[i] = new ContainedPoint(x,y,dirX,dirY,speedX,speedY,origX,origY,endX,endY,border);
      //println(x+","+y+","+dirX+","+dirY+","+speedX+","+speedY+","+origX+","+origY+","+endX+","+endY+","+border);
    }
  }
  
  void move()
  {
    int i;
    stroke(this.r,this.g,this.b,_alpha);
    for(i = 0; i < (this.q - 1); i++)
      line(this.points[i].x,this.points[i].y,this.points[i+1].x,this.points[i+1].y);
    line(this.points[i].x,this.points[i].y,this.points[0].x,this.points[0].y);
    for(i = 0; i < this.q; i++)
    {
      this.points[i].move();
      //println(i + ": " + this.points[i].x + " " + this.points[i].y);
    }
  }
}

