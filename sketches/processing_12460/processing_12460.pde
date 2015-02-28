
class Stinger{ // define a new class

 
  PVector pos; // position
  PVector vel; // velocity
  PVector acc; // acceleration
 
  // cohesion variables
  float cohesionFactor;
  float cohesionRadius;
 
  // alignment variables
  float alignFactor;
  float alignRadius;
 
  // separation variables
  float separationFactor;
  float separationRadius;
 
  // speed limit
  float maxVel;
  
  //set the age & lifespan
  int age;
  int lifespan;
  
  //set the stinger thickness
  float thickness;
  
  //to curl the ends
  float curlFactor;
  
  // jitter to make kinky stingers
  float jitx;
  float jity; 
   
  // friction
  float frictionFactor;
  PVector gravity;  
  
  //Array list for the position of each agent
  //three arrays need to create the vector object
  ArrayList history = new ArrayList();         //array to hold the midline
  ArrayList historyShape1 = new ArrayList();   //array to hold one side
  ArrayList historyShape2 = new ArrayList();   //array to hold the other side
 
//Constructor

  Stinger(PVector _pos, int _lifespan){ // constructor function has same name as class
    // constructor gets called when we make a new Stinger
    //Stinger requires a start position and lifespan
    pos = _pos;
    lifespan = _lifespan;               //random position;
    
    vel = new PVector(random(-2,2),random(0,2),0); // random initial velocity
    acc = new PVector(0,0,0); // set acceleration to 0
       
    maxVel = 5;
    
    thickness = 0.12;   
    gravity = new PVector(0,0.3);
    
    jitx = random(0,5);
    jity = random(0,2);
    
    cohesionFactor = 0.4;
    cohesionRadius =  40;
    
    alignFactor = 0.1;
    alignRadius =  40;
    
    separationFactor = 0.9;
    separationRadius =  25;
    
    frictionFactor = 0.95;
    
    curlFactor = 0.01;

  }  //End of the constructor
  

// Run
 
  void run(){ // the main function - calls all the other behaviours and updates position and acceleration

     if (age < lifespan){
          cohesion();   // cohesion factor, radius
          separation(); // separation factor, radius
          alignment();  //
          friction();  //slows them down
          jitter();
          if (age >lifespan/1.8) curl();  //only curl when a certain proportion of the lifespan is reached 
          speedLimit();
             
          vel.add(gravity);
          vel.add(acc); // update the velocity vector - add the current acceleration vector
          pos.add(vel); // update the position - add the current velocity vector
          acc.mult(0);  // reset acceleration to 0 
          
          //create the vector objects suitable for laser cutting          
          PVector posCopy = new PVector(pos.x, pos.y, 0);          
          PVector posCopyShape1 = vel.cross(new PVector(0,0,1));
          posCopyShape1.normalize();
          posCopyShape1.mult((lifespan - age) * thickness);
          posCopyShape1.add(posCopy);
          PVector posCopyShape2 = vel.cross(new PVector(0,0,-1));
          posCopyShape2.normalize();
          posCopyShape2.mult((lifespan - age) * thickness);
          posCopyShape2.add(posCopy);
      
          history.add(posCopy); 
          historyShape1.add(posCopyShape1); 
          historyShape2.add(posCopyShape2);    

          age++;
     }     
    render();
  }
 
  void render(){ // draw the midline
  fill(50,68,155);
    beginShape();
      //draw one side of the stinger
      for (int i=historyShape1.size()-1; i>0; i--){
        PVector currentShape1 = (PVector) historyShape1.get(i);
        vertex(currentShape1.x,currentShape1.y);
      }  
      // draw the other side of the stinger    
      for (int i=0; i<historyShape2.size(); i++){
        PVector currentShape2 = (PVector) historyShape2.get(i);
        vertex(currentShape2.x,currentShape2.y);
      }
    endShape();
  }

  //create curls dependent on age
  void curl(){    
    PVector curveVel = vel.cross(new PVector(0,0,1));  //create a cross product to change directions 90 deg
    curveVel.normalize();
    curveVel.mult(curlFactor*age);  //change in direction is moderated by the curlFactor and age
    vel.add(curveVel); 
  }
  
  // create the kinky effect
  void jitter(){
     pos.add(random(-jitx, jitx)*(lifespan-age)/lifespan, random(-jity, jity), 0); 
  }
 
  void separation(){
    for (int i=0; i<StingerPts.size(); i++){ // run through the arraylist
      Stinger Neighbour = (Stinger) StingerPts.get(i); // get each Stinger
      float distance = PVector.dist(pos,Neighbour.pos);
      if (distance < separationRadius){ // if this Stinger is within our separation range then
        PVector toNeighbour = PVector.sub(pos,Neighbour.pos); // make a vector from the neighbour
        toNeighbour.normalize(); // scale it to 1
        // now scale it according to distance, so that it's strong at close range, and reduces to 0 at the separation radius
        // then multiply it by the separationFactor, which allows us to control the overal strength of the separation force
        toNeighbour.mult(((separationRadius-distance)/separationRadius)*separationFactor);
        acc.add(toNeighbour); // add the separation force to the acceleration
      }
    }
  }
// work out the average position of all pts within the cohesion radius
// add to the acceleration the product of the average and the cohesion factor
  void cohesion(){ // each agent steers towards the average position of its neighbours
    PVector avePos = new PVector(); // PVector to store average position
    int neighbourcount = 0;         // int to count the number of neighbours
    for (int i=0; i<StingerPts.size(); i++){
      Stinger Neighbour = (Stinger) StingerPts.get(i);
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
 
// work out the average velocity of all pts within the alignment radius
// add to the acceleration the product of the average and the alignment factor
  void alignment(){
    PVector aveVel = new PVector(); // PVector to store average velocity of our neighbours
    for (int i=0; i<StingerPts.size(); i++){
      Stinger Neighbour = (Stinger) StingerPts.get(i);
      float distance = PVector.dist(pos,Neighbour.pos);
      if (distance < alignRadius){ // if the Stinger is within our alignment range
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
 

}   //Closes class definition

