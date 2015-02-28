
class BallLine{
  float x ;
  float y ;
  float r ;
  float addmouse;
  float addloc;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  float vx = 0;
  float vy = 0;
  int id;

  float _xNow;
  float _yNow;

  int ir;

  BallLine[] others;

  BallLine( float x_, float y_, float r_, float _addmouse, float _addloc, int _ir, BallLine[] oin){
    x = x_;
    y = y_;
    r = r_;
    ir = _ir;
    others = oin;
    addmouse = _addmouse;
    addloc = _addloc;
    _xNow = xNow + addloc;
    _yNow = yNow + addloc;
    location = new PVector(random(0,width),random(0,height));
    velocity = new PVector(x,y);
    topspeed = 0;

  }


  void update() {

    topspeed = myMouseSpeed; //myMouseSpeed + addmouse
    PVector mouse = new PVector(xNow,yNow);
    PVector dir = PVector.sub(mouse,location);
    dir.normalize();   
    dir.mult(addmouse);    
    acceleration = dir;


    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    acceleration.mult(0);

  }


void collide() { 
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].r/2 + r/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = location.x + cos(angle) * minDist;
        float targetY = location.y + sin(angle) * minDist;
        float ax = (targetX - others[i].x)*spring;
        float ay = (targetY - others[i].y)*spring;
        location.x -= ax;
        location.y -= ay;
        others[i].vx += ax/20;
        others[i].vy += ay/20;
      }
    }   
  }

  void move() {
    //vy += 0 ;
    x += vx;
    y += vy;
   
  }


  void display(){

    stroke(255,0,0);
    //line(xNow,yNow,x,y);
    noStroke();
    fill(10);
    ellipse(x, y, r, r);

  }
}





