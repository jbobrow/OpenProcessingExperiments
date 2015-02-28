
color night = color(16, 16, 112);
ArrayList sys;
void setup()
{
  size (750,750);
  sys = new ArrayList();
}
void draw()
{
  background(night);
  sys.add(new spark(50,30) );
  
  for(int n=sys.size()-1 ; n>0 ; n--)
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
  float g=1;
  color hot = color(255, 254, 0);
  color cold = color (100, 0, 0);
  color night = color(16, 16, 112);
  int age = 0;
  int life = 200;
  boolean alive=true;
  spark(float xi, float yi)
  {
    x = xi;
    y = yi;
    vx = random(-10,10);
    vy = random(-50,10);
  }
  void move()
  {
    x += vx;  y+= vy;
    vy += g;
    if(y>height)
  {
    y=height;
    vy *= -random(0.3,0.6);
   }
  }
  void draw()
  {
    noStroke();
    age++;
    if (age<life)
    {
      float f = norm(age, 0, life);
      color c = lerpColor(hot, cold, f);
      fill(c);
      ellipse(x, y, 20, 20);
      move();
    }
    else
    {
    alive=false;
    } 
  }
}


