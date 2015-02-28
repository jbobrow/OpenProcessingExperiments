
//butterflies flocking by Lishan Ng
//modified from lock_demo by mitchell whitelaw, licensed under Creative Commons Attribution-Share Alike 3.0 license.

class Dot{ // define a new class

  float diameter;
  color c;
  int randomNumberButterfly;

  PVector pos; // position
  PVector vel; // velocity
  PVector acc; // acceleration

  float mouseFactor = 0.1; // strength of mouse attraction

  // cohesion variables
  float cohesionFactor = 0.2;
  float cohesionRadius =  40;

  // alignment variables
  float alignFactor = 0.1;
  float alignRadius =  40;

  // separation variables
  float separationFactor = 1.5;
  float separationRadius =  25;

  // speed limit
  float maxVel = 5;

  // friction
  float frictionFactor = 0.95;


  Dot(PVector _pos, float _diameter){ // constructor function has same name as class
    // constructor gets called when we make a new Dot
    pos = _pos;
    diameter = random(20,60);
    vel = new PVector(random(-5,5),random(-5,5),0); // random initial velocity
    c = color(random (255),random(85),0); // random initial colour
    acc = new PVector(0,0,0); // set acceleration to 0

      randomNumberButterfly = int(random(5));
  }

  void run(){ // the main function - calls all the other behaviours and updates position and acceleration

      steerMouse(); // steer to mouse factor
    bounce(); 
    cohesion(); // cohesion factor, radius
    separation(); // separation factor, radius
    alignment();
    friction();
    speedLimit();

    render();

    vel.add(acc); // update the velocity vector - add the current acceleration vector 
    pos.add(vel); // update the position - add the current velocity vector
    acc.mult(0); // reset acceleration to 0

  }

  void render(){ // draw the dot
    fill(c);
    tint(c);
   
    // ellipse(pos.x,pos.y,diameter,diameter);
    if (randomNumberButterfly == 0){
      image(loopingGif, pos.x,pos.y, diameter,diameter);
    } 
    else if (randomNumberButterfly == 1){
      image(loopingGif1, pos.x,pos.y, diameter,diameter);
    }
    else if (randomNumberButterfly == 2){
      image(loopingGif2, pos.x,pos.y, diameter,diameter);
    }
    else if (randomNumberButterfly == 3){
      image(loopingGif3, pos.x,pos.y, diameter,diameter);
    }else if (randomNumberButterfly == 4){
      image(loopingGif4, pos.x,pos.y, diameter,diameter);
  }
  }

  void bounce(){
    if (pos.x > width || pos.x < 0){ // if x pos is greater than right hand edge OR less than left hand edge
      vel.set(vel.x*-1,vel.y,0); // bounce off the edge
    }
    if (pos.y > height || pos.y < 0) { // if y pos is greater than bottom edge OR less than top edge
      vel.set(vel.x,vel.y*-1,0);
    }

  }

  void steerMouse(){
    PVector mousePos = new PVector (mouseX,mouseY,0); // make a new vector based on the mouse position
    PVector toMouse = PVector.sub(mousePos,pos); // make a vector that point towards the mouse by subtracting vectors
    toMouse.normalize(); // scales the magnitude of the vector to 1
    toMouse.mult(mouseFactor); // multiplies the vector by the mouseFactor argument - which defines the strength of the mouse influence
    acc.add(toMouse); // add the toMouse force to our current acceleration
  }

  void separation(){
    for (int i=0; i<Dots.size(); i++){ // run through the arraylist
      Dot Neighbour = (Dot) Dots.get(i); // get each Dot
      float distance = PVector.dist(pos,Neighbour.pos); 
      if (distance < separationRadius){ // if this Dot is within our separation range then
        PVector toNeighbour = PVector.sub(pos,Neighbour.pos); // make a vector from the neighbour
        toNeighbour.normalize(); // scale it to 1
        // now scale it according to distance, so that it's strong at close range, and reduces to 0 at the separation radius
        // then multiply it by the separationFactor, which allows us to control the overal strength of the separation force
        toNeighbour.mult(((separationRadius-distance)/separationRadius)*separationFactor); 
        acc.add(toNeighbour); // add the separation force to the acceleration
      }
    }
  }

  void cohesion(){ // each agent steers towards the average position of its neighbours
    PVector avePos = new PVector(); // PVector to store average position
    int neighbourcount = 0; // int to count the number of neighbours
    for (int i=0; i<Dots.size(); i++){
      Dot Neighbour = (Dot) Dots.get(i);
      float distance = PVector.dist(pos,Neighbour.pos);
      if (distance < cohesionRadius){
        avePos.add(Neighbour.pos);
        neighbourcount++;
      }
    }
    avePos.div(neighbourcount); // divide by num neighbours to get the average - the center position of our near neighbours
    PVector toCenter = PVector.sub(avePos,pos); // make a vector to that point
    toCenter.normalize(); // scale it to 1
    toCenter.mult(cohesionFactor); // multiply by cohesion factor
    acc.add(toCenter);    // add the cohesion force to the acceleration
  }


  void alignment(){
    PVector aveVel = new PVector(); // PVector to store average velocity of our neighbours
    for (int i=0; i<Dots.size(); i++){
      Dot Neighbour = (Dot) Dots.get(i);
      float distance = PVector.dist(pos,Neighbour.pos);
      if (distance < alignRadius){ // if the dot is within our alignment range
        aveVel.add(Neighbour.vel); // add its velocity to the average
      }
    }
    aveVel.normalize(); 
    aveVel.mult(alignFactor);
    acc.add(aveVel);   
  }


  void speedLimit(){
    if (vel.mag() > maxVel){ // if you're going faster than the speed limit
      vel.normalize(vel).mult(maxVel); // scale your velocity back to the limit
    }
  }

  void friction(){
    vel.mult(frictionFactor); // multiply velocity by the friction factor
  }

}








