
float bgHue = 0;
Fuse fuse;
Maxim maxim;
   
void setup()
{
  size(640, 480); 
  maxim = new Maxim(this);
}
 
void draw()
{
  colorMode(HSB, 100);
  background(bgHue, 80, 90);
  bgHue = (bgHue + 0.07) % 100;
  if (fuse != null)
  {
    fuse.draw();
    fuse.burn(2.0);
  }
}
 
void mousePressed()
{
  fuse = new Fuse(new Point(mouseX, mouseY));
}
 
void mouseReleased()
{
  fuse.lit = true;
  fuse.fusePlayer.play();
}
   
 
void mouseDragged()
{
 fuse.addPoint(new Point(mouseX, mouseY));
}
 
class Point {
 int _x;
 int _y;
 
 Point (int x, int y)
 {
   _x = x;
   _y = y;
 }
  
 int x()
 {
   return _x;
 }
  
 int y()
 {
   return _y;
 }
}
 
class Fuse {
  Point[] points;
  boolean lit = false;
  boolean exploded = false;
  float burnBucket = 0;
  int fuseLength = 0;
  AudioPlayer fusePlayer;
  AudioPlayer hitPlayer;
   
  Fuse(Point pt)
  {
    points = new Point[1];
    points[0] = pt;
    fusePlayer = maxim.loadFile("Fuse1.mp3");
    fusePlayer.setLooping(true);
    hitPlayer = maxim.loadFile("Hit1.mp3");
    hitPlayer.setLooping(false);
  }
   
  void draw()
  {
    if (points != null && exploded == false)
    {
      colorMode(RGB, 100);
      stroke(100);
      strokeWeight(6);
      if (points.length > 2)
      {
        for (int i =0; i < points.length - 1; i++)
        {
          line(points[i].x(), points[i].y(), points[i + 1].x(), points[i + 1].y());
        }
      }
    }
  }
     
  void addPoint(Point pt)
  {
    int l = points.length;
    points = (Point[]) expand(points, l + 1);
    points[l] = pt;
    fuseLength += 1;
  }
   
  void burn(float burnLength)
  {
    if (points != null && lit == true && exploded == false)
    {
      if (points.length > 2)
      {
        if (dist(points[0].x(),points[0].y(),points[1].x(), points[1].y()) > burnLength + burnBucket)
        {
          burnBucket += burnLength;
        }
        else
        {
            arrayCopy(points, 1, points, 0, points.length - 1);
            fuseLength -= 1;
            burnBucket = 0;
//            println(fuseLength);
            if (fuseLength < 1)
            {
              explode();
            }
        }
      } 
    }
  }
   
  void explode()
  {   
    colorMode(RGB, 100);
    background(100);
    lit = false;
    exploded = true;
    fusePlayer.stop();
    hitPlayer.play();
  }
}



