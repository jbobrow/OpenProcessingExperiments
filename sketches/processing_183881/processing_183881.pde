
class Acorns {
 
  
 

 //attributes
PVector velocity;
PVector position;

boolean alive;
PImage myAcornImage;

//constructer
Acorns() {
  
  position = new PVector(random(0, width), 0);
  
//  println(position);
  velocity = new PVector (0, random (3));
  
  alive = true;
  
    switch (int(random(2))) {
   
   case 0: 
  myAcornImage = a1 ;
  break; 
  
  case 1: 
  myAcornImage = a2 ;
  break ;
  
  }
  
  
}

//methods

void display() {
   image (myAcornImage, position.x, position.y);
}

void update() {
  
  position.add(velocity) ;
  
  if (position.y > height) {
    position.y = 0;
  }
  if (position.y < 0) {
    position.y = height;
  }
 
}
}



