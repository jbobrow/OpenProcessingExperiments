
Points[] p = new Points[400];
float distance = 35;
float MyDiameter = 300;
 
void setup() 
{
  size(500, 500);
  smooth();
  for (int i = 0; i<p.length;i++) 
  {
    p[i] = new Points(MyDiameter);
  }
}
 
void draw() 
{
  background(255);
  for (int i = 0; i<p.length; i++) 
  {
    for (int j = 0; j<p.length; j++) 
    {
      if (i!=j) {
        float d = sqrt(pow(p[i].x()-p[j].x(), 2) + pow(p[i].y()-p[j].y(), 2));
        if (d<distance) {
          stroke(40/35, 40/35, 110, 1200/d);
          strokeWeight(0.1);
        line(p[i].x(), p[i].y(), p[j].x(), p[j].y());
        }
      }
    }
  }
   
  for (int i = 0; i<p.length;i++) 
  {
      p[i].update();
      p[i].display();
  }
}
 
 
class Points {
  PVector origin;
  PVector distance;
  PVector pos;
  PVector vel;
  float vx;
  float vy;
  float MyDiameter;
  float radius;
  float angle;
  float scale;
   
  Points(float MyDiameter_)
  {
     
    vx = random(-1, 1);
    vy = random(-1, 1);
    scale = 2;
    MyDiameter = MyDiameter_;
    radius = map(noise(random(0, 1000)), 0, 1, -MyDiameter/2, MyDiameter/2);
    angle = map(noise(random(1001, 2000)), 0, 1, 0, 2*PI);
    pos = new PVector (width/2+radius*cos(angle), height/2+radius*sin(angle));
    vel = new PVector (scale*vx, scale*vy);
    origin = new PVector (width/2, height/2);
  }
   
  void update() 
  {
    pos.add(vel);
  }
   
  void display() 
  {
    distance = PVector.sub(origin, pos);
    if (distance.mag()>=MyDiameter/2)
    {
      vel.x *= -1;
      vel.y *= -1;
    }
  }
   
   
  float x() 
  {
    return pos.x;
  }
   
   
  float y() 
  {
    return pos.y;
  }
}
