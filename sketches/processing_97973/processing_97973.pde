
/*
Borrwed from website "procesig.org"
*/

color night = color(0);
ArrayList sys;
 
 
void setup()
{
  size(700, 500);
  sys = new ArrayList();
 
}
float cx,cy;
void draw()
{
  background(night);
   
 float time = norm(frameCount, 0 , 100);
 float angle = lerp(0,TWO_PI, time);
 float sx = cos(angle);
 float sy = sin(angle);
 cx = map(sx, -1,1,width/4, 3*width/4);
 cy = map(sy, -1,1,width/4, 3*width/4);
 for (float n=random(1,12) ; n>0 ; n--)
  sys.add(new spark(cx,cy) );
  for ( int i=sys.size()-1;  i>0 ; i--)
  {
    spark s = (spark)sys.get(i);
    if (s.alive) {
      s.draw();
      s.move();
       
    } else{
      sys.remove(i);
       
    }
  }
}
 
class spark
{
  color hot = color(#E51313);
  color cold = color(#FEFF48);
 
  int age=0;
  int life=250;
  boolean alive=true;
 
  void draw()
  {
    noStroke();
    age++;
    if (age<life)
    {
      float a = norm (age, 0, life);
      color c = lerpColor (hot, cold, a);
      fill(c);
      ellipse(x, y, 5, 5);
    }
    else
    {
      alive=false;
    }
  }
  float x, y;
  float vx, vy;
  float g=1;
 
  void move ()
  {
    x += vx;
    y+= vy;
    vy+= g;
    if ( y>height)
          y=height;
      vy *= -random(0.3, 0.6);
     
  }
  spark( float xi, float yi)
  {
    x = xi;
    y = yi;
    vx = random(-5, 6);
    vy = random(-5, 6);
  }
}
       


