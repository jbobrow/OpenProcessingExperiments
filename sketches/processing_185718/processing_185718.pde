
ArrayList<Unit> fleet = new ArrayList<Unit> ();



void setup() 
{
size (400, 400);

fleet.add (new Corvette (random (0, width), random (0, height), random (5,15)));
fleet.add (new Frigate (random (0, width), random (0, height), random (5,15)));



}


void draw() 
{
background (255,255,255);


for (int i = 0; i < fleet.size(); i ++) {
  fleet.get(i).display();
  }




  
}
class Corvette extends Unit {
  float sizeF = 100;
  
Corvette (float x, float y, float _sizeF) 
  { 
  super (x, y);
  this.sizeF = _sizeF;
  }   
  

void display () 
  {
  pushMatrix();
  pushStyle();
  translate (location.x, location.y);
  
 
  fill (#FF7400);
  ellipse (location.x, location.y, sizeF, sizeF*4); 
  
  
  popStyle();
  popMatrix();
  }


}
class Frigate extends Unit {
  float sizeF = 100;
  
Frigate(float x, float y, float _sizeF) 
  { 
  super (x, y);
  this.sizeF = _sizeF;
  }   
  

void display () 
  {
  pushMatrix();
  pushStyle();
  translate (location.x, location.y);
  
  rectMode (CENTER);
  fill (#FF7400);
  rect (location.x, location.y, sizeF, sizeF*4); 
  
  
  popStyle();
  popMatrix();
  }


}
class Unit {
//globals for all the functions
PVector location;
PVector velocity;
PVector acceleration;
float stop_distance = 100;

//size of the drone
int s = 15;

//the target the ship is moving to now
PVector currentTarget = new PVector (0,0);

//milscenarious variables
float maxforce;
float maxspeed;
float r = 5;
float m = 5;


// life parameters - not used in this version
float hp = 100;
float fp = 100;
float dhp = 0.01;
float dfp = 0.01;


  
Unit (float _x, float _y) {
// initializing the object
  acceleration = new PVector (0,0);
  velocity = new PVector (0,0);
  location = new PVector (_x, _y);
  
  maxspeed = 1;
  maxforce = 0.2;
  }


//**************************************************************
//MOVING PROCEDURE
//**************************************************************


//some inner procedures for the move function
void seek(PVector target) 
  {
  PVector desired = PVector.sub (target, location);
  float d = desired.mag();
  desired.normalize();

  if (d < stop_distance) {
  float con = map (d, 0, stop_distance, 0, maxspeed);
  desired.mult (con);
  }

else {
  desired.mult(maxspeed);
  }

  PVector steer = PVector.sub(desired, velocity);
  steer.limit (maxforce/m);
  
  acceleration.add (steer);
}

// update the coordinates - BASICALLY moving
void update() {
  velocity.add (acceleration);
  velocity.limit (maxspeed);
  location.add (velocity);
  acceleration.mult(0);
}

//the main MOVE function - sets the target
void setTarget (float _x, float _y) {
  currentTarget.x = _x;
  currentTarget.y = _y;

}

// moving
void move () {
//only responsible for moving
  seek(currentTarget);
  update();
  }

//the main function
void script() {
  move();
  life();
 }

// life statistics - originally the drone should have needed repairs and fuel - not in this version
void life () {
hp = hp - dhp;
fp = fp - dfp;
}


//**************************************************************

float getX () {
return location.x;
}

float getY () {
return location.y;
}
}



