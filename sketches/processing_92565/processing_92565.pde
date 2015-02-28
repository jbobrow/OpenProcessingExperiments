
physicsline p1;
ball b;
ArrayList<physicsline> walls;
void setup()
{
  frameRate(20);
  ellipseMode(CENTER);
  size(500, 500, P2D)  ;  
  walls = new ArrayList<physicsline>();
  p1 = new physicsline(0, 250, 250, 500);
  physicsline p2 = new physicsline(250, 0, 0, 250);
  physicsline p3 = new physicsline(250, 0,500, 250 );
  physicsline p4 = new physicsline(500, 250, 250, 500);
  physicsline p5 = new physicsline(0, 150, 500, 150);

  b = new ball(300, 200, 5);
  b.velocity.x = -3;
  b.velocity.y = 8;
  walls.add(p1);
  walls.add(p2);
  walls.add(p3);
  walls.add(p4);
  walls.add(p5);
}

void draw()
{
  background(255);
  //b.velocity.y;
  b.update();
  for (physicsline ln : walls)
  {

    ballwall(b, ln);
    ln.draw();
  }
  b.draw();
}

void ballwall(ball b1, physicsline wall1)
{
  ellipse((wall1.midpoint.x), (wall1.midpoint.y), 10, 10);
  //ellipse(wall1.midpoint.x,wall1.midpoint.y,5,5)  float distance = wall1.distancefrompoint(b1.position.x, b1.position.y);
  ////println(distance);
  if (abs(wall1.distancefrompoint(b1.position.x, b1.position.y)) <b1.radius)
  {
    ////print(b1.velocity+"  ");
    float mag = b1.velocity.mag();
    //if (!(b1.velocity.x < 0 ^ b1.velocity.y <0))
   //{
    //mag *=-1;
   //} 
  float deltaX = wall1.midpoint.x-b1.position.x;
    float deltaY = wall1.midpoint.y-b1.position.y;
    float at = degrees(atan(deltaX/deltaY));
    
    //b1.position.sub(b1.velocity);
    //deltaX *= -1;
    //deltaY *= -1;
    b1.velocity.normalize();
    float w = (wall1.p1.x-wall1.p2.x)/(wall1.p1.y - wall1.p2.y);
    float s = degrees(atan(w));
    s+= degrees(PI/2)-degrees(atan((b1.velocity.x/b1.velocity.y)));
    at+= degrees(atan((b1.velocity.x/b1.velocity.y)));
    
    //rotate(s.heading2D());
    //println("  "+(s));
    
    b1.velocity.x =  (cos((radians(s))));


    b1.velocity.y = (sin((radians(s))));
    //println(b1.velocity);

    b1.velocity.normalize();
    b1.velocity.mult(-1);
    b1.velocity.mult(mag);
    b1.position.add(b1.velocity);
  }
}

class ball
{
  PVector position, velocity;
  float mass = 1;
  float radius;
  ball(float _x, float _y, float _r)
  {
    position = new PVector(_x, _y);
    velocity = new PVector(0, 0);
    radius = _r;
  } 
  void draw()
  {
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  void update()
  {
    fill(0);
    text(""+(velocity), 10, 10);
    noFill();
    position.x += velocity.x;
    position.y += velocity.y;
  }
}


class physicsline
{
  PVector p1, p2;
  float slope;
  float xintercept;
  PVector midpoint = new PVector(0, 0); 

  float change= 0;
  float distance;

  physicsline(float x1, float y1, float x2, float y2)
  {
    p1 = new PVector(x1, y1);
    p2 = new PVector(x2, y2); 
    distance = dist(x1, y1, x2, y2);
    slope = (y2-y1)/(x2-x1);
    xintercept = -((slope*x1)-y1);
  }
  void draw()
  {
    line(p1.x, p1.y, p2.x, p2.y);
  }
  float distancefrompoint(float x, float y)
  {

    float ds = (y-(slope*x)-xintercept)/sqrt(sq(slope)+1);
    float dst = abs(ds);
    float d = (sqrt(sq(dist(x, y, p1.x, p1.y))-sq(ds)))/dist(p1.x, p1.y, p2.x, p2.y); 

    midpoint.x = p1.x-((p1.x-p2.x)*d);
    midpoint.y = p1.y-((p1.y-p2.y)*d);


    //translate(p1.x,p1.y);


    //translate(-p1.x,-p1.y);
    if (dist(x, y, p1.x, p1.y) > abs(dst) && dist(x, y, p2.x, p2.y) >abs(dst)) {
      return  ds;
    }
    else {
      if  (dist(x, y, p1.x, p1.y) < dist(x, y, p2.x, p2.y)) {
        return dist(x, y, p1.x, p1.y);
      }
      else {
        return dist(x, y, p2.x, p2.y);
      }
    }
  }
  float slopefrompoint(float x, float y)
  {
    float dst = abs(y-(slope*x)-xintercept)/sqrt(sq(slope)+1); 

    if (dist(x, y, p1.x, p1.y) > dst && dist(x, y, p2.x, p2.y) >dst) {
      return  pow(slope, -1)*-1;
    }


    else {
      if  (dist(x, y, p1.x, p1.y) < dist(x, y, p2.x, p2.y)) {
        return atan2(y-p1.y, x-p1.x);
      }
      else {
        return atan2(y-p2.y, x-p2.x);
      }
    }
  }
  boolean isnegative(float x, float y) {
    float dstneg = (y-(slope*x)-xintercept)/sqrt(sq(slope)+1);
    if (dstneg<0) {
      return true;
    }
    else {
      return false;
    }
  }
}
