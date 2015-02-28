
import toxi.geom.*;


ArrayList ballCollection;

void setup () {
  size(600, 600);
  smooth();

  ballCollection=new ArrayList ();

  for (int i=0; i<200; i++) {
    Vec3D origin = new Vec3D(random(width),random(200),0);
    Ball myBall = new Ball (origin);
    ballCollection.add(myBall);
  }
}

void draw() {
  background(0);

  for (int i= 0; i < ballCollection.size(); i++) {
    Ball mb= (Ball) ballCollection.get(i);
    mb.run();
  }
}

class Ball {
  //global variables

  Vec3D loc = new Vec3D (0, 0, 0);
  Vec3D speed = new Vec3D (random(2,8), random(-2,-8), 0);

  //constructor
  Ball(Vec3D _loc) {
    loc = _loc;
  }
  //functions
  void run() {
    //display
    display();
    //move
    move();
    //bounce
    bounce();
  }

  void bounce () {
    if (loc.y > height) {
      speed.y= speed.y *-1;
    }
    if (loc.y < 0) {
      speed.y=speed.y *-1;
    }
    if (loc.x> width) {
      speed.x=speed.x*-1;
    }
    if (loc.x<0) {
      speed.x=speed.x*-1;
    }
  }

  void move() {


    loc.addSelf(speed);
  }

  void display() {
    ellipse(loc.x, loc.y, 20, 20);
  }
}



