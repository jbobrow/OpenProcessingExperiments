


//Car[] myCars = new Car[10] ; 
ArrayList myCars ;
PFont lafont;
PVector frogPos ;
PImage ron;
int myState = 0;

void setup() {

  size(600, 500) ;
  lafont = createFont("AvenirNextCondensed-Medium-120.vlw", 50);
  frogPos = new PVector(width/2, height/2) ;  
  ron = loadImage("ron.png");
  myCars = new ArrayList() ; 

  for (int i = 0 ; i < 20 ; i++) {
    myCars.add(new Car()) ;
  }
}


void draw() {
  switch(myState) {
    
    case 0:
    background (0);
    textFont(lafont, 25);
    text("Help Ron Burgundy report the news stories!", 30, 200);
    
    
    break;
    
    case 1:
  background(0) ; 

  // drawing and moving cars
  for (int i = 0 ; i < myCars.size() ; i++) {   
    Car tempCar = (Car) myCars.get(i) ; 
    tempCar.display() ;
    tempCar.drive() ;
    
    float d = (tempCar.pos).dist(frogPos);
    if (d < tempCar.wide) {
      
      tempCar.alive = false;
    }
    
  }
  
  for (int i = 0 ; i < myCars.size() ; i++) {   
    Car tempCar = (Car) myCars.get(i) ; 
    if (tempCar.alive == false) {
      myCars.remove(i);
    }}
 

  // draw frog
  fill(100, 170,200) ;
  image(ron, frogPos.x, frogPos.y, 70, 40) ;
  
  if (myCars.size() == 0) {
    myState = 2 ;
  }
  
  break;
  case 2:
  background (0);
  textFont(lafont, 30);
  text("Yay! Ron is the best anchorman!", 50, 200);
  
  break;
  
}

}

void mousePressed () {
   if (myState == 0) {
    myState = 1 ; 
  }
  
  if (myState == 2) {
     // reset the amount of cars
   for (int i = 0 ; i < 20; i++) {
    myCars.add(new Car()) ;   
  }
    
    myState = 0 ;
  }
  
}

void keyPressed() {
  println(keyCode) ; 
  switch(keyCode) {
  case 37: // left arrow
    frogPos.x = frogPos.x - 15 ;

    break ; 

  case 38: // up
    frogPos.y = frogPos.y - 15 ;
    break ;

  case 39: // right
    frogPos.x = frogPos.x + 15 ;
    break ;

  case 40: // down
    frogPos.y = frogPos.y + 15 ; 
    break ;
  }
}

class Car {
  
  // attributes  
  color myColor ;
PVector vel ; 
PVector pos ;
float wide;
boolean alive;
PImage ron;
PImage story;
float high;

// PVector myPosition.z ;
  
  // Constructor
  Car() {
    vel = new PVector(random(-2, 2), random(-2, 2)) ;
    pos = new PVector(random(width), random(height)) ; 
    myColor = color(random(255), random(255), random(255)) ;
    wide = random(30, 60);
    alive = true;
    ron = loadImage("ron.png");
    story = loadImage("story.png") ;
    high = random( 50, 70);
    
    
  }
  
  // Methods
  void display() {
    // this is the part I will change later!!!!
    fill(myColor) ; 
    image(story, pos.x, pos.y, wide, high) ; 
  }
  
  void drive() {
    pos.add(vel) ; 
   /* if (x > width) {
      x = 0 ;
    }
    */
    
    if (pos.x > width) {
      pos.x = 0;
    }
    
      if (pos.x < 0) {
      pos.x = width;
    }
    
    if (pos.y > height) {
      pos.y = 0;
    }
    
      if (pos.y < 0) {
      pos.y = height;
    }
        
    
    
  }
     
}


