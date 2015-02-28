
/* @pjs font="RobotoCondensed-Regular.ttf"; */

//Car myCar1 ; 

PFont myFont;

ArrayList myCars ;
//Car[] myCars = new Car[10] ; 

PVector frogPos ;
PImage brownfloor;
PImage spider;
PImage bigspider;
PImage squashspider;
PImage shoe ;
int myState = 0 ;


void setup() {
  size(1000, 800) ; 
  smooth();
  noStroke();

  brownfloor = loadImage("brownfloor.jpg");
  spider = loadImage("spider.png");
  bigspider = loadImage("bigspider.png");
  squashspider = loadImage("squashspider.png");
  shoe = loadImage("blueshoe.png");
  myFont = createFont("RobotoCondensed-Regular.ttf", 200);

  frogPos = new PVector(width/2, height/2);

  //myCar1 = new Car() ;

  myCars = new ArrayList();

  for (int i = 0 ; i < 10 ; i++) {
    myCars.add (new Car()) ;
  }
}


void draw() {
  noStroke();
  smooth();
  textFont(myFont, 50);

  switch(myState) {

    //splash screen
  case 0:
    background(brownfloor) ; 
    text("Use the arrow keys to squash the spiders!!!", 90, 150);
    text("Click to start", 380, 250);
    image(bigspider, 285, 300, 432, 288);

    break ;


    //game

  case 1:

    background(brownfloor) ; 
    smooth();
    noStroke();
    //drawing cars
    for (int i = 0 ; i < myCars.size() ; i++) {
      Car tempCar = (Car)myCars.get(i) ;
      tempCar.display() ;
      tempCar.drive() ;

      float d = (tempCar.myPosition).dist(frogPos) ;
      if (d < tempCar.wide) {
        //println("boom!") ;
        tempCar.alive = false;
        tempCar.lifeForce-- ;
      }
    }

    // delete dead spiders
    for (int i = 0 ; i < myCars.size() ; i++) {
      Car tempCar = (Car)myCars.get(i) ;

      if ((tempCar.alive == false) && (tempCar.lifeForce < 0)) {
        myCars.remove(i) ;
      }
    }

    //draw frog
    //fill(0, 200, 0);
    //ellipse(frogPos.x, frogPos.y, 40,40);
    image(shoe, frogPos.x, frogPos.y, 200, 200);

    if (myCars.size() == 0) {
      myState = 2;
    }

    break ;

    //reset screen
  case 2:
    background(brownfloor) ; 
    textSize(200);
    text("YOU WIN!!!", 87, 180);
    textSize(30);
    text("To annihilate more spiders,", 340, 290);
    text("click your mouse to reset!", 345, 320);
    image(squashspider, 295, 400, 432, 288);
    break;
  }
}

void keyPressed() {
  //println(keyCode);
  switch(keyCode) {

  case 37: //left
    frogPos.x = frogPos.x - 20;
    break ;

  case 38: //up
    frogPos.y = frogPos.y - 20;
    break;

  case 39:// right
    frogPos.x = frogPos.x + 20;
    break;

  case 40: // down
    frogPos.y = frogPos.y + 20;
    break;
  }
}


void mousePressed() {
  if (myState == 0) {
    myState = 1 ;
  }

  if (myState == 2) {
    //make more cars
    for (int i = 0 ; i < 10 ; i++) {
      myCars.add (new Car()) ;
    }
    myState = 0 ;
  }
}

class Car {
  
  // attributes  
  color myColor ;
  PVector myPosition ;
  PVector myVelocity ;
  float wide ;
  boolean alive ;
  int lifeForce ; 
  
  // Constructor
  Car() {
    myVelocity = new PVector (random(-2,2), random(-2,2) ) ;
    myPosition = new PVector (random(width), random(height));
    myColor = color(random(255), random(255), random(255)) ;
    wide = random(100,150);  
    alive = true;
    lifeForce = 80 ;
}
  
  
  // Methods
  void display() {
    // this is the part I will change later!!!!
    //fill(myColor) ; 
    //rect(myPosition.x, myPosition.y, wide, 25) ; 
    
    if (lifeForce == 80) {     
    image(spider, myPosition.x, myPosition.y, wide, 100);
    } else {
      lifeForce-- ; 
      // put in a splat image
         image(spider, myPosition.x, myPosition.y, wide, 10);
         //println(lifeForce);
    }
    
  }
  
  void drive() {
    if(alive) {
    myPosition.add(myVelocity) ;
    }
    
    if (myPosition.x > 1100) {
      myPosition.x = -100 ;
    }
    
    if (myPosition.x < -100) {
      myPosition.x = 1100 ;
    }
    
    if (myPosition.y <-100) {
      myPosition.y = 900 ;
    }
    
    if (myPosition.y > 900 ) {
      myPosition.y = -100 ;
    }
      
  }
     
}


