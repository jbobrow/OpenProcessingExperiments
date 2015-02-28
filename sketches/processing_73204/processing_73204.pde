
class Agent extends VerletParticle {
  
  Vec3D loc = new Vec3D(0,0,0);
  Vec3D speed;

  Vec3D acc = new Vec3D();
  
  float separate = 0.0001;
  float cohesion = 0.0001;
  float align =0.0001;
  
// initial speed
  int ispeed = 1;

  
  //inherit verlet particle constructor
  Agent(Vec3D _v){
    super(_v);
    speed = new Vec3D(random(-ispeed,ispeed),random(-ispeed,ispeed),random(-ispeed,ispeed));
    
  }
  
//run function
  void updateAgent(){
    agentMove();
  }

// locate  
  void updateLoc(){
    loc = new Vec3D(super.x,super.y,super.z);
  }
// make move  
  void agentMove(){
    addForce(acc);
    addVelocity(speed);
    flock();
    bounce();
    updateLoc();
  }

// limit movements of elements  
  void bounce(){

   if (super.x > boxSize){
     super.x = boxSize;
     speed.x = speed.x * -1;
//     acc.x = acc.x * -1;
   }
   if (super.x < -boxSize){
     super.x = -boxSize;
     speed.x = speed.x * -1;
//     acc.x = acc.x * -1;
   }

   if (super.y > boxSize){
     super.y = boxSize;
     speed.y = speed.y * -1;
//     acc.y = acc.y * -1;
   }
   if (super.y < -boxSize){
     super.y = -boxSize;
     speed.y = speed.y * -1;
//     acc.y = acc.y * -1;
   }

   if (super.z > boxSize){
     super.z = boxSize;
     speed.z = speed.z * -1;
//     acc.z = acc.z * -1;
   }
   if (super.z < -boxSize){
     super.z = -boxSize;
     speed.z = speed.z * -1;
//     acc.z = acc.z * -1;
   }
   
  }
    


// 
  void flock(){
   
   separate(separate);
   cohesion(cohesion);
   align(align);
    
  }

// Steer in the same direction  
  void align(float magnitude){
    
    Vec3D steer = new Vec3D();
    int count = 0;

    
    for(int i = 0; i< geoCollection.size();i++){
      Constructor other = (Constructor) geoCollection.get(i);
      float distance = super.distanceTo(other.location);
      
      if (distance >0 && distance < 30){
 
 // give property only to boxes and toruses
        if(other.geoType == 1 || other.geoType == 2){
          steer.addSelf(speed);
        }
        count++;
      }
    }

    steer.scaleSelf(1.0/geoCollection.size());
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);   
    
  }

 
// steer towards the center of elements 
  void cohesion(float magnitude){
    
    Vec3D sum = new Vec3D();
    int count = 0;
    
    for(int i = 0; i< geoCollection.size();i++){
      Constructor other = (Constructor) geoCollection.get(i);
      float distance = super.distanceTo(other.location);
      
  // give cohesion property only to boxes and toruses      
      if (distance >0 && distance < 50){
        if (other.geoType == 1 || other.geoType == 2){
          sum.addSelf(other.location);
        }
        count++;
               
      }
    }    
    
// make average vector by division
    sum.scaleSelf(1.0/geoCollection.size());
    Vec3D steer = sum.sub(loc);
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);
  
  }
  

// steer to avoid colliding
  void separate(float magnitude){
    
    Vec3D steer = new Vec3D();
    int count = 0;
    
    for(int i = 0; i< geoCollection.size();i++){
      Constructor other = (Constructor) geoCollection.get(i);
      float distance = loc.distanceTo(other.location);
      
      if (distance >0 && distance < 30){
        
        Vec3D diff = loc.sub(other.location);
        diff.normalizeTo(1.0/distance);
        
        steer.addSelf(diff);
        count++;

      }
    }

    steer.scaleSelf(1.0/geoCollection.size());  
    steer.scaleSelf(magnitude);
    acc.addSelf(steer);  
    
  }  
}

