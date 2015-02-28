
class Leg {
  float woffset, x, y, x2, y2;
  FBox body, shin, thigh;
  FRevoluteJoint derp, derp1;
  float segLength;
  float Strength = 3000;
  Leg(float x1, float y1, float woffset1, FBox body1, float segLength1) {
    x = x1;
    y = y1;
    woffset = woffset1;
    body = body1;
    segLength = segLength1;
    thigh = new FBox(segLength/4, segLength);
    thigh.setPosition(x, y-(segLength/2));
    thigh.setNoStroke();
    thigh.setGroupIndex(numGuys);
    thigh.setFriction(5);
    world.add(thigh);

    shin = new FBox(segLength/4, segLength);
    shin.setPosition(x, y-(segLength*1.5));
    shin.setNoStroke();
    shin.setGroupIndex(numGuys);
    shin.setFriction(5);
    world.add(shin);

    derp = new FRevoluteJoint(thigh, body, (float)x, (float)y);
    derp.setEnableMotor(true);
    derp.setMaxMotorTorque(Strength*(segLength/50));
    derp.setMotorSpeed(1);
    derp.setDrawable(false);
    world.add(derp);

    derp1 = new FRevoluteJoint(thigh, shin, (float)x, (float)y-segLength);
    derp1.setEnableMotor(true);
    derp1.setMaxMotorTorque(Strength*(segLength/100));
    derp1.setMotorSpeed(1);
    derp1.setDrawable(false);
    world.add(derp1);
  }
  void segment(float x, float y, float a) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    line(0, 0, segLength, 0);
    popMatrix();
  }
  void updateLeg(float wangle, float speed) {
    x2 = body.getX();
    y2 = body.getY();
    float dx = ((rotate(new PVector(0, segLength*.6), wangle+woffset+PI).x)*2)+x2 - x;
    float dy = ((rotate(new PVector(0, segLength*.6), wangle+woffset).y)/1)+y2+(segLength*1.5) - y;
    float angle1 = atan2(dy, dx);
    float tx = ((rotate(new PVector(0, segLength*.6), wangle+woffset+PI).x)*2)+x2 - cos(angle1) * segLength;
    float ty = ((rotate(new PVector(0, segLength*.6), wangle+woffset).y)/1)+y2+(segLength*1.5) - sin(angle1) * segLength;
    dx = tx - x2;
    dy = ty - y2;
    float angle2;
    if (speed>0) {
      angle2 = maxi(atan2(dy, dx), angle1-.1);
    }
    else {
      angle2 = mini(atan2(dy, dx), angle1+.1);
    }
    x = x2 + cos(angle2) * segLength;
    y = y2 + sin(angle2) * segLength;
    if (keyPressed) {
      if (key == 's' || key == 'S') {
        segment(x, y, angle1); 
        segment(x2, y2, angle2);
      }
      if (key == '+' || key == '+') {
        Strength+=25;
        derp.setMaxMotorTorque(Strength*(segLength/50));
        derp1.setMaxMotorTorque(Strength*(segLength/50));
      }
      if ((key == '-' || key == '-')&&(Strength>0)) {
        Strength-=25;
        derp.setMaxMotorTorque(Strength*(segLength/50));
        derp1.setMaxMotorTorque(Strength*(segLength/50));
      }
    }
    text("+/- to change Strength: "+Strength,500,30);
    derp.setMotorSpeed((thigh.getRotation()-(angle2+(PI/2)))*11);
    derp1.setMotorSpeed((shin.getRotation()-(angle1+(PI/2)))*-11);
  }
}

class Biped {
  float wangle = 0;
  public FBox a;
  Leg leg1, leg2;
  float speed;
  float size;
  Biped(int x, int y, float speed1, float size1) {
    size = size1;
    speed = speed1;
    a = new FBox(25, 25);
    a.setPosition(x, y);
    a.setGroupIndex(numGuys);
    a.setNoStroke();
    a.setStatic(false);
    a.setRotatable(false);
    //a.setFriction(100);
    world.add(a);
    leg1 = new Leg(a.getX(), a.getY(), (float)0, a, size);
    leg2 = new Leg(a.getX(), a.getY(), (float)PI, a, size);
    numGuys--;
  }
  void updateWalker() {
    wangle -=.04*speed;
    leg1.updateLeg(wangle, speed);
    leg2.updateLeg(wangle, speed);
  }
}

PVector rotate(PVector point, float angle) {
  PVector rotated_point = new PVector(0, 0);
  rotated_point.x = (point.x * cos(angle) - point.y * sin(angle));
  rotated_point.y = (point.x * sin(angle) + point.y * cos(angle));
  return rotated_point;
}

float mini(float input, float est){
  return input<est?est:input;
}
float maxi(float input, float est){
  return input>est?est:input;
}


