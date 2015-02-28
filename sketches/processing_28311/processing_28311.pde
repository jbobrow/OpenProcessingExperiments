
/* Flocking Simulation v. 1.0
By Graham Strang
Based heavily on Daniel Shiffman's "The Nature of Code" flocking exercise.
Creates 500 balls which travel both independently and as a group, changing color with cursor movements and creating visual paths of their motion.
The base code is Daniel Shiffman's flocking code, with graphics elements created and integrated by me.
*/


float backBright, backSat;
float boidBright, boidSat;


Flock flock = new Flock();

void setup(){
  size(1200,600);
  colorMode(HSB);
  flock = new Flock();
  noCursor();
  for(int i = 0; i < 500; i++){  //makes 500 Boids. Original code at http://www.shiffman.net/itp/classes/nature/week06_s09/flocking/Flocking.pde
    flock.addBoid(new Boid(new PVector(width/2,height/2),3,.05));
  }
  smooth();
}

void draw(){
  backBright = map(mouseX,0,width, 200,0);
  backSat = map(mouseY,0,height, 200,0);
  fill(50,backBright, backSat, 5);
  rect(0,0,width, height);
  flock.run();  //executes run().Oiginal code at http://www.shiffman.net/itp/classes/nature/week06_s09/flocking/Flocking.pde

    
  }




class Boid{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float speedLimit;  //maximum speed
  float forceLimit;  // maximum steering force   original code at http://www.shiffman.net/itp/classes/nature/week06_s09/flocking/Boid.pde
  float r;
  
  Boid(PVector l, float sl, float fl){
   acceleration = new PVector(0,0);
   velocity = new PVector (random(-1,1), random(-1,1));
   location = l.get();
  
   speedLimit = sl;
   forceLimit = fl;  // Sets vector and limiting values. Original code at http://www.shiffman.net/itp/classes/nature/week06_s09/flocking/Boid.pde
  }
   void run(ArrayList boids){
     flocker(boids);
     update();
     borders();
     render();
   }
   
  void render(){
    
    noStroke();
    ellipse(location.x, location.y, 10,10);
    fill(235, 99, 99);
    if(mousePressed == true){    //Changes color to cyan upon mouse click
      fill(126, 99,99);
    }
    
  }
   void flocker(ArrayList boids){ //The three rules: Seperation, Alignment, Cohesion. Original Code at http://www.shiffman.net/itp/classes/nature/week06_s09/flocking/Boid.pde
    PVector sep = seperation(boids);
    PVector ali = align(boids);
    PVector coh = cohesion(boids);
    //Weighting the forces
    sep.mult(1.5);
    ali.mult(1);
    coh.mult(1);
    //Adding force to acceleration
    acceleration.add(sep);
    acceleration.add(ali);
    acceleration.add(coh);
    
  }
  
  void update(){  //updates location, velocity, max speed.
    velocity.add(acceleration);
    velocity.limit(speedLimit); //limiting speed
    location.add(velocity); 
    acceleration.mult(0); //resets acceleration
  }
  
  //These two set the Boids to seek each other out and slow when they arrive.
  //Original code at http://www.shiffman.net/itp/classes/nature/week06_s09/flocking/Boid.pde
  void seek(PVector target){
    acceleration.add(steering(target,false));
  }
  
  void arrive(PVector target){
    acceleration.add(steering(target, true));
  }
  
    
 
  //Method for making a steering vector towards a target.Original code at http://www.shiffman.net/itp/classes/nature/week06_s09/flocking/Boid.pde
  //Slows down object as it approaches the target.
  PVector steering(PVector target, boolean slow){
    PVector steering; 
    PVector desired = PVector.sub(target, location); //Points a vector from location to target.
    float d = desired.mag(); //Distance from target is the magnitude of the vector.
    if(d > 0){
      desired.normalize();
      if((slow)&&(d < 100)) desired.mult(speedLimit*(d/100));
      else desired.mult(speedLimit);
      steering = PVector.sub(desired, velocity);
      steering.limit(forceLimit);
    }
    else{
      steering = new PVector(0,0);
    }
    return steering;
  }
  
  //Wraps edges. Original code at http://www.shiffman.net/itp/classes/nature/week06_s09/flocking/Boid.pde
  void borders(){
    if (location.x < 0) location.x = width;
    if (location.y < 0) location.y = height;
    if (location.x > width) location.x = 0;
    if (location.y > height) location.y = 0;
  }
  //Seperation
  //Looks for objects nearby and avoids them.
  //Original code at http://www.shiffman.net/itp/classes/nature/week06_s09/flocking/Boid.pde  
  PVector seperation (ArrayList boids){
   float dSep = 25;
   if(mousePressed == true){ //When the mouse is pressed and held, the balls scatter. When released, they return to normal flocking.
     dSep = 100;
   }
   PVector steering = new PVector (0,0,0); 
   int count = 0;
   for (int i = 0; i < boids.size(); i++){
     Boid other = (Boid) boids.get(i);
     float d = PVector.dist(location, other.location);
     if((d>0) && (d < dSep)){
       PVector diff = PVector.sub(location, other.location);
       diff.normalize();
       diff.div(d);
       steering.add(diff);
       count++;
     }
   }
   if (count > 0){
     steering.div((float)count);
   }
   
   if(steering.mag() > 0){
     steering.normalize();
     steering.mult(speedLimit);
     steering.sub(velocity);
     steering.limit(forceLimit);
   }
   return steering;
  }
  //Alignment
  //Finds average velocity for nearby objects.
  //Original code at http://www.shiffman.net/itp/classes/nature/week06_s09/flocking/Boid.pde
  PVector align(ArrayList boids){
    float nDist = 50;
    if(mousePressed == true){ //When mouse is clicked, boids scatter.
      nDist = 0;
    }
    PVector steering = new PVector(0,0,0);
    int count = 0;
    for (int i = 0; i < boids.size(); i++){
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(location, other.location);
      if((d > 0) && (d < nDist)){
        steering.add(other.velocity);
        count ++;
      }
    }
    if(count > 0){
      steering.div((float) count);
    }
    
    if(steering.mag() > 0){
      steering.normalize();
      steering.mult(speedLimit);
      steering.sub(velocity);
      steering.limit(forceLimit);
    }
    return steering;
  }
  
  //Cohesion
  //Steer objects towards center of grouping
  //Original code at http://www.shiffman.net/itp/classes/nature/week06_s09/flocking/Boid.pde
  PVector cohesion(ArrayList boids){
    float nDist = 50;
    if(mousePressed == true){ //When mouse is clicked, boids scatter.
      nDist = 100;
    }
    PVector sum = new PVector(0,0,0);
    int count = 0;
    for(int i = 0; i < boids.size();i++){
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(location, other.location);
      if ((d>0) && (d < nDist)){
        sum.add(other.location);
        count++;
      }
    }
    if (count > 0){
      sum.div((float)count);
      return steering(sum,false);
    }
    return sum;
  }
}

class Flock{
  ArrayList boids;
  
  Flock(){
    boids = new ArrayList(); //Creates and initilizes an ArrayList for all boids. Original code: http://www.shiffman.net/itp/classes/nature/week06_s09/flocking/Flock.pde
  }
  
  void run(){
    for(int i = 0; i < boids.size(); i++){
      Boid b = (Boid) boids.get(i);
      b.run(boids);
    }
  }
  void addBoid(Boid b){
    boids.add(b);
  }
}
          
          
  

