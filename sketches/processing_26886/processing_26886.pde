
class Particle
{

  PApplet parent;

  PVector location;
  PVector destination;
  PVector destination_temp;
  PVector velocity;
  float acceleration;
  float topspeed;

  boolean active;


  Particle(PApplet p) 
  {
    parent = p;
    init();
  }

  void init()
  {
    location = new PVector(0, 0);
    destination = new PVector(0, 0);
    destination_temp = new PVector(0, 0);
    velocity = new PVector(0, 0);
    acceleration = 2;
    topspeed = 10;

    active = true;
  }


  void update() 
  {

    velocity = PVector.sub(destination, location);
    velocity.normalize();

    velocity.mult(PVector.dist(destination, location)/5);
    velocity.limit(topspeed);



    location.add(velocity);
  }

  void display(int style) 
  {

    switch(style) {
    default:
      noStroke();
      pushMatrix();
      translate(location.x, location.y);
      rect(0, 0, 2, 2);
      popMatrix();
      break;
    }
  }
}


