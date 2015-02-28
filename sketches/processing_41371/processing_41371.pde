
class Chime {
  PVector location;
  int chimeBY; 
  int chimeBX;
  PVector velocity;
  PVector acceleration;
  float mass;
  float linesDistance;
  float Gravity;
  float yPosEnd = random(150, height - 100);
  float maxVelocity = 5;
  float xEndT;
  


  //Constructor
  Chime(PVector tlocation, int tchimeBY, int tchimeBX, float tGravity, float tMass) {
    location = tlocation.get();
    velocity = new PVector (0, 0);
    acceleration = new PVector (0, 0);
    chimeBY = tchimeBY;
    chimeBX = tchimeBX;
    Gravity = tGravity;
    mass = tMass;
  }

  void display() {
//    line(chimeBX, chimeBY, location.x, location.y );
line(chimeBX, chimeBY, location.x, location.y);
  }

  void forces(float tempX, float tempY) {
    PVector targetLocation = new PVector(tempX, tempY);
        
    PVector direction = PVector.sub(location, targetLocation);

    linesDistance = direction.mag();

    direction.normalize();
 
    float forceStrength = (Gravity * mass) / (linesDistance * linesDistance);
   
   if(mousePressed){
     direction.mult(-1);
   }
           
        direction.mult(forceStrength);
       addForces(direction);
  }

  void addForces(PVector theForce) {
       
    theForce.div(mass);
    
    acceleration.add(theForce);


  }

  void updateForces() {

    velocity.add(acceleration);
      
    velocity.limit(maxVelocity);
           
    location.add(velocity);

    acceleration.mult(1);
    
  }
  
  void restrictChimeSize(){
 xEndT = location.x;
    if(xEndT > location.x){
  location.y = location.y - 10;
 } 
  }
      
  

  void runMovement(float tempX, float tempY) {
    forces(tempX, tempY);
    updateForces();    
    display();
    restrictChimeSize();
    
  }


  //  void detectTouch() {
  //    if (mouseX <= chimeBX && mouseX >= chimeEX) {
  //      if (mouseY >= chimeBY && mouseY < chimeEY) {
  //
  //        println("touch!");
  //      }
  //    }
  //  }
}


