

//Car[] myCars = new Car[10] ; 
ArrayList myCars ;
PFont lafont;
PVector frogPos ;
PImage ron;
PImage bg3;
PImage bg2;
PImage bg1;
int myState = 0;

void setup() {

  size(600, 500) ;
  lafont = createFont("AvenirNextCondensed-Medium-120.vlw", 50);
  frogPos = new PVector(width/2, height/2) ;  
  ron = loadImage("ron.png");
  bg1 = loadImage("BG1.jpg");
  bg2 = loadImage("BG2.jpg");
  bg3 = loadImage("BG3.jpg");
  myCars = new ArrayList() ; 

  for (int i = 0 ; i < 20 ; i++) {
    myCars.add(new Car()) ;
  }
}


void draw() {
  switch(myState) {
    
    case 0:
    noStroke();
    background (0);
   
    image(bg2, -30,-30);
     fill(255, 95);
     
    rect(0,100,width, 250);
    textFont(lafont, 45);
   
     fill(0);
    text("Help Ron Burgundy", 95, 200);
    text("report the news stories!", 55, 250);
    textFont(lafont, 20);
    text("(Move the arrow keys to catch the flying news.)", 80, 300);
    
    break;
    
    case 1:
 background(0) ; 
 
 image(bg1, 0, 0);

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
  
  image(ron, frogPos.x, frogPos.y, 70, 40) ;
  
  if (myCars.size() == 0) {
    myState = 2 ;
  }
  
  break;
  case 2:
  background (0);
  image(bg3, 0,0,width, height);
  fill(255);
  textFont(lafont, 30);
  
  text("Yay! Ron is the", 345, 100);
text("best anchorman!", 330, 150);
  
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


