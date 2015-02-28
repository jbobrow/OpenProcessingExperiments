
Point POINT_Array[];
int pointcount = 15;
void setup()
{

  size(300,300);
  background(200);
  POINT_Array = new Point[pointcount];
  for(int i = 0;i<pointcount;i++)
  {
    POINT_Array[i] = new Point(random(width),random(height),3);
  }
}
void draw()
{
  background(220);
  for(int i = 0;i<pointcount;i++)
  {
    float xDist;
    float yDist;
    for(int j=0;j<pointcount;j++)
    {
      if(i!=j)
      {
        xDist = POINT_Array[i].x-POINT_Array[j].x;
        yDist = POINT_Array[i].y-POINT_Array[j].y;
        POINT_Array[i].x += 1/(xDist/POINT_Array[j].e);
        POINT_Array[i].y += 1/(yDist/POINT_Array[j].e);
        if (mousePressed && (mouseButton == LEFT)) {
          stroke(150);
          line(POINT_Array[i].x,POINT_Array[i].y,POINT_Array[i].x + 15/(xDist/POINT_Array[j].e),POINT_Array[i].y+15/(yDist/POINT_Array[j].e));
        }
      }
    }
    if(int(random(5000))==1)
    {
      POINT_Array[i].x = random(width);
      POINT_Array[i].y = random(height);
    }
    POINT_Array[i]._draw();
  }
}
//THE POINT CLASS
class Point
{
  float x; 
  float y; 
  float r;
  float e;
  Point(float X, float Y,float R)
  {
    x = X;
    y = Y;
    r = R;
    e = (random(50));
  }
  void _draw()
  {
    stroke(100,100,100);
    point(x,y);
    line(x,y+r,x+r*0.7,y+r*0.7);
    line(x+r*0.7,y+r*0.7,x+r,y);
    line(x+r,y,x+r*0.7,y-r*0.7);
    line(x+r*0.7,y-r*0.7,x,y-r);
    line(x,y-r,x-r*0.7,y-r*0.7);
    line(x-r*0.7,y-r*0.7,x-r,y);
    line(x-r,y,x-r*0.7,y+r*0.7);
    line(x-r*0.7,y+r*0.7,x,y+r);
    this.check_loc();
  }
  void check_loc()
  {
    float xda,xdb,yda,ydb;
    xda = this.x;
    xdb = width-this.x;
    yda = this.y;
    ydb = height-this.y;
    this.x+=1/(xda/50);
    this.x-=1/(xdb/50);
    this.y+=1/(yda/50);
    this.y-=1/(ydb/50);
    if(this.x>width||this.x<0)
    {
      this.x = width/2;
    }
    if(this.y>height||this.y<0)
    {
      this.y = height/2;
    }
  }
}




