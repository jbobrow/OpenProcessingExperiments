
// assign the DART array as a new array of DARTS
Dart[] darts = new Dart[100];
//Dart[] darts = new Dart[1000];

void setup() {
  //size(displayWidth, displayHeight);
  size(500,500);
  background(0);
  //fillllll that array
  for (int i =0; i<darts.length; i++) {
   darts[i] = new Dart(); 
  }
}

void draw() {
  background(29, 56, 88);
  // call the dart functions for each dart in the array
  for (int i = 0; i< darts.length; i++) {
    darts[i].update();
    darts[i].checkEdges();
    darts[i].display();
  }
  
}

class Dart {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
 
 Dart(){
  location = new PVector(random(width), random(height));
  velocity = new PVector(0,0);
  //assign topspeed so shit don't go crazy fast
  topspeed = 10;
  
 } 
 
 void update() {
  PVector mouse = new PVector(mouseX, mouseY);
  //calculate a vector that points from the object to the target location... IE work out direction
  //Have to use a static ref. to create a new vector with sub.answer
  PVector direction = PVector.sub(mouse,location);
  
  // REPEL WHEN MOUSE PRESSED
  if(mousePressed == true) {
    direction.x = direction.x*-1;
    direction.y = direction.y*-1;
  } else{
    direction.x = direction.x;
    direction.y = direction.y;
  }
  
  //to set magnitude we need to normalize IE shrink vector down to it's unit vector (Length of one)
  //so that we have a vector that tells u it's direction and can be scaled easily by multiplication. 1 x anything = anything!
  direction.normalize();
  // scaling/multiplying by a value
  direction.mult(random(0,10));
  //assign this new value to acceleration to make it go go go
  acceleration = direction;
  
  //speed at which to move
  velocity.add(acceleration);
  //don't move it too fast
  velocity.limit(topspeed);
  //move it biatch
  location.add(velocity);
 
 }
 
 
 void display(){
   noStroke();
   fill(214,214,209, 80);
   ellipse(location.x, location.y, 50,50);
   //rect(location.x, location.y, 80, 80);
 }
 
 void checkEdges() {
  if (location.x > width){
     location.x = 0;
  }else if(location.x < 0){
     location.x = width;
  }
 if (location.y > height){
     location.y = 0;
  }else if(location.y < 0){
     location.y = height;
  } 
 }
 
  
}
