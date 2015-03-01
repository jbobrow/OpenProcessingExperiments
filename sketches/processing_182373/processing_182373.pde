
// in this sketch we create a ball that is propelled around by forces represented by the line from the centre to the mouse

// This may differ slightly from the example given in the workshop

// Vectors to represent
// position of ball
// velocity of ball
// force applied to ball
// position of centre
PVector position, velocity, force, centre;


void setup(){
  size(600, 600); 
  // instance vectors for processing PVector class
  position = new PVector(100, 100); // starting position of ball
  velocity = new PVector();         // velocity of ball - by how much it moves each update
  centre = new PVector(0.5*width, 0.5*height); // notice we times the width by 0.5 to get the centre equivalent of dividing by two
}


void draw(){
  background(255);
  
  // draw a line from the centre to the mouse location
  strokeWeight(1);
  line(centre.x, centre.y, mouseX, mouseY); 

  // create new force to represent gravity
  // this rebuild a new vector each update so that forces only persist for a single update
  force = new PVector(0.0, 0.1, 0.0);
  
  // when the mouse is pressed we add a force to the ball
  if (mousePressed){
    // the forces is created and returned from the 'mouseForceTo' method below
    force.add(mouseForceTo(centre));
  }
  
  
  velocity.add(force); // add all forces - velocity is sum of all forces
  velocity.mult(0.98); // dampen velocity - air friction - multiply by a fraction to reduce velocity over time
  velocity.limit(10); // limit velocity - this will help protect a ball from forces that are two strong that could explode!
  position.add(velocity); // apply velocity to current position - new position equals old position plus velocity
  
  
  //Chose between ball that bounces off side or wraps around screen
  //wrapScreen(position);
  bounceOffSides(position, velocity);
  
  //finally draw the ball at its current location 
  strokeWeight(4);
  point(position.x, position.y);
}




// wrap the screen coordinates by adding or subtracting the width until the ball is on screen
void wrapScreen(PVector p){
  while(position.x > width)position.x -= width;
  while(position.x < 0)position.x += width;
  while(position.y > height)position.y -= height;
  while(position.y < 0)position.y += height;
}



void bounceOffSides(PVector position, PVector velocity){
  
  // the below argument will work in many cases but can break with high velocities
  //if(position.x > width ||  position.x < 0){
  //  velocity.x = -velocity.x;
  //}
  
  
  // this is a much stronger argument as ball is reposition at the edge of the screen if it overshoots
  if(position.x > width){
    position.x = width;
    velocity.x = -velocity.x;
  } else if ( position.x < 0){
    position.x = 0;
    velocity.x = -velocity.x;
  }


  // as above but notice how the velocity is reversed by multiplying by -1 less typing ;) 
  if(position.y > height){
    position.y = height;
    velocity.y *= -1;
  } else if ( position.y < 0){
    position.y = 0;
    velocity.y *= -1;
  }
   
}


// This method creates and returns a force from the mouse to the passed origin 
PVector mouseForceTo(PVector origin){
   // First we make a copy of the origin
   PVector tmp = origin.get();
   // Then subtract the mouse location from the origin to get a vector that represents the difference between the two
   tmp.sub(mouseX, mouseY, 0);
   // We can then scale this down
   tmp.mult(0.1);
   // And finally return it to the location where this method was called
   return tmp;
}





