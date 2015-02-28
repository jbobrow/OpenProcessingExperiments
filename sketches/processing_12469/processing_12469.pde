
class Dot{ // define a new class
  
  //state defines the part of the bluebottle
  int state;

  float diameter;
  color c;    //sets the colour
  int age;   //set the age
  int lifespan; //sets the lifespan of the dot
 
  PVector pos; // position
  PVector vel; // velocity
  PVector acc; // acceleration
 
  float mouseFactor; // strength of mouse attraction
 
  // cohesion variables
  float cohesionFactor; //how close before they repel each other
  float cohesionRadius;
 
  // alignment variables
  float alignFactor; // how much they move in the same direction (proabably still to high in this drawing)
  float alignRadius;
 
  // separation variables
  float separationFactor; //how much can they fly apart from on another before returing back towards the center of the flock 
  float separationRadius;
 
  // speed limit
  float maxVel = 5;
  
  float thickness; // width of the dots colour being drawn
  float curlFactor; // curl amount or strength
  // friction
  float frictionFactor;
  PVector gravity; // gravity 
  
  //Array list for the position of each agent
  //three arrays need to create the vector object
  ArrayList history = new ArrayList();         //array to hold the midline
  ArrayList historyShape1 = new ArrayList();   //array to hold one side
  ArrayList historyShape2 = new ArrayList();   //array to hold one side
 
//Constructor
 
 Dot(PVector _pos, PVector _vel, int _state){ // constructor function has same name as class
// constructor gets called when we make a new Dot
    pos = _pos;
    vel = _vel;
    
// FYI
//   vel = new PVector(random(-5,5),random(-5,5),0);// for long stingers random initial velocity
//   vel = new PVector(random(0,3),random(-1,0),0); //for bubbles
//   vel = new PVector(random(0,2),random(-2,0),0); //for clumping shorties
//   c = color(random(100,255),0,random(100,255),50); // random initial colour

    acc = new PVector(0,0,0); // set acceleration to 0
    state = _state;
  }
 
//   Run function
  void run(){ // the main function - calls all the other behaviours and updates position and acceleration
 
  if (state == 0){  //long stingers behind so draw them first, below are the unique properties which alter the flocking behavious of the dots which are moving to draw them 
    mouseFactor = 0.5;
    thickness = 0.07;
    lifespan = 100;
    
    cohesionFactor = 0.2;
    cohesionRadius =  40;
    
    alignFactor = 0.01;
    alignRadius =  40;
    
    separationFactor = 1.5;
    separationRadius =  25;
    
    frictionFactor = 0.95;
//    c = color(random(100,255),0,random(100,255),50);
    
    curlFactor = 0.05;
  } // end of state 0's funtions to call on
 
  if (state == 1){  //short stingers; below are the unique properties which alter the flocking behavious of the short digestive stingers
    mouseFactor = 0.05;
    thickness = 0.05;
    lifespan = 100;
    cohesionFactor = 0.1;
    cohesionRadius =  40;
//  alignFactor = 0.01; //play around with this one 20/9
//  alignRadius =  40;
    separationFactor = 0.05;
    separationRadius =  25;
    frictionFactor = 0.97;
//    c = color(random(100,255),0,random(100,255),50); // random initial colour
    curlFactor = 0.01;
  }

if (state == 2){  //bubbles; below are the unique properties which alter the flocking behavious of the bubble bladder or crest of the bluebottle
    mouseFactor = 0.05;
    thickness = 0.1;
    lifespan = 100;
//  gravity = new PVector(0,0.3);  //try this longer short digestive stingers
    cohesionFactor = 0.3;
    cohesionRadius =  40;
    
    alignFactor = 0.1;
    alignRadius =  40;
    
    separationFactor = 0.02;
    separationRadius =  25;
    
    frictionFactor = 0.97;
//    c = color(random(100,255),0,random(100,255),50);// random initial colour
    curlFactor = 0.15;
    float maxVel = 5; // speed limit
   } 

if (age < lifespan){ // make these factors true for all if age is less than lifespan,if not then stop
    steerMouse();    // steer to mouse factor
//  bounce(); // keeps bluebottle in captivity, (in which they do not last very long)
    cohesion(); // cohesion factor, radius
    separation(); // separation factor, radius
    alignment();  
    friction();
    speedLimit();
    curl();
    
    vel.add(acc); // update the velocity vector - add the current acceleration vector
    pos.add(vel); // update the position - add the current velocity vector
    acc.mult(0); // reset acceleration to 0 after every recall
    
    PVector posCopy = new PVector(pos.x, pos.y, 0); //position of midline
    //create points for one side of midline
    PVector posCopyShape1 = vel.cross(new PVector(0,0,1));   //position at right angles to midline
    posCopyShape1.normalize();   //reduce right angles vector to have direction but not length
    posCopyShape1.mult((lifespan - age) * thickness);   //reduce thickness as it reaches the end of its lifespan
    posCopyShape1.add(posCopy);
    //create points for opposite side
    PVector posCopyShape2 = vel.cross(new PVector(0,0,-1));  
    posCopyShape2.normalize();
    posCopyShape2.mult((lifespan - age) * thickness);
    posCopyShape2.add(posCopy);

    history.add(posCopy); //add start point to history arrayList
    historyShape1.add(posCopyShape1); //add points to 
    historyShape2.add(posCopyShape2); 
    age++;
 }
 render(); 
  //if (age > 500) Dots.remove(this); // remove me from the list ( = kill me)
 }
 
  void render(){ // draw the midline
    
    beginShape();
    //draw one side of the stinger
    for (int i=historyShape1.size()-1; i>0; i--){
    PVector currentShape1 = (PVector) historyShape1.get(i);
    vertex(currentShape1.x,currentShape1.y);
 }
    //draw other side of the stinger    
    for (int i=0; i<historyShape2.size(); i++){
    PVector currentShape2 = (PVector) historyShape2.get(i);
    vertex(currentShape2.x,currentShape2.y);
 }
    endShape();
    
  }
 

/*  void bounce(){  
    if (pos.x > width || pos.x < 0){ // if x pos is greater than right hand edge OR less than left hand edge
      vel.set(vel.x*-1,vel.y,0); // bounce off the edge
    }
    if (pos.y > height || pos.y < 0) { // if y pos is greater than bottom edge OR less than top edge
      vel.set(vel.x,vel.y*-1,0);
    }
 
  }*/

   void curl(){ // curl function that sets curl factoe on dots behaviour
    
    PVector curveVel = vel.cross(new PVector(0,0,1));
    curveVel.normalize();
    curveVel.mult(curlFactor); //for long and bubbles
//  curveVel.mult(0.01); //for clumping shorties
    vel.add(curveVel);
  
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
 
 
  void alignment(){  //keep dots moving in the same direction
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

