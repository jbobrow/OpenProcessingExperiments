


class Fish {

  //Propertise
  Vec3D loc; 
  Vec3D vel; 
  Vec3D acc; 

  //Constructor
  Fish(Vec3D loc, Vec3D vel, Vec3D acc) {
    this.loc = loc; 
    this.vel = vel;
    this.acc = acc;
  }

  // Methods
  void run() {
    display();
    swim();
    turnback();

    lineBetween();
    flock();
  }


  void display() {
    stroke(255);
    fill(255); 
    ellipse(loc.x, loc.y, 10, 10);
    if (showVectors) {
      drawVector(vel, loc, 5);
      drawVector(acc, loc, 25);
    }
  }

  void swim() {
    vel.addSelf(acc);
    vel.limit(15);
    loc.addSelf(vel);
    acc.clear();
    //print(vel);
  }

  void turnback() {
    if ((loc.y > height-100) || (loc.y < 100)) {
      vel.y *= -1;
    }
    if ((loc.x < 100) || (loc.x > width-100)) {
      vel.x *= -1;
    }
  }

  void fishbox() {
    stroke(255);
    noFill();
    rect(100, 100, 400, 400);
  }

  Vec3D getVel() {
    return vel;
  }
  Vec3D getAcc() {
    return acc;
  }
  Vec3D getLoc() {
    return loc;
  }
  void setLoc(Vec3D loc) {
    this.loc = loc;
  }
  void setVel(Vec3D vel) {
    this.vel = vel;
  }
  void setAcc(Vec3D acc) {
    this.acc = acc;
  }

  void flock() {

    separate(10);
    cohesion(0.001);
    align(0.1);
  }

  void align(float magnitude) {
    Vec3D steer = new Vec3D();
    int count = 0;

    for (int i = 0; i < fishCollection.size(); i++) {
      Fish other = (Fish) fishCollection.get(i);

      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 40) {

        steer.addSelf(other.vel);
        count++;
      }
    }

    if (count > 0) {      
      steer.scaleSelf(1.0/count);
    }

    steer.scaleSelf(magnitude);

    acc.addSelf(steer);
  }


  void cohesion(float magnitude) {
    Vec3D sum = new Vec3D();
    int count = 0;  

    for (int i = 0; i < fishCollection.size(); i++) {
      Fish other = (Fish) fishCollection.get(i);

      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 60) {

        sum.addSelf(other.loc);
        count++;
      }
    }  
    if (count > 0) {       
      sum.scaleSelf(1.0/count);
    }

    Vec3D steer = sum.sub(loc);
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  }


  void separate(float maganitude) {

    Vec3D steer = new Vec3D();
    int count = 0;

    for (int i = 0; i < fishCollection.size(); i++) {
      Fish other = (Fish) fishCollection.get(i);

      float distance = loc.distanceTo(other.loc);
      if (distance > 0 && distance < 30) {

        Vec3D diff = loc.sub(other.loc);
        diff.normalizeTo(1.0/distance);

        steer.addSelf(diff);
        count++;
      }
    }

    if (count > 0) {
      steer.scaleSelf(1.0/count);
    }   

    steer.scaleSelf(maganitude);
    acc.addSelf(steer);
  }


  void lineBetween() {

    //ballCollection
    for (int i = 0; i < fishCollection.size(); i++) {
      Fish other = (Fish) fishCollection.get(i);

      float distance = loc.distanceTo(other.loc);

      if (distance > 0 && distance < 80) {

        stroke(255, 0, 0);
        strokeWeight(0.4);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
      }
      //print(fishCollection.get(i));
    }
  }
  
}


