
class AcceptDot{ // define a new class
 
  float diameter=19;
  color c;
 
  PVector pos; // position
  PVector vel; // velocity
  PVector acc; // acceleration
 
  // cohesion variables
  float cohesionFactor = 0.2;
  float cohesionRadius =  40;
 
  // alignment variables
  float alignFactor = 0.1;
  float alignRadius =  50;
 
  // separation variables
  float separationFactor = 1.5;
  float separationRadius =  35;
 
  // speed limit
  float maxVel = 0.4;
 
  AcceptDot(PVector _pos){ // constructor function has same name as class
    // constructor gets called when we make a new AcceptDot
    pos = _pos;
    vel = new PVector(random(-5,5),random(-5,5),0); // random initial velocity
    c = color(50,200,50); 
    acc = new PVector(0,0,0); // set acceleration to 0
  }
 
  void run(){ // the main function - calls all the other behaviours and updates position and acceleration
 
    bounce();
    cohesion(); // cohesion factor, radius
    separation(); // separation factor, radius
    alignment();
    speedLimit();
 
    render();
 
    vel.add(acc); // update the velocity vector - add the current acceleration vector
    pos.add(vel); // update the position - add the current velocity vector
    acc.mult(0); // reset acceleration to 0
 
  }
 
  void render(){ // draw the AcceptDot
  noStroke();
    fill(c);
    ellipse(pos.x,pos.y,diameter,diameter);

  }
 
 
 
  void bounce(){
    if (pos.x > width || pos.x < 0){ // if x pos is greater than right hand edge OR less than left hand edge
      vel.set(vel.x*-1,vel.y,0); // bounce off the edge
    }
    if (pos.y > height || pos.y < 0) { // if y pos is greater than bottom edge OR less than top edge
      vel.set(vel.x,vel.y*-1,0);
    }
 
  }
 
  void separation(){
    for (int i=0; i<AcceptDots.size(); i++){ // run through the arraylist
      AcceptDot Neighbour = (AcceptDot) AcceptDots.get(i); // get each AcceptDot
      float distance = PVector.dist(pos,Neighbour.pos);
      if (distance < separationRadius+10){ // if this AcceptDot is within our separation range then
        PVector toNeighbour = PVector.sub(pos,Neighbour.pos); // make a vector from the neighbour
        toNeighbour.normalize(); // scale it to 1
        strokeWeight(1.5);
        stroke(255);
        line(pos.x,pos.y,Neighbour.pos.x,Neighbour.pos.y);
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
    for (int i=0; i<AcceptDots.size(); i++){
      AcceptDot Neighbour = (AcceptDot) AcceptDots.get(i);
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
    for (int i=0; i<AcceptDots.size(); i++){
      AcceptDot Neighbour = (AcceptDot) AcceptDots.get(i);
      float distance = PVector.dist(pos,Neighbour.pos);
      if (distance < alignRadius){ // if the AcceptDot is within our alignment range
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
 


}


