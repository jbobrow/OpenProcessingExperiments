
color night = color (16, 16, 112);
ArrayList sys;
void setup()
{
  size(750, 500);
  sys = new ArrayList();
}
int time;
int fuse = 500;
void draw()
{
  background(200);
  noFill();
  stroke(0);
  bezier(85,20,10,10,90,90,15,80);
  float t =norm(millis(),0,1e4);
  float x = bezierPoint(85,10,90,15,t);
  float y = bezierPoint(20,10,90,80,t);
  for(float n=random(1,10) ; n>0; n--)
    sys.add(new spark(x,y) );

  for (int n=sys.size()-1 ; n>0 ; n-- )
  {
    spark s = (spark)sys.get(n);
    s.draw();
    if(!s.alive) sys.remove(n);
  }
}
class spark
{
  float x, y;
  float vx, vy;
  float g=1; //g equals one
  color hot= color (225, 254, 0);
  color cold = color (100, 0, 0);
  int age = 0;
  int life = 200;
  boolean alive=true;
  spark(float xi, float yi)
  {
    x = xi;
    y = yi;
    vx = random(-10, 10);
    vy = random(-50, 10);
  }
  void move()
  {
    x += vx;  
    y+= vy;
    vy += g;
    if (y>height)
    {
      y=height;
      vy *= - random (0.3, 0.6);
    }
  }
  void draw ()
  {
    noStroke();
    age++;
    if (age<life)
    {
      float f = norm(age, 0, life);
      color c = lerpColor(hot, cold, f);
      fill(c);
      ellipse(x, y, 5, 5);
      move ();
    }
    else {
      alive= false;
    }
  }
}



