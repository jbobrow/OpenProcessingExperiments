
int numPoints = 50;
Point[] points = new Point[numPoints];
PGraphics pg;
PGraphics img;
int colo = 0; 
 
void setup()
{
  size(640, 360);
  pg = createGraphics(640, 360, JAVA2D);
  img = createGraphics(640, 360, JAVA2D);
  img.beginDraw();
  img.background(0,0,0,8);
   
  pg.beginDraw();
  pg.strokeWeight(1.5);
 
  pg.smooth();
  pg.colorMode(HSB);
 
pg.background(0);
 
 img.endDraw();
 
  for (int i = 0; i < numPoints; i++) {
  {
    points[i] = new Point(     width / 2,
          height / 2,
     i,  (int)random(-6 ,6 ));   }
  }
}
 
void draw()
{
  pg.beginDraw();
  {
    pg.blend(img, 0, 0, 640, 360, 0, 0, 640, 360, BLEND);
  }
  for (int i = 0; i < numPoints; i++) {
  points[i].move();
  }
  for (int i = 0; i < numPoints; i++) {
    points[i].display(); 
  }
      pg.stroke(colo,255,255,255);
      colo ++;
        if(colo > 255)
  colo = 0;

  pg.endDraw();
  image(pg, 0,0);
 
}
 
class Point {
  float x, y;
  int id;
  float dir;
  int Lenght;
 
  Point(int xin, int yin, int din, int dirin) {
    x = (float)xin;
    y = (float)yin;
     
        pg.point(x,y);
    id = din;
     dir = dirin;
     dir = dir * (PI /3);
    Lenght = 0;
  }
 
  void display()
  {
 
    pg.point(x,y);
    pg.point(width - x,y);
  //  pg.point(x, height - y);
    //pg.point(width - x, height- y);
  }
   
  void move()
  {
     if(Lenght == 17 )
    {
      Lenght =0;
       int temp = (int)random(-3 ,3 );  
      dir += temp * (PI /3);
    }
    if(x < 0 || x > width || y < 0 || y > height)
    {
      x = width/2;
      y = height/2;
     
      int temp = (int)random(-3 ,3 );  
      dir += temp * (PI /3);
      pg.point(x,y);
      Lenght = 0;
    }
    x += sin(dir) * 1.0;
    y += cos(dir) * 1.0;
    Lenght ++;
  }
}
 
void stop()
{
   
}


