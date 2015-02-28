
import fisica.*;

FWorld world;
FBox box1;
FBox box2;
FBox floor;
FRevoluteJoint joint;
Walker walker;

void setup() {
  size(400, 400);
  smooth();

  Fisica.init(this);
  newWorld();
}


Walker randomWalker(){
    float leg1W = random(10,100);
    float leg1H = random(2,20);
    float leg2W = random(10,100);
    float leg2H = random(2,20);
    float jointOffsetX = random(0,.5);
    float jointOffsetY = random(0,.5);
    float motorSpeed = random(-10,10);
return new Walker(leg1W, leg1H, leg2W, leg2H, jointOffsetX, jointOffsetY, motorSpeed);
}
void newWorld() {
  world = new FWorld();
  walker = randomWalker();
  walker.addToWorld(world);

  floor = new FBox(width*4, 20);
  floor.setPosition(width/2, height);
  world.add(floor);
  floor.setStatic(true);
}
void draw() {
  if (frameCount%300 == 0) {
    walker.removeFromWorld(world);
    world = new FWorld();

    newWorld();
  }
  else {

    background(255);
    world.draw();
    world.step();
  }
}

class Walker {
  FBox leg1;
  FBox leg2;
  FRevoluteJoint joint;  
  float[] dna;


  Walker(float[] dna){
    
  }
  
  Walker(float leg1W, float leg1H, float leg2W, float leg2H, float jointOffsetX, float jointOffsetY, float motorSpeed){
        this.leg1 = new FBox(leg1W, leg1H);
    this.leg1.setPosition(10, height-leg1H-leg2H);
    this.leg2 = new FBox(leg2W, leg2H);
    this.leg2.setPosition(leg1.getX()+leg1.getWidth()*.9, leg1.getY());

    this.joint = new FRevoluteJoint(this.leg1, this.leg2, this.leg2.getX()-leg2.getWidth()*jointOffsetX, this.leg2.getY()-leg2.getHeight()*jointOffsetY);
    this.joint.setEnableMotor(true);
    this.joint.setMotorSpeed(10);
    this.joint.setMaxMotorTorque(100);
    this.joint.setCollideConnected(false);

  }

  void addToWorld(FWorld w) {
    w.add(this.leg1);
    w.add(this.leg2);
    w.add(this.joint);
  }
  
  void removeFromWorld(FWorld w){
    w.remove(this.leg1);
    w.remove(this.leg2);
    w.remove(this.joint);
  }
  
}

