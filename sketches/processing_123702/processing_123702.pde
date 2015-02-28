
PImage rocketship;
PImage rocketshipleft;
PImage rocketshipright;
PImage rocketshipdown;
PImage myRocket;
PImage astro;
int myState = 0;
int myState2 = 0;

//Car[] myCars = new Car[10] ; 
ArrayList myCars ;

PVector frogPos ;

void setup() {

  size(500, 500) ;
  
  rocketship = loadImage("rocketshipspace3.png");
  rocketshipleft = loadImage("rocketshipspace3left.png");
  rocketshipright = loadImage("rocketshipspace3right.png");
  rocketshipdown = loadImage("rocketshipspace3down.png");
  
  myRocket = rocketship;
  
  
  
  astro = loadImage("astro.png");

  frogPos = new PVector(width/2, height/2) ;  

  myCars = new ArrayList() ; 

  for (int i = 0 ; i < 10 ; i++) {
    myCars.add(new Car()) ;
  }
}


void draw() {
  
  
  switch(myState) {
    
  ///splash screen/////////////
    case 0:
    background(0);
    fill(255);
    textSize(30);
    text("Click To Save The Lost Astronauts!", 15, 250);
    
    break;
  
    
    
   case 1: 
  //////this is where the game is played/////////
  
  background(0) ; 
  
  

  // drawing and moving cars
  for (int i = 0 ; i < myCars.size() ; i++) {   
    Car tempCar = (Car) myCars.get(i) ; 
    tempCar.display() ;
    tempCar.drive() ;
    
    float d = (tempCar.pos).dist(frogPos) ;
    if (d < tempCar.wide) {
      //println("boom");
      tempCar.alive = false ;
    }  
  }
  
  for (int i = 0 ; i < myCars.size() ; i++) {   
  Car tempCar = (Car) myCars.get(i) ;
  if (tempCar.alive == false) {
   myCars.remove(i) ;
  }
  } 
  
  // draw frog
  
image(myRocket, frogPos.x, frogPos.y);
  
  
  
   if (frogPos.x > width) {
      frogPos.x = 0 ;
    }
    
    if (frogPos.x < 0) {
      frogPos.x = width ;
    }
    
    if (frogPos.y < 0) {
      frogPos.y = height ;
    }
    
    if (frogPos.y > height) {
      frogPos.y = 0 ;
    }


if (myCars.size() == 0) {
  myState = 2;
}

break;


/////reset screen////////e
case 2:
fill(255);
textSize(50);
text("Click To Play Again!", 25, 250);

break;

  }
}

void keyPressed() {
  //println(keyCode) ; 
  switch(keyCode) {
  case 37: // left arrow
    frogPos.x = frogPos.x - 15 ;
    myRocket = rocketshipleft;
    
    break ; 

  case 38: // up
    frogPos.y = frogPos.y - 15 ;
    myRocket = rocketship;
    break ;
    
    

  case 39: // right
    frogPos.x = frogPos.x + 15 ;
    myRocket = rocketshipright;
    break ;

  case 40: // down
    frogPos.y = frogPos.y + 15 ; 
    myRocket = rocketshipdown;
    break ;
  }
}


void mousePressed() {
  if(myState == 0) {
    myState = 1 ;
  }
  
  if(myState == 2) {
    ///////make more cars here/////////
    for (int i = 0 ; i < 10 ; i++) {
    myCars.add(new Car()) ;
  }
    background(0);
    myState = 0;
  }
  
}
  



class Car {
  
  // attributes  
color myColor ;
PVector vel ; 
PVector pos ;
float wide ;
boolean alive ;

// PVector myPosition.z ;
  
  // Constructor
  Car() {
    vel = new PVector(random(-2, 2), random(-2, 2)) ;
    pos = new PVector(random(width), random(height)) ; 
    myColor = color(random(255), random(255), random(255)) ;
    wide = random(30,60) ;
    alive = true ;
    
  }
  
  // Methods
  void display() {
    // this is the part I will change later!!!! 
    image(astro, pos.x, pos.y, 23, 41); 
  }
  
  void drive() {
    pos.add(vel) ; 
    
    if (pos.x > width) {
      pos.x = 0;
    }
   
    if (pos.x < 0) {
      pos.x = width;
    }
 
    if(pos.y > height) {
      pos.y = 0 ;
    }
    
     if(pos.y < 0) {
      pos.y = height ;
    }
}
     
}


