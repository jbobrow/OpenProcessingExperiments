
class Note {
  //location vector
  PVector location; 

  //velocity vector (v = d/t (?))
  PVector velocity;

  //acceleration vector - (a = v/t (?))
  PVector acceleration;

  PVector targetLocation;

  //gravity variable
  float gravity; 

  //circles variables
  int $ize;
  float circlesDistance;
  float mass;
  int maxVelocity = 6;
  
  // -------------------------------------------------------------------------

//Constructor
  Note(PVector cLocation, int cSize, float cGravity, float cMass) {
    //returns position of the circle
    location = cLocation.get();
    // --------
    //sets the default velocity and acceleration of circles as 0
    velocity = new PVector (0, 0);
    acceleration = new PVector (0, 0);
    // --------
    $ize = cSize;
    gravity = cGravity;
    mass = cMass;
  }
  
  // -------------------------------------------------------------------------

  //Displays shape on graphics pane
  void show() {
    
    
      fill(100, 100, 255);
   
      
   
    ellipse(location.x, location.y, $ize, $ize);
 
}
  
  // -------------------------------------------------------------------------
  
   void forces (float tempX, float tempY) {
    //Creates new vector for the x and y co-ordinates for gravity/attraction
    targetLocation = new PVector(tempX, tempY);
    //Holds the direction between the circles and their target location, location - targetLocation 
    PVector direction = PVector.sub(location, targetLocation);
    //Calculates the magnitude of the direction vector, the length between location and targetLocation
    circlesDistance = direction.mag();
    direction.normalize();

    //Calculates the strength of the forces "acting" on the circles. f = gm/d^2
    float mouseForce = (gravity * mass) / (circlesDistance * circlesDistance);

    direction.mult(-1);
    addForces(direction);
  }

// -------------------------------------------------------------------------

  //Apply a force-vector on the circles, f/m
  void addForces(PVector useTheForce) {
    useTheForce.div(mass);
    acceleration.add(useTheForce);
  }
  
  // -------------------------------------------------------------------------

  //Update forces
  void updateForces() {
    velocity.add(acceleration);
    // set the maximum velocity possible
    velocity.limit(maxVelocity);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  float returnLocationX(){
    return location.x;
    
  }
  
  float returnLocationY(){
    return location.y;
     
  }
  
  // -------------------------------------------------------------------------
  
  //Code to grab the large circle with the mouse
  void grabCircle() {
    if (held && dist(location.x, location.y, mouseX, mouseY) < $ize/2) {
      location.x = mouseX;
      location.y = mouseY;
      targetLocation = (location);
    }
  }
  
  

  //Ties all the code together!
  void combineNotes(float tempX, float tempY) {
    forces(tempX, tempY);
    grabCircle();
    show();
    updateForces();
  }
}

