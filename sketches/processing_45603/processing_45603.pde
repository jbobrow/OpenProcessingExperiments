
import peasy.*;
import toxi.geom.*;

//declare
ArrayList flockCollection;
int coll=200;

//global variables
PeasyCam cam;

void setup() {
  size(800, 400, P3D);
  cam = new PeasyCam(this,500);
  flockCollection=new ArrayList();
  for (int i = 0; i < coll; i++) {
    Vec3D origin=new Vec3D(random(50), 0,random(10));
    Flock myFlock = new Flock(origin);
    flockCollection.add(myFlock);
  }
}
void draw() {
  background(255);
  noFill();
  stroke(255, 141, 0);
  strokeWeight(1);
//  box(2000, 700, 700);

  for (int i=0;i<flockCollection.size();i++) {
    Flock mf = (Flock) flockCollection.get(i);
    mf.run();
  }
}

class Flock {
  //Vec3D pos;
  //global variables
  Vec3D loc=new Vec3D (0, 0, 0);
  Vec3D acc=new Vec3D();
  Vec3D speed=new Vec3D(random(2, -2), random(2, -4), random(4, -2));
  Vec3D grav=new Vec3D(0, 0, 0.5);
  float magnitude;

  //constructor
  Flock(Vec3D _loc) {
    loc=_loc;
  }

  void run() {
    display();
    move();
    bounce();
    gravity();
    lineBetween();//to add lines in between two points
    flock();
  }
  void flock() {
    separate(1);
    cohesion(0.005);
    align(0.2);
  }
  //based on vector math if two flock is to close with a certain distance it will moveaway
  //dir=direction of separation command
  void separate(float magnitude) {
    Vec3D dir = new Vec3D();
    int count = 0;

    for (int i=0;i<flockCollection.size();i++) {
      //flock is being written other flocks is connected with 
      Flock other=(Flock) flockCollection.get(i);

      float distance=loc.distanceTo(other.loc);
      //20=is pixels 
      if (distance>0 && distance <20) {
        //calculation with substraction between
        Vec3D diff = loc.sub(other.loc);
        //movement smoother
        diff.normalizeTo(1.0/distance);

        dir.addSelf(diff);
        //each time added 1 and add 1 vector to the dir.addSelf to the count
        count++;
      }
    }
    //scaling the iterations
    if (count>0) {
      dir.scaleSelf(1.0/count);
    }
    dir.scaleSelf(magnitude);
    acc.addSelf (dir);
  }
//magnitude is to set the scale factor
  void  cohesion(float x) {
    Vec3D sum = new Vec3D();
    int count = 0;

    for (int i=0;i<flockCollection.size();i++) {
      Flock other=(Flock) flockCollection.get(i);

      float distance=loc.distanceTo(other.loc);

      if (distance>0 && distance <40) {
        sum.addSelf(other.loc);
        count++;
      }
    }
    if (count > 0) {
      sum.scaleSelf(1.0/count);
    }
    Vec3D dir=sum.sub(loc);
    dir.scaleSelf(magnitude);
    acc.addSelf(dir);
  }

  void  align(float magnitude) {
    Vec3D dir = new Vec3D();
    int count = 0;

    for (int i=0;i<flockCollection.size();i++) {
      Flock other=(Flock) flockCollection.get(i);

      float distance=loc.distanceTo(other.loc);

      if (distance>0 && distance <40) {
        dir.addSelf(other.speed);
        count++;
      }
    }
    if (count>0) {
      dir.scaleSelf(1.0/count);
    }
    dir.scaleSelf(magnitude);
    acc.addSelf(dir);
  }
  void move() {
    //speed will add to itself to vector acceleration
    speed.addSelf(acc);
     //threshold for the velocity
    speed.limit(5);
    loc.addSelf(speed);
    //every frame is generated speed is constrained by speed limit and back to 0 
    acc.clear();
  }

  void bounce() {
    if (loc.x>200) {
      speed.x=speed.x*-1;
    }
    if (loc.x<-200) {
      speed.x= speed.x*-1;
    }
    if (loc.y>125) {
      speed.y=speed.y*-1;
    }
    if (loc.y<-125) {
      speed.y= speed.y*-1;
    }
    if (loc.z>125) {
      speed.z=speed.z*-1;
    }
    if (loc.z<-125) {
      speed.z= speed.z*-1;
    }
  }

  void gravity() {
    speed.addSelf(grav);
  }
  void lineBetween() {
    //flock collection

      for (int i=0;i<flockCollection.size();i++) {
      //instance of the flock taking each time one element 
      Flock other=(Flock) flockCollection.get(i);
      //this is calculating distance between two points
      float distance=loc.distanceTo(other.loc);
      //this drawing line in a defined distance between two points
      if (distance>0 && distance <100) {
        stroke (255, 50, 0);
        strokeWeight(0.05);
        //line(x1, y1, z1, x2, y2, z2) --line in 3d world
        line(loc.x, loc.y, loc.z, other.loc.x, other.loc.y, other.loc.z );
      }
    }
  }
  void display() {
    strokeWeight(3);
    point( loc.x, loc.y, loc.z);
  }
}

                
                
