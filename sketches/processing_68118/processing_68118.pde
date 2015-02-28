
//class defining a random walker object that influences the particle system

class attractorWalker {
  


//need some properties - because you already have used some vectors lets skip out
//on the usual x,y variables and just use PVectors for location and velocity. 

  PVector loc,vel; // putting them "in line variable declaration" saves space and only use when not needing variable input yet
//in the constructor make sure you can assign these properties so that
//each random walker is unique.

 attractorWalker(PVector _loc,PVector _vel) {
   // assign values location and veloctiy inside constructor
   
   loc = _loc;
   vel = _vel;
      
 }

//then in our methods, we will need a:


//run method - calls all the methods of the classs

void run(){
  
  //things to put here later
  update();
//  display(); //shows walker
  checkEdges();
}

//update position method - changes the velocity vector randomly, and then adds the 
//velocity to the location vector.

void update() {

    vel.set( random(-attractorSpeed,attractorSpeed), random(-attractorSpeed,attractorSpeed) , 0 );
    loc.add(vel);
  }

//maybe a render method for drawing the walker if you want.

void display() {
  
  fill(255);
 ellipse(loc.x, loc.y, 5,5); 
}

  void checkEdges() {  //moves particles to other side

    if (loc.x > width) {
     loc.x = 0;
     } 
     else if (loc.x < 0) {
     loc.x = width;
     }
     
     if (loc.y > height) {
     loc.y = 0;
     }  
     else if (loc.y < 0) {
     loc.y = width;
     }

  }

}

