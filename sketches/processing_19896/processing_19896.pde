
class Boxes {

  PVector pos;
  PVector vel;
  float w,h;
  float damp;
  int sW,sH;
  float dw,dh;

  Boxes( float screenW, float screenH)
  {
    w = random(20,30);
    h = w*random(1,1.2);
    dh = 0;
    dw = 0;
    damp = .0001;

    pos = new PVector(screenW+w+random(0,200), screenH*.5 + h*.5 + random(-20,20), 0);
    vel = new PVector(0,0,0);

    sW = int(screenW);
    sH = int(screenH);
  }

  void addForce( PVector f)
  {
    vel.add(f);
  }

  void update()
  {
    //back to start
    if( pos.x+dw < 0 )
    {
      pos.x = sW+w+random(0,sW);
      pos.y = sH*.5+random(-20,20);
      dw = w;
      dh = h;
      vel.x = 0;
      vel.y = 0;
    } 


    // add velocity
    pos.add(vel);

    // damping on y
    vel.y -= damp * vel.y;

    // gravity
    vel.x -= .025;

    // grow
    float pct = 1-map(pos.x,0,sW,0,1);
    if(pct < 0 ) pct = 0;
    if(pct > 1) pct = 1;
    pct = pow(pct,1.95);
    dw = 4+w*(pct)*1.5;
    dh = 4+h*(pct)*1.5;
  }

  void render()
  {
    rect(pos.x,pos.y-dh*.5,dw*.75,dh*.95);
  }

  void collide(ArrayList sisters, int me) {
    float spring = .03;
    for (int i = 0; i < sisters.size(); i++) {
      if(i==me)continue;
      Boxes sis = (Boxes)sisters.get(i);
      float dx = sis.pos.x - pos.x;
      float dy = sis.pos.y - pos.y;

      float minDist = sis.dw + dw;

      if(rectangle_collision(pos.x, pos.y-dh*.5, dw, dh, sis.pos.x, sis.pos.y-sis.dh*.5, sis.dw,sis.dh)) {
        float angle = atan2(dy, dx);
        float targetX = pos.x + cos(angle) * minDist;
        float targetY = pos.y + sin(angle) * minDist;
        float ax = (targetX - sis.pos.x) * spring;
        float ay = (targetY - sis.pos.y) * spring;
        vel.x -= ax;
        vel.y -= ay;
        sis.vel.x += ax;
        sis.vel.y += ay;
        vel.x*=.9;
        vel.y*=.125;
      }
    }
  }
}


