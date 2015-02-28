
//data variables
  ArrayList ellipsoids = new ArrayList();
  PVector mouse, direction, loc, vel, accel;
  int numObjects = 5;
  
  
void setup(){
  size(500,500);
  
  //initialize and interate the ellipsoid class in the array list
  for (int i = 0; i < numObjects; i ++){
    //defines initial starting location and velocity
    PVector loc = new PVector(random(0, width), random(0,height), 0);
    PVector vel = new PVector(random(-1,1),random(-1,1), 0);
    PVector accel = new PVector(0,0);
    PVector mouse = new PVector(random(0,width),random(0,height));
    //Ellipsoids(PVector tempMouse,PVector tempLocation, PVector tempVelocity, PVector tempAcceleration)
    Ellipsoids tempEllipsoids = new Ellipsoids(mouse, loc, vel, accel);
    ellipsoids.add(tempEllipsoids);
  }//for
  
}//setup

void draw(){
  background(100); 
  toScreen();
}//draw

void toScreen(){
  //pull each ellipsoid out of the array and draw it to screen
  for(int j = 0; j < ellipsoids.size(); j++){
    Ellipsoids ellips = (Ellipsoids) ellipsoids.get(j);
    ellips.run();//method in class that starts other methods
  }//for
}//toScreen

class Ellipsoids{
  //our class of two dimensional aliens
  //here to play tag with our mice
  //avoid them!! all this class does is 
  //draw the ellipse with the given
  //variables from the main code
  
  //data variables
  //Some PVectors to store our coordinates in for easy access
  PVector location,mouse,direction,acceleration,velocity;
  //floats to transfer data from PVectors and do math
  float x,y,dx,dy;
  float boost = 0.5;
  boolean isFar = true;
  boolean isShort = false;
  
  //constructor
  Ellipsoids(PVector tempMouse,PVector tempLocation, PVector tempVelocity, PVector tempAcceleration){
    //initialize object data
    mouse = new PVector(tempMouse.x,tempMouse.y);
    location = new PVector(tempLocation.x,tempLocation.y);
    velocity = new PVector(tempVelocity.x,tempVelocity.y);
    acceleration = new PVector(tempAcceleration.x,tempAcceleration.y);
  }//constructor
  
  void run(){
    //run all the other methods
    trackMouse();
    move();
    tests();
    updateFar();
    updateShort();
    render();
  }//run
  
  //this continually tracks and updates the mouse PVector
  //so we can use that information in other methods.
  void trackMouse(){
      mouse = new PVector(mouseX,mouseY);
      //also update the difference between mouse and object
      direction = PVector.sub(mouse,location);
      direction.normalize();//simplify PVector
  }//trackMouse
  
 //update PVectors for movement
  void move(){  
      direction.mult(boost);//multiply by scalar
      acceleration = direction;//transfer data from one to other
      
      velocity.add(acceleration);//adds new accel data to velocity
      velocity.limit(10);//limits how large velocity can get
      location.add(velocity); //adds velocity to location 
      velocity.mult(0.9);//keeps object from going in circles around mouse
  }//updateFar
  
  //how close is the object to mouse
  //change booleans appropriately
  void tests(){
    //are we 'x' distance away?
    if(abs(mouse.x - location.x) >= 100 && abs(mouse.y - location.y) >= 100){
      isShort = false;
      isFar = true;
    }//if
    //did the mouse just move in a straight line up,down,left,right?
    if(abs(mouse.x - location.x) >= 0 && abs(mouse.y - location.y) > 100){
      isShort = false;
      isFar = true;
    }//if
    if(abs(mouse.x - location.x) > 100 && abs(mouse.y - location.y) >= 0){
      isShort = false;
      isFar = true;
    }//if
    //are we within 'x' amount of distance?
    if(abs(mouse.x - location.x) < 100 && abs(mouse.y - location.y) < 100){
      isFar = false;
      isShort = true;
    }//if
  }//tests
  
  //update the PVectors for when object is far from mouse
  void updateFar(){
    if(isFar){
      boost = 0.5;
      println("isFar");
    }//if
  }//updateClose
  
  //update the PVectors for when object is closer to mouse
  void updateShort(){
    if(isShort){  
      boost = 1.5;
      println("isShort");
    }//if
  }//updateClose
  
  void render(){
    noFill();
    stroke(0);
    ellipse(location.x,location.y,10,10);
  }//render
  
  
}//classEllipsoids


