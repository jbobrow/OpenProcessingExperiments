
//class to describe a single fish object

class Fish {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float life;
  float angle;
  float angleSpeed; //determines the sway of the tail
  float angleFish;

  float mass =1;

  //float angle;//=0.0; //have to declare this variable because it is essentially a property of the fish 
  //dont initiate here yet..technically it is better to initiate inside constructor
  //float angleSpeed;//=random(0.1,1); 


  Fish (PVector l) {
    location = l.get();
    velocity = new PVector (1,-1);
    velocity.x=constrain(velocity.x, -2,2);
    velocity.y=constrain(velocity.y,-2,2);
    acceleration = new PVector ();
    //float angleFish;
    angle=0;
    angleSpeed = random(0.3,0.5);
    life = 255;
    angleFish=30;
  }

  void run() {
    update();
    display();
  }

  void applyForce(PVector hand) {
    PVector f=hand.get();
    f.div(mass);
    acceleration.add(f);
  }





  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    life-=0.5;
  }


  void display() {

    angle=angle+angleSpeed;
    float offsetHead;
    float offsetTail;

    offsetHead=sin(angle+PI)*3;
    offsetTail=sin(angle+PI/2)*5;

    //fish body outline
    fill(240, 7, 38, life);
    stroke(240, 7, 38, life);
    pushMatrix();
    translate(location.x, location.y);

    //float rotateAngle = atan2(-yspeed,xspeed);

    //!!!!!
    angleFish=atan2(velocity.y, velocity.x);
    //!!!

    rotate((angleFish)+HALF_PI);
    scale(0.65);
    beginShape();
    vertex((offsetTail), -10);
    bezierVertex((-30+offsetHead), -80, (30+offsetHead), -80, (offsetTail), -10);
    endShape();
    popMatrix();
  }

  boolean dead() {
    if (life <= 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}


