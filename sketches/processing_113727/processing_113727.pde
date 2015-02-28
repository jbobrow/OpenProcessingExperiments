
import toxi.geom.*;

//DECLARE
ArrayList ballCollection;

void setup() {
  
  size (900, 700);
  smooth();



  //INITIALIZE
  ballCollection = new ArrayList();

  for (int i = 0; i <200; i++) {
    Vec3D origin = new Vec3D(random(width), random(600), 0);
    Ball myBall = new Ball(origin);
    ballCollection. add(myBall);
  }
}

void draw () {
  background(255);

  //Call Functionality
  for ( int i = 0; i < ballCollection. size(); i++ ) {
    Ball mb = (Ball) ballCollection. get(i);
    mb. run();
  }
}


class Ball {
  //Global Variables
  Vec3D loc = new Vec3D (0, 0, 0);
  Vec3D speed = new Vec3D(random(-2, 2), random(-2, 2), random(-2,2));

  Vec3D acc = new Vec3D();

  Vec3D grav = new Vec3D(0, 4, 0);

  //Constructor
  Ball(Vec3D _loc) {
    loc = _loc;
  }

  //Functions
  void run() {
    display();
    move();
    bounce();
    
   lineBetween();
   flock();
  }

  void flock() {

    seperate(0.001);
    cohesion(0.004);
    align(0.001);
  }


  void align( float magnitude) {



    Vec3D steer = new Vec3D();

    int count = 0;

    for (int i = 0; i < ballCollection.size();i++) {

      Ball other = (Ball) ballCollection.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance> 0 && distance < 30) {

        steer.addSelf(other.speed);
        count++;
      }
    }

    if (count>0) {
      steer.scaleSelf(3.0/count);
    }

    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }




  void cohesion(float magnitude) {

    Vec3D sum = new Vec3D();
    int count = 0;
    for (int i = 0; i < ballCollection.size();i++) {

      Ball other = (Ball) ballCollection.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance> 0 && distance < 30) {

        sum.addSelf(other.loc);
        count++;
      }
    }

    if (count>0) {
      sum.scaleSelf(1.0/count);
    }
    Vec3D steer = sum.sub(loc);
    steer.scaleSelf(magnitude);

    acc.addSelf(steer);
  }




  void seperate(float magnitude) {

    Vec3D steer = new Vec3D();
    int count = 0;

    for (int i = 0; i < ballCollection.size();i++) {

      Ball other = (Ball) ballCollection.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance> 0 && distance < 30) {

        Vec3D diff = loc.sub(other.loc);
        diff.normalizeTo(1.0/distance);

        steer.addSelf(diff);
        count++;
      }
    }
    if (count > 0) {
      steer. scaleSelf(1.0/count);
    }

    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

  void lineBetween() {

    for (int i = 0; i < ballCollection.size();i++) {

      Ball other = (Ball) ballCollection.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance> 0 && distance < 40) {

        stroke(random(0,250),random(0,255));
        strokeWeight(0.8);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
      }
    }
  }

  void bounce() {
    if ( loc.x > width) {
      speed.x = speed.x * -1;
    }
    if ( loc.x < 0) {
      speed.x = speed.x * -1;
    }
    if ( loc.y > height) {
      speed.y = speed.y * -1;
    }
    if ( loc.y < 0 ) {
      speed.y = speed.y * -1;
    }
  }


  void move () {

    speed.addSelf(acc);
    speed.limit(2);

    loc.addSelf(speed);
    acc.clear();
  }


  void display() {
    
    fill (249,50,97);
    ellipse (loc.x, loc.y, 10, 10);
  }
}




