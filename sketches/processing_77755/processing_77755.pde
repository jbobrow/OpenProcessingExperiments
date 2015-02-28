

class Node extends VerletParticle {
  Vec3D loc = new Vec3D();
  Vec3D speed;
  Vec3D acc = new Vec3D();
  


  // initial speed
  float ispeed =5;
  
  float maxAcc = 2;
  float maxVel = 2;
  

  Node(Vec3D _loc) {
    super(_loc);
    speed = new Vec3D(random(-ispeed, ispeed), random(-ispeed, ispeed), random(-ispeed, ispeed));
    
  
  }
  void run() {
    agentMove();
    display();
    searchAgents();
    bounce();
    //createSprings();
    //searchNetwork();
  }

  void agentMove() {
    addForce(acc);
    addVelocity(speed);
    updateLoc();
  }

 void display() {
    fill(255, 0, 90, 200);
    stroke(255, 0, 90, 95);
    strokeWeight(5);
    point(loc.x, loc.y, loc.z);
  }


  void searchAgents(){
     //reset accel
    for (Node a:Network){
      //get essential variables
      Vec3D diff = a.getPreviousPosition().sub(this);
      float d = diff.magnitude();
      
        if(d<200) {
          repel(diff.copy(),10); //avoid neighbour
         
        
      }
    }
  }
  
 
  


   void repel (Vec3D v, float d){
    v.invert();
    acc.interpolateToSelf(v,(aRepel/d)); 
   // println("repelled");
  }

  void attract (Vec3D v, float d){
    acc.interpolateToSelf(v,(aAttract/d)); 
  }
  
  void align(Vec3D v, float d){
    acc.interpolateToSelf(v,aAlign); 
  }

  // locate  
  void updateLoc() {
    loc = new Vec3D(super.x, super.y, super.z);
  }

  

  

  // limit movements of elements  
  void bounce() {
    Vec3D worldB = physics.getWorldBounds();
    if (super.x > worldB.x) {
      //super.x = worldB.x;
      speed.x = speed.x * -1;
      //     acc.x = acc.x * -1;
    }
    if (super.x < -worldB.x) {
      //super.x = -worldB.x;
      speed.x = speed.x * -1;
      //     acc.x = acc.x * -1;
    }

    if (super.y > worldB.y) {
      //super.y = worldB.y;
      speed.y = speed.y * -1;
      //     acc.y = acc.y * -1;
    }
    if (super.y < -worldB.y) {
      //super.y = -worldB.y;
      speed.y = speed.y * -1;
      //     acc.y = acc.y * -1;
    }

    if (super.z > worldB.z) {
      //super.z = worldB.z;
      speed.z = speed.z * -1;
      //     acc.z = acc.z * -1;
    }
    if (super.z < -worldB.z) {
      //super.z = -worldB.z;
      speed.z = speed.z * -1;
      //     acc.z = acc.z * -1;
    }
  }
}


