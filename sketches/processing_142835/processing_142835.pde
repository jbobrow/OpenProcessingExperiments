

ArrayList myCars ;
//float frogX ;
//float frogY ; 
PImage pokeball ;
PImage pika ;
PImage woods ;
PImage begin ;
PImage end ; 
PVector frogPos ;
int deathCounter = 0 ; 
int myState = 0 ; 

void setup() {
  
  size(600, 600) ;
  rectMode(CENTER) ;
  pokeball = loadImage("Pokeball.png");
  woods = loadImage("forest.jpg");
  begin = loadImage("Erika.jpeg");
  end = loadImage("catch.jpg");
  
 // frogX = width/2 ;
 // frogY = height-50 ; 
 frogPos = new PVector(mouseX, mouseY) ;

  myCars = new ArrayList() ;  // make a new arrayList

  for (int i = 0 ; i < 20; i++) {
    myCars.add(new Car()) ;   
  }
}


void draw() {
  
  switch(myState) {
    
    case 0: 
    background(100) ;
    textSize(100);
    image(begin, 0, 0, width, height);
    fill(#FFF300);
    text("Pika Panic!", 30, 100);
    fill(75, 200);
  rect(300, 500, 500, 120, 6);
    fill(255);
    textSize(12);
    text("Oh my, it seems all of the Pikachu have escaped, Ash! This is probably Team " , 65, 480) ; 
    text("Rocket's doing...Hurry and use these Pokeballs to capture them all before they " , 65, 495) ;
    text("wander too far into Viridian Forest! -- CLICK SCREEN TO PLAY! --   ", 65, 510);
    break ; 
    
    
  case 1:
// ***** STATE 1 - PLAYING THE GAME *****

  background(100) ; 
  image(woods, 0, 0, width, height);

// moves my cars and tests the distance to the frog
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
 
 //   PVector frogLoc = new PVector(frogX, frogY) ; 
    float d = (car.loc).dist(frogPos) ;
    
    if (d < 50) {
 //     println("BOOM!!!" ) ; 
      car.alive = false ;  // mark this car for deletion 
      // myState = 2 ; 
    }
    
  }
  
  
  
   for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    
    // check if car is alive
    if (car.alive == false){
      myCars.remove(i) ;
      deathCounter++ ; 
    }
    
   } 
  
  // check to see how many cars we have
  if (myCars.size() == 0) {
    myState = 2 ;
  }
  
  // update Frog's position
  frogPos.x = mouseX ;
  frogPos.y = mouseY ;
  
  // draw my pokeball!
 
  fill(0, 150, 0) ;   
 image(pokeball, frogPos.x, frogPos.y, 40, 40);
   
  
  // draw the count of captures!
  fill(255, 0, 0) ; 
  textSize(55) ; 
  text(deathCounter, 80, 150) ;
  
// ***** END OF STATE 1 - PLAYING THE GAME *****  
  break ; 
  
  
  case 2:
  background(100) ; 
  image(end, 0, 0, width, height);
  textSize(24);
  fill(0);
  text("Great job, you caught them all! ", 20, 40);
  text("Try again? (Click Screen)", 20, 80) ;

  // deathCounter = 0 ;
  break ; 
  
  }
  
}  // END OF DRAW ROUTINE


void mousePressed() {
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
//  println("key pressed = " + keyCode) ;
 
 if (keyCode == 39) {  // right
  frogPos.x = frogPos.x + 20 ;
 }

 if (keyCode == 37) {  // left
   frogPos.x = frogPos.x - 20 ;
 }
 
  if (keyCode == 38) {  // up
  frogPos.y = frogPos.y - 20 ;
 }

 if (keyCode == 40) {  // down
   frogPos.y = frogPos.y + 20 ;
 }
 
}


class Car {
  
  // attributes
  PVector loc ; 
  PVector vel ;
  color myColor ;
  boolean alive ;
PImage pika;
  
  // constructor
  Car() {
    loc = new PVector(random(width), random(height)) ;
    vel = new PVector(random(1,5), 0) ;
      pika = loadImage("pikachu.png");
    myColor = color(random(255), random(255), random(255)) ; 
    alive = true ; 
  }
  
  
  // methods
  void display() {
   image(pika, loc.x, loc.y, 85, 85);
    
// text(v, x, y-10) ; 
  }
  
  void drive() {
    loc.add(vel) ;
    
    if (loc.x > width) {
      loc.x = 0 ;
    }
    
  }
  
  
}


