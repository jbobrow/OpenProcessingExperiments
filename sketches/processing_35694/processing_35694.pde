

class Ball {

  //global variables

  //float x;
  //float y;
  //int z = 0;
  //float speedX = 2;
  //float speedY = .3; 

  //Vec3D grav = new Vec3D (0, 0.2, 0);
  

  Vec3D loc = new Vec3D (0, 0, 0);
  Vec3D speed = new Vec3D (random(-2, 2), random(-2, 2), 0);
  //Vec3D grav = new Vec3D (0, 0.2, 0);
  Vec3D acc = new Vec3D();
  
  Vec3D bacc = new Vec3D();
  //constructors
  Ball(Vec3D _loc) {

    loc = _loc;
  }

  //functions 
  void run() {
    display();
    move();
    bounce();
    //gravity();
    flock();
    // lineBetween();
  } 

  void flock() {
    separate(1);
    cohesion(0.001);
    align(.1);
    scare(500);
  }

  void align(float magnitude) {

    Vec3D steer = new Vec3D();
    int count = 0; 

    for (int i = 0; i < ballCollection.size(); i++) {
      Ball other = (Ball) ballCollection.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 40) {

        steer.addSelf(other.speed);
        count++;
      }
    }

    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);

    
    //in other words accelerate towards the direction defined by
    //the speed of the other objects
    acc.addSelf(steer);
  }
  
  
  
  
    void separate(float magnitude) {

    Vec3D steer = new Vec3D();
    int count = 0; 

    for (int i = 0; i < ballCollection.size(); i++) {
      Ball other = (Ball) ballCollection.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 30) {

        //diff is a vector  which equals the difference between vectors and always
        //has an exactly opposite direction to the 'other' vector.
        Vec3D diff = loc.sub(other.loc);

        //magnitude becomes 1/distance for every vector diff
        diff.normalizeTo(1.0/distance);

        //an accumulation of the diffs - don't quite understand this one.
        steer.addSelf(diff);
        count ++;
      }
    
            if (count > 0) {
      steer.scaleSelf(1.0/count);
    }
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }

    
    
    }
  
  
  
  
  void scare(float magnitude) {

    Vec3D stop = new Vec3D();
    int count = 0; 

      float distance = loc.distanceTo(bloc);
      if (distance > 0 && distance < 80) {

        //diff is a vector  which equals the difference between vectors and always
        //has an exactly opposite direction to the 'other' vector.
        Vec3D diff = loc.sub(bloc);

        //magnitude becomes 1/distance for every vector diff
        diff.normalizeTo(1.0/distance);

        //an accumulation of the diffs - don't quite understand this one.
        stop.addSelf(diff);
        count ++;
      }
    
    
        if (count > 0) {
      stop.scaleSelf(1.0/count);
    }
    stop.scaleSelf(magnitude);
    acc.addSelf(stop);
  }

  void cohesion(float magnitude) {

    Vec3D sum = new Vec3D();
    int count = 0;

    for (int i = 0; i < ballCollection.size(); i++) {
      Ball other = (Ball) ballCollection.get(i);
      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 60) {

        sum.addSelf(other.loc);
        count ++;
      }
    }

    if (count > 0) {
      sum.scaleSelf(1.0/count);
    }

    //importantly it is the average minus the unique which gives
    //a direction from the unique to the average.
    Vec3D steer = sum.sub(loc);

    steer.scaleSelf(magnitude);

    Vec3D stop = sum.sub(loc);

    stop.scaleSelf(magnitude);

    acc.addSelf(steer);
    
    bacc.addSelf(stop);
  }

  /*void lineBetween() {
   
   for (int i = 0; i < ballCollection.size(); i++) {
   Ball other = (Ball) ballCollection.get(i);
   float distance = loc.distanceTo(other.loc);
   if (distance > 0 && distance < 40) {
   stroke(255, 0, 0);
   strokeWeight(2);
   line(loc.x, loc.y, other.loc.x, other.loc.y);
   }
   }
   }*/


  void display() {
    
    noStroke();
    fill(250,0,0,random(50,200));
    ellipse(loc.x, loc.y, 10, 10);
  }

  //void gravity() {
  //speed.addSelf(grav);
  // }

  void move() {
    speed.addSelf(acc);

    speed.addSelf(bacc);

    speed.limit(2);

    loc.addSelf(speed);

    acc.clear();
    
    bacc.clear();
  }

  void bounce() {
    if (loc.x >= width -100){
      speed.x = speed.x - 0.1;
    }
    if (loc.x < 100) {
      speed.x = speed.x + 0.1;
    }
    if (loc.y >= width -100){
      speed.y = speed.y - 0.1;
    }
    if (loc.y < 100) {
      speed.y = speed.y + 0.1;
    }
  }
}


