
// Class File 'Dots'

// Variables (on The Wall)

float initial_velocity = 2; // variable to set initial velocity
float initial_acceleration = 0; // variable to set initial acceleration
float friction = 1; // variable to set friction (multiplier 1 is no friction)

float separation_strength = 0.01; // variable to set seperation strength

float cohesion_range = 100; // variable to set range that cohesion applies to
float cohesion_strength = 0.02; // variable to set cohesion strength

float alignment_range = 20; // variable to set range that alignment applies to
float alignment_strength = 0.1; // variable to set alignment strength

float centre_strength = 0.005; // variable to set centre strength (gravity)


// Dot Class

class Dot{

  float dot_diameter; // declare variable for diameter
    
  PVector position; // create vector for position
  PVector velocity; // create vector for velocity
  PVector acceleration; // create vector variable 

  color col; // create variable for colour

  Dot(PVector _position, float _dot_diameter){ // the constructor' (same name as class), with parameters for 'position and diameter

    position = _position; // convention to name new variable the same as the one it references
    dot_diameter = _dot_diameter; // convention to name new variable the same as the one it references
    col = color(random(255),random(255),random(255)); // set colour as random
    
    velocity = new PVector(random(-initial_velocity,initial_velocity),random(-initial_velocity,initial_velocity)); // create initial velocity
    acceleration = new PVector(initial_acceleration,initial_acceleration); // create initial acceleration
    
  }

// Run - Master Function

  void run(){ // controls all methods - placed here to keep setup clean 

    steerToCentre(); // turns on steer to centre method
    separation(); // turns on separation method
    cohesion(); // turns on cohesion method
    alignment(); // turns on alignment method
    move(); // turn on move method
    render(); // turn on render method

  }

// Render Method

  void render(){ 
    stroke(255); // set stroke colour to white
    strokeWeight(2); // set stoke thickness to 2 pixels
    fill(col); // set fill to variable col
    ellipse(position.x,position.y,dot_diameter,dot_diameter); // draw circle 

  }

// Move Method

  void move(){ 
    velocity.mult(friction); // create friction
    velocity.add(acceleration); // add acceleration to velocity 
    position.add(velocity); // update the position
    acceleration.mult(0); // multiply acceleration by 0 to reset to 0 so that it does not accumulate over time
  }

// Steer to Centre Method

  void steerToCentre(){ 
    PVector centreVector = new PVector(300,300); // create new vector at centre
    PVector toCentre = PVector.sub(centreVector,position); // subtract vectors to determine acceleration direction to centre
    toCentre.normalize(); // scale acceleration to centre to 1 - ie the same acceleration applies no matter distance to centre 
    toCentre.mult(centre_strength); // scale the acceleration to centre based on variable above
    acceleration.add(toCentre); // add acceleration to centre to the existing acceleration
  }

// Separation Method

  void separation(){ 

    PVector separationForce = new PVector(); // create vector for a force of separation

    for (int i=0; i<Dots.size(); i++){ // create a for loop that loops as many times as there are items in the arraylist
      Dot otherDot = (Dot) Dots.get(i); // get a dot 
      float distance = PVector.dist(position,otherDot.position); // determine distance from dot
      float goal_distance = (dot_diameter/2 + otherDot.dot_diameter/2); // create a variable to set range of separation - ie only if dot boundaries overlap
      if (distance < goal_distance){ // if dot is in range of separation
        separationForce = PVector.sub(position,otherDot.position); // make a repelling force
        separationForce.normalize(); // scale the force to 1
        separationForce.mult((goal_distance - distance)); // scale the force based on how much dot boundaries overlap
        separationForce.mult(separation_strength); // scale the force based on variable above
       velocity.mult(0); // sets existing velocity to 0
      }
      acceleration.add(separationForce); // add separation force to acceleration
    }
  }

// Cohesion Method

  void cohesion(){ 

    PVector cohesionForce = new PVector(); // create a vector for a force of cohesion
    PVector averagePos = new PVector(); // create a vector for the average position of neighbouring dots

    int averageCount = 0; // create a counter to count neighbouring dots

    for (int i=0; i<Dots.size(); i++){ // create a for loop that loops as many times as there are items in the arraylist
      Dot otherDot = (Dot) Dots.get(i); // get a dot
      float distance = PVector.dist(position,otherDot.position); // determine distance from dot
      if (distance < cohesion_range){ // if dot is in range of cohesion, set by variable above
        averagePos.add(otherDot.position); // add dot position to the average position
        averageCount++; // update counter
      }
    }
    averagePos.div(averageCount); // divide total of neighbours positions by number of neighbours to get average position
    cohesionForce = PVector.sub(averagePos,position); // create a force of cohesion pulling toward average position
    cohesionForce.normalize(); // scale down to 1
    cohesionForce.mult(cohesion_strength); // scale the force based on the variable above
    acceleration.add(cohesionForce); // add the force to the acceleration
  }

// Alignment Method

  void alignment(){  

    PVector alignmentForce = new PVector(); // create a vector for a force of alignment
    PVector averageVel = new PVector(); // create a vector for the average velocity of neighbouring dots

    int averageCount = 0; // create a counter to count neighbouring dots

    for (int i=0; i<Dots.size(); i++){ // create a for loop that loops as many times as there are items in the arraylist
      Dot otherDot = (Dot) Dots.get(i); // get a dot
      float distance = PVector.dist(position,otherDot.position); // determine distance from dot
      if (distance < alignment_range){ // if dot is in range of alignment, set by variable above
        averageVel.add(otherDot.velocity); // add dot velocity to the average velocity
        averageCount++; // update counter
      }
    }
    averageVel.div(averageCount); // divide total of neighbours velocities by number of neighbours to get average velocity
    averageVel.normalize(); // scale down to 1
    averageVel.mult(alignment_strength); // scale the force based on the variable above
    acceleration.add(averageVel); // add the force to the acceleration
  }




}









