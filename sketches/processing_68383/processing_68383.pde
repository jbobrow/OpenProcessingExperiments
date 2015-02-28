


//name of class
class Pred {
  //declare variables
  Vec3D loc = new Vec3D(); 
  Vec3D vel = new Vec3D();
  Vec3D acc = new Vec3D(); 
  
 
  
  //search for closest food
  float searchfield;
  Vec3D steer = new Vec3D();

  boolean mover;

  //constructor- create temporary variables
  Pred(Vec3D _loc, Vec3D _vel, float _searchfield, boolean _mover) {
    loc = _loc;
    vel = _vel;
    searchfield = _searchfield;
    mover = _mover;
    }


  //main function collector
  void run() {
    predbreed();
    display();

    //predcontrol();
    ecocontrol();
    update();
  }    

  //  void predcontrol () {
  //    //run through all predators and get them
  //    for (int i = 0; i < predsystem.size(); i ++) {
  //      Pred other = (Pred) predsystem.get(i);
  //      stroke(255, 0, 0);
  //      float distance3 = loc.distanceTo(other.loc);
  //      if (distance3 > 0 && distance3 < distbetween) {
  //        line(loc.x, loc.y, loc.z, other.loc.x, other.loc.y, other.loc.z);
  //      }
  //    }
  //  }


  void ecocontrol () {
    Vec3D steer = new Vec3D();
    Vec3D target = new Vec3D(); //store vector for movement to food

    int count = 0;
    //run through all prey and get them
    for (int i =0; i < ecosystem.size(); i++) {
      FoodParticle ptodie = (FoodParticle) ecosystem.get(i);
      //get distance between prey and predator
      float distance = loc.distanceTo(ptodie.loc);

      if (mover = true) {
        if ( distance > 0 && distance < searchfield) {
          target = ptodie.loc;
          Vec3D diff = target.sub(loc); // make shore your starting point is in the brackets
          float di = diff.magnitude();
          //diff.normalize();
          diff.normalizeTo(1/di);
          diff.scaleSelf(di/2);
          acc.addSelf(diff);
          count++;

          //        Vec3D diff = loc.subSelf(ptodie.loc);
          //        diff.normalizeTo(1.0/di);
          //        steer.addSelf(diff);
          //        count++;
        }
      }


            if (count > 0) {
              steer.scaleSelf(1.0/count);
          }

      //kill if within range of strike
      if ( distance > 0 && distance <= killrange) {
        deleteList.add(ptodie);
      }
    }
  }


  void predbreed() {
    Vec3D droppoint = new Vec3D(0, 0, 0);
    mover = false;
    Pred_addList.add(new Pred(loc, droppoint, searchfield, mover));
  } 


  void display() {
    stroke(0);
    strokeWeight(2);
    noFill();
    point(loc.x, loc.y, loc.z);
  }


  void update() {
    acc.addSelf(steer);
    vel.addSelf(acc);
    vel.limit(vellimit); //adds a threshold
    loc.addSelf(vel);
    acc.clear(); //resets function to run anew each frame


    //creates the box sides as the boundaries for the walkers
    if (loc.x >= (cubesize/2)) {
      vel.x*= -1;
    }
    else if (loc.x <= (-cubesize/2)) {
      vel.x*= -1;
    }
    if (loc.y >= (cubesize/2)) {
      vel.y*= -1;
    }
    else if (loc.y <= (-cubesize/2)) {
      vel.y*= -1;
    }
    if (loc.z >= (cubesize/2)) {
      vel.z*= -1;
    }
    else if (loc.z <= (-cubesize/2)) {
      vel.z*= -1;
    }
  }
  
} //---------------------------------------end class


