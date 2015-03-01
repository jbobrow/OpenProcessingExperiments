
import toxi.geom.*;

ArrayList ballCollection;


void setup() {
  size(800, 600);
  smooth();
  noStroke();
  ballCollection = new ArrayList();

  for (int i = 0; i<250; i++) {
    Vec3D origin = new Vec3D(random(10,width-10),random(10,590),0);
    Ball myBall = new Ball(origin);
    ballCollection.add(myBall);
  }
}

void draw() {
   //fill(200,200,200,50);
   //rect(0,0,800,600);
   background(200);
   for (int i = 0; i < ballCollection.size (); i++) {
    Ball mb = (Ball) ballCollection.get(i);
    mb.run();
  }
}

class Ball {

  float radius = 5;

  Vec3D loc = new Vec3D ( 0, 0, 0);
  Vec3D speed = new Vec3D (random(-2, 2), random(-2, 2), 0);
  Vec3D grav = new Vec3D (0, 0.2, 0);
  Vec3D acc = new Vec3D();




  Ball(Vec3D _loc) {
    loc = _loc;
  }

  void run() {
    lineBetween();
    display();
    move();
    bounce();
    flock();
    //gravity();
    // changeR();
  }

  void flock() {
   //seperate(4);
    //cohesion();
    //allign();
  }

  void seperate(float magnitude) {
    Vec3D steer = new Vec3D();
    int count = 0;

    for (int i = 0; i<ballCollection.size (); i++) {
      Ball other = (Ball) ballCollection.get(i);
      float distance = loc.distanceTo(other.loc);

      if (distance > 0 && distance <30) {
        Vec3D diff = loc.sub(other.loc);
        diff.normalizeTo(1.0/distance);
        steer.addSelf(diff);
        count++;
      }
    }
    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }





  void lineBetween() {
    int count = 0;
    for (int i = 0; i<ballCollection.size (); i++) {
      Ball other = (Ball) ballCollection.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance <40) {
        stroke(map(distance, 0, 50, 255, 255));
        strokeWeight(0.4);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
        count++;
      }
    }
    radius = count*2+2;
    if(radius>8){
      radius = 8;
    }
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(loc.x, loc.y, radius, radius);
  }
  void move() {
    speed.addSelf(acc);

    speed.limit(2);

    loc.addSelf(speed);

    acc.clear();
  }

  void bounce() {
    if (loc.x>width-radius/2) {
      speed.x *= -1;
      loc.x = width-radius/2;
    }
    if (loc.x<radius/2) {
      speed.x *= -1;
      loc.x = radius/2;
    }
    if (loc.y>height-radius/2) {
      speed.y *= -1;
      loc.y = height-radius/2;
    }
    if (loc.y<radius/2) {
      speed.y *= -1;
      loc.y = radius/2;
    }
  }
  void gravity() {
    speed.addSelf(grav);
  }
  void changeR() {
    if (speed.y < 0 ) {
      radius -= 0.5 ;
    } else {
      radius = 20;
    }
  }
}

