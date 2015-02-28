
PImage img;
PImage city;
//Car[] myCars = new Car[10] ; 
ArrayList myCars ;

PVector frogPos ;

int myState = 0;
int waterLevel = 0 ; 

void setup() {
  city = loadImage("citybackground.png");
  
  img = loadImage("umbrella.png");
  size(500, 500) ;

  frogPos = new PVector(width/2, 450) ;  

  myCars = new ArrayList() ; 

  // give birth to new cars
  for (int i = 0 ; i < 20 ; i++) {
    myCars.add(new Car()) ;
  }
}


void draw() {

  switch (myState) {

  case 0:

    background(100) ;
    text("CLICK SPACE TO PLAY", 20, 100);

    break;

  case 1:

    background(100) ; 
    
  image(city, 0, -100);
 
    
    // image(myPicture, 0, 0) ;
    
    // drawing and moving cars
    for (int i = 0 ; i < myCars.size() ; i++) {   
      Car tempCar = (Car) myCars.get(i) ; 
      tempCar.display() ;
      tempCar.drive() ;    

      float d = (tempCar.pos).dist(frogPos);
      if (d < tempCar.wide) {
        println("boom");
        tempCar.alive = false;
      }
    }

    for (int i = 0 ; i < myCars.size() ; i++) { 
      Car tempCar = (Car) myCars.get(i) ;

      if (tempCar.alive == false) {
        myCars.remove(i) ;
      }
    }

    // draw guy

    image(img, frogPos.x-30, frogPos.y-22);
    img.resize(75, 75);

    // draw the Water Level
    fill(#0000FF) ; 
    rect(0, height-(waterLevel/3), width, (waterLevel/3)) ; 

    if (myCars.size()==0) {
      myState=2;
    }

    if (waterLevel>45){
      myState=3;
    }

    break;

  case 2:
    text("YOU WON!!!", 20, 100);
    break;

  case 3:
 text("YOU LOSE!!!", 20, 100);
    break;
  }
}

void keyPressed() {
  //println(keyCode) ; 
  switch(keyCode) {

  case 32: //spacebar

    switch(myState) {

    case 0:
      myState = 1 ; 
      break ;

    case 1: 
      break ; 

    case 2: // winnning state
      myCars.clear() ; 
      for (int i = 0 ; i < 20 ; i++) {
        myCars.add(new Car()) ;
      }  
     
    waterLevel=0;
      
      myState = 1 ; 
      break ;
      
      case 3: // losing state
       myCars.clear() ; 
      for (int i = 0 ; i < 20 ; i++) {
        myCars.add(new Car()) ;
      }  
     
    waterLevel=0;
      
      myState = 1 ;      
      break ;
    }


    break;

  case 37: // left arrow
    frogPos.x = frogPos.x - 13 ;

    break ; 

    //case 38: // up
    //frogPos.y = frogPos.y - 3 ;
    //break ;

  case 39: // right
    frogPos.x = frogPos.x + 13 ;
    break ;

    //case 40: // down
    //frogPos.y = frogPos.y + 3 ; 
    //break ;
  }
}

void mousePressed() {
  if (myState == 0) {
    myState = 1;
  }

  if (myState == 1) {
    for (int i = 0; i<10; i++) {
      myCars.add(new Car());
    }

    myState=0;
  }
}

class Car {
  
  // attributes  
  color myColor ;
PVector vel ; 
PVector pos ;
float r;
float wide;
boolean alive;

// PVector myPosition.z ;
  
  // Constructor
  Car() {
    r = random(6,10) ; //8;
    vel = new PVector(random(0), random(1, 3)) ;
    pos = new PVector(random(width), -4) ; 
    myColor = color(50, 100, 150) ;
    wide = 35 ;
    alive = true ; 
  }
  
  // Methods
  void display() {
    // this is the part I will change later!!!!
    fill(myColor) ; 
    noStroke();
    for (int i = 2; i < r; i++ ) {
      ellipse(pos.x, pos.y + i*4,i*2,i*2);
    }
  }
  
  void drive() {
    pos.add(vel) ; 
   
   if (pos.y > height){
     pos.y = 0 ;
     waterLevel++ ; 
   }
   
  }
     
}


