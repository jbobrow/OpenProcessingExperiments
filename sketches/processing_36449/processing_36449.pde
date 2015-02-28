
//Methods	
//set()	          Sets the x, y, z component of the vector
//get()	          Gets the x, y, z component of the vector
//mag()	          Calculate the magnitude (length) of the vector
//add()	          Adds one vector to another
//sub()	          Subtracts one vector from another
//mult()	  Multiplies the vector by a scalar
//div()	          Divides the vector by a scalar
//dist()	  Calculate the Euclidean distance between two points
//dot()	          Calculates the dot product
//cross()	  Calculates the cross product
//normalize()	  Normalizes the vector
//limit()	  Limits the magnitude of the vector
//angleBetween()  Calculates the angle between two vectors
//array()	  Return a representation of the vector as an array

//-------------------------------------

class Circle {

  //location vector
  PVector location; 

  //velocity vector (v = d/t (?))
  PVector velocity;

  //acceleration vector - (a = v/t (?))
  PVector acceleration;

  //gravity variable
  float gravity; 

  //circles variables
  int $ize;
  float circlesDistance;
  float mass;
  int maxVelocity = 10;
  int resetNumber1 = 1;



  //-------------------------------------

  //Constructor
  Circle(PVector cLocation, int cSize, float cGravity, float cMass) {
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

  //-------------------------------------

  //displays the circles on screen
  void show() {
    fill(0, 0, 255, 100);
    ellipse(location.x, location.y, $ize, $ize);
  }

  //-------------------------------------

  void forces (float tempX, float tempY) {
    //Creates new vector for the x and y co-ordinates for gravity/attraction
    PVector targetLocation = new PVector(tempX, tempY);
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



  //-------------------------------------

  //determines the 'game over' situation, when the mouse touches an object
  void gameOver(float tempX, float tempY) {
    if (keyPressed) {
      if (key == 'q' || key == 'Q') {
        resetNumber1 = 0;
      }
    }

    //if  any circle objects touch the mouse the game over parameters are met
    if (location.y - 5 <= tempY && location.y + 5 >= tempY) {
      if (location.x - 5 <= tempX && location.x + 5 >= tempX) {
        reset = resetNumber1;
        if (resetMaxVel == 1) {
          maxVelocity = 5;
        }
      }
    }
  }

  //-------------------------------------

  //increases and decreases difficulty
  void difficulty() {
    if (keyPressed && maxVelocity <= 15) {
      if (key == '+') {
        maxVelocity = maxVelocity + 1;
      }
    }
    else if (keyPressed && maxVelocity >= 5) {
      if (key == '-') {
        maxVelocity = maxVelocity - 1;
      }
    }
  }

  //-------------------------------------

  //freezes items when game over
  void freezeItems() {
    if (freeze == 1) {
      maxVelocity = 0;
    }
  }

  //-------------------------------------

  //Apply a force-vector on the circles, f/m
  void addForces(PVector useTheForce) {
    useTheForce.div(mass);
    acceleration.add(useTheForce);
  }

  //-------------------------------------

  //updates the values calculating the strength and direction of the force
  void updateForces() {
    velocity.add(acceleration);
    // set the maximum velocity possible
    velocity.limit(maxVelocity);
    location.add(velocity);
    acceleration.mult(0);
  }

  //-------------------------------------

  //combines all the class' to make everything work!
  void runSwarm(float tempX, float tempY) {
    gameOver(tempX, tempY);
    difficulty();
    forces(tempX, tempY);
    show();
    updateForces();
  }
}


