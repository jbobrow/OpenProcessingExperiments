
public class Body {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float density;
  color bodyColor;
  boolean dead = false;
  float radius;
  PVector shock;

  Body(PVector _location, float _mass, float _density, color _color) {
    location = _location.get();
    mass = _mass;
    density = _density;
    bodyColor = _color;
    velocity = new PVector(0,0);
    location = _location.get();
    acceleration = new PVector(0,0);
    shock = new PVector(0,0);
  }

  void attract(PVector _attraction, float _mass) {

    PVector distance = PVector.sub(_attraction, location);
    PVector gravity = distance.get();
    gravity.normalize();
    gravity.div(sq(distance.mag()));
    gravity.mult(_mass);
    acceleration = PVector.add(acceleration, gravity);

    //gas pressure is dependent on temperature and concentration...
    //but lets see how it works with just some wacky cumulative distance
    PVector pressure = distance.get();
    pressure.normalize();
    float temperature = 36;
    //distance.mag();
    pressure.mult(-temperature);
    pressure.div(sq(distance.mag())*distance.mag());

    acceleration = PVector.add(acceleration, pressure);
    acceleration = PVector.add(acceleration, shock);
  }

  void initializeVelocity(PVector _attraction, float _mass) {

    PVector distance = PVector.sub(_attraction, location);
    float theta = atan2(distance.x, distance.y);
    theta += PI/2;
    float velocitymag = _mass * 0.1 /sqrt(distance.mag());
    velocity.set(velocitymag * sin(theta),velocitymag * cos(theta),0);
    // println(velocity.mag());

    if (random(1) < 0.5) {
      velocity.mult(-1);
    }
  }

  void changeVelocity(float _increment) {
    // print(velocity.mag() + "\t");
    PVector increment = velocity.get();
    increment.normalize();
    increment.mult(_increment/3);
    velocity.add(increment); 
    //println(velocity.mag());
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity); 
    acceleration.mult(0);
    radius = pow(mass,0.45)/(2*density);
  }

  void display() {
    noStroke();
    image(blur,location.x-15*radius,location.y-15*radius,30*radius, 30*radius);
    fill(bodyColor);
    ellipse(location.x, location.y, max(1,2*radius), max(1,2*radius));
  }

  PVector getLocation() {
    return location.get();
  }

  float getRadius() {
    return radius;
  }

  void setDead(boolean _dead) {
    dead = _dead;
  }

  boolean checkDeath() {
    return dead;
  }

  void setShock(PVector _s) {
    shock = _s.get();
  }
}


