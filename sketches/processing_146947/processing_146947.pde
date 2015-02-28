
/*@pjs font ="Raleway-Thin.ttf"; */


PImage sunset;
ArrayList myCars ;
PFont rale;
int myState=0;
//splash background opacity
int x8 = 0;
PVector frogPos ;

void setup() {
  size (600,475);
  sunset = loadImage ("sunsetsmall.jpg");
  rale=createFont ("Raleway-Thin.ttf", 100);
  textFont (rale, 50);
 
 frogPos = new PVector(width/2, height/2) ;  

  myCars = new ArrayList() ; 

  for (int i = 0 ; i < 20 ; i++) {
    myCars.add(new Car()) ;
  }
}


void draw() {
   switch (myState) {
    case 0:
    // splash screen
    image (sunset, -100,0);
    textFont (rale, 50);
    textSize(50);
    text("Click to Play!", 50, 100);
    textSize(25);
    text("Use the arrow keys to catch the lightning bugs!", 50, 150);
    break;
    
    case 1:
    //night falls
     
     image (sunset, -100, 0);
      fill (0, 0, 0, x8);
     rect (0, 0, 600, 475);
     
     x8 = x8 + 1;
     if (x8 > 125) {
       x8 = 125;
     }
     
     
     if (x8 > 125) {
       myState = 2;
     
     }
     
     case 2:
//play game
    
     
       // draw frog
 
  stroke(25);
 fill (65, 65, 65, 150);
  ellipse(frogPos.x, frogPos.y, 32, 10) ;
  
  fill (25);
  rect(frogPos.x-16, frogPos.y+2, 30,7);
  fill (75, 75, 75, 150);
  ellipse(frogPos.x, frogPos.y-2, 32, 10) ;
  fill (255, 255, 255, 30);
  ellipse(frogPos.x, frogPos.y+5, 30, 7);
  
  
  fill (75, 75, 75, 150);
  ellipse(frogPos.x, frogPos.y+10, 35, 10) ;
  noStroke();
  rect (frogPos.x-18, frogPos.y+10, 35, 40);
  stroke(50);
  fill (75, 75, 75, 150);
  ellipse (frogPos.x, frogPos.y+49, 35, 10);

// drawing and moving cars
  for (int i = 0 ; i < myCars.size() ; i++) {   
    Car tempCar = (Car) myCars.get(i) ; 
    tempCar.display() ;
    tempCar.drive() ; 
  float d=(tempCar.pos).dist(frogPos);
      if (d<tempCar.space) {
        tempCar.alive=false;
      }
    }
 
    for (int i = 0 ; i < myCars.size() ; i++) {
      Car tempCar = (Car) myCars.get(i) ;
      if (tempCar.alive==false) {
        myCars.remove(i);
      }
    }
 
    if (myCars.size()==0) {
      myState=3;
    }  
    break; 

 case 3:
      image (sunset, -100, 0);
      fill (0, 0, 0, x8);
      rect (0, 0, 600, 475);
 
 x8 = x8 + 1;
 if (x8 > 255) {
   x8 = 255;
 }
 fill (255);
 textFont (rale, 50);
 textSize(50);
 text ("you won! good job.", 50, 100);
 textSize(25);
 text ("click to play again!", 50, 200);
 
 break;
    
  }
}




void keyPressed() {
  switch(keyCode) {
case 37: // left arrow
  frogPos.x = frogPos.x - 9 ;
  if (frogPos.x < 0) {
    frogPos.x = width;
  }
break ; 

case 38: // up
frogPos.y = frogPos.y - 9 ;
if (frogPos.y < 0) {
  frogPos.y = height;
}
break ;

case 39: // right
frogPos.x = frogPos.x + 9 ;
if (frogPos.x > width) {
  frogPos.x = 0;
}
break ;

case 40: // down
frogPos.y = frogPos.y + 9 ; 
if (frogPos.y > height) {
  frogPos.y = 0;
}
break ;
    
  }
}



void mousePressed() {
  if (myState==0) {
    myState=1;
  }
      if (myState==3) {
        for (int i = 0; i <20; i++) {
          myCars.add(new Car() );
        }
          myState=1;
}
}
class Car {
  
  // attributes  
  color myColor ;
PVector vel ; 
PVector pos ;

int x1 = 0;
int x2 = 0;

float x3; 
float space;
boolean alive;


// PVector myPosition.z ;
  
  // Constructor
  Car() {
    vel = new PVector(random(-2, 2), random(-2, 2)) ;
    pos = new PVector(random(width), random(height)) ; 
    space = (12);
    alive = true;
    
   
  }
  
  // Methods
  void display() {
    fill(x1, x2, 0); 
    ellipse(pos.x, pos.y, space, 12) ; 
    x3 = random (10);
  
    x1 = x1 + 3;
    if (x1 > 225) {
      x1 = 0;
    }
      
      if (x2 > 0) {
        x1 = 0;
    }
      
      x2 = x2 + 2;
      if (x2 > 255) {
        x2 = 0;
      }
        
  }
  
  void drive() {
    pos.add(vel) ;
    if (pos.x > width) {
      pos.x = 0 ;
    }
    if (pos.x<0) {
      pos.x=width;
    }
    if (pos.y>height) {
      pos.y=0;
    }
    if (pos.y < 0) {
      pos.y=height;
    }
 
  }
}



