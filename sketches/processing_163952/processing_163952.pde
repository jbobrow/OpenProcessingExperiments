
/* @pjs preload="myBackground.jpg, alex.png, alex_mouth.png, start-screen.jpg, cont-screen.jpg, game-over.jpg, bowl.png" ; font="OpenSans.ttf" ;

" ; */

ArrayList<Car> myCars ;
PVector frogLocation ;
PImage myBackground ;
PImage startscreen ;
PImage contscreen ;
PImage gameover ;
PImage bowl ;
PFont opensans ;
int score = 0 ;
int myState = 0 ;
int myCounter = 15*60 ; //15 seconds
int numBroths = 5 ; 

void setup() {
  opensans = createFont("OpenSans.ttf", 30) ;
  textFont(opensans) ;
  myBackground = loadImage("myBackground.jpg") ;
  startscreen = loadImage("start-screen.jpg") ;
  contscreen = loadImage("cont-screen.jpg") ;
  gameover = loadImage("game-over.jpg") ;
  bowl = loadImage("bowl.png") ;
  size(500, 500) ;
  myCars = new ArrayList() ;

  for (int i = 0; i < numBroths; i = i+1) {
    myCars.add(new Car()) ;
  }

  frogLocation = new PVector((width/2), height-130, 0) ;
  alex = loadImage("alex.png") ;
  mouth = loadImage("alex_mouth.png") ;
}

void draw() {
  println(myState) ;
  switch(myState) {
  case 0:
    //int numBroths = 5 ;
    image(startscreen, 0, 0) ;
    break ;

  case 1:

    myCounter = (myCounter-1) ;
    println(myCounter) ;
    //if myCounter < 0 then go to case 2
    if (myCounter < 0) {
      myState = 2 ;
    }

    image(myBackground, 0, 0) ;
    //playing the game
    game() ;
    break ;

  case 2:
    image(gameover, 0, 0) ;
    fill(#eeeeee) ;
    textFont(opensans, 38) ;
    text(score, 148, 461) ;
    //play again
    break ;

  case 3:
    image(contscreen, 0, 0) ;
    //play again
    break ;
  }
}

void keyPressed() {
  //right
  if (keyCode == 39) {
    frogLocation.x += 30 ;
  }

  //left
  if (keyCode == 37) {
    frogLocation.x -= 30 ;
  }

  //down
  if (keyCode == 38) {
    frogLocation.y -= 30 ;
  }

  //up
  if (keyCode == 40) {
    frogLocation.y += 30 ;
  }
}

void mousePressed() {
  // myState = (myState+1) % 4;
  if (myState == 0) {
    //numBroths = 5 ;
    //int numBroths = 5 ;
    myState = 1 ;
  }

  if (myState == 2) {
    
    score = 0 ;
    numBroths = 5 ;
    myCounter = 15 * 60 ; //15 seconds
    myState = 1 ;
    setup();
    

  //for (int i = 0; i < numBroths; i = i+1) {
      //myCars.add(new Car()) ;
    //}
    
    
    
  }

  if (myState == 3) {
    numBroths = numBroths + 2 ;
    myCounter = 15 * 60 ; //15 seconds
    myState = 1 ;


    for (int i = 0; i < numBroths; i = i+1) {
      myCars.add(new Car()) ;
    }
    
    
  }
}


class Car {

  //attributes
  PVector location ;
  PVector velocity ;
  color myColor ;
  boolean alive ;

  //constructors
  Car() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-3,3), random(-3,3)) ;
    myColor = color(random(0, 255), random(0, 255), random(0, 255)) ;
    alive = true ;
  }

  //methods
  void display() {
    image(bowl, location.x-30, location.y-20) ;
  } 

  void drive() {
    location.add(velocity) ;
    
    if (location.x > width+30) {
       location.x = -20; 
    }
    
    if (location.y > height+20) {
       location.y = -20; 
    }
    
    if (location.x < -30) {
       location.x = width+30; 
    }
    
    if (location.y < -20) {
       location.y = height+20; 
    }
    
  }
}

PImage alex ;
PImage mouth ;

void game() {
  image(myBackground, 0, 0) ;
  println(numBroths) ; 

  //bozo
  fill(#55dd55) ;
  image(alex, frogLocation.x-40, frogLocation.y-80) ;
  fill(#ffffff) ;

  //iterate through car array  
  for (Car myCar : myCars) {
     

    

    //test distance of car to frog
    float d = (myCar.location).dist(frogLocation) ;
    if (d < 50) {
      println("yum!") ;
      score = score+1 ;
      myCar.alive = false ;
     
    }
    
    if (d < 75) {
      image(mouth, frogLocation.x-40, frogLocation.y-80) ;
    }
    
    myCar.display() ;
    myCar.drive() ;

    
    
  }

  
noStroke() ;

  fill(#ff9999) ;
  rect(13, 11, 64, 54) ;
  fill(#f2f2f2) ;
  rect(15, 13, 60, 50) ;

  if (myCounter > 840) {
    fill(#ee6666) ;
    textSize(32) ;
    text("15", 26, 50) ;
  }

  if (myCounter < 840 && myCounter > 780) {
    fill(#ee6666) ;
    textSize(32) ;
    text("14", 26, 50) ;
  }

  if (myCounter < 780 && myCounter > 720) {
    fill(#ee6666) ;
    textSize(32) ;
    text("13", 26, 50) ;
  }

  if (myCounter < 720 && myCounter > 660) {
    fill(#ee6666) ;
    textSize(32) ;
    text("12", 26, 50) ;
  }

  if (myCounter < 660 && myCounter > 600) {
    fill(#ee6666) ;
    textSize(32) ;
    text("11", 26, 50) ;
  }

  if (myCounter < 600 && myCounter > 540) {
    fill(#ee6666) ;
    textSize(32) ;
    text("10", 26, 50) ;
  }

  if (myCounter < 540 && myCounter > 480) {
    fill(#ee6666) ;
    textSize(32) ;
    text("09", 27, 50) ;
  }

  if (myCounter < 480 && myCounter > 420) {
    fill(#ee6666) ;
    textSize(32) ;
    text("08", 27, 50) ;
  }

  if (myCounter < 420 && myCounter > 360) {
    fill(#ee6666) ;
    textSize(32) ;
    text("07", 27, 50) ;
  }

  if (myCounter < 360 && myCounter > 300) {
    fill(#ee6666) ;
    textSize(32) ;
    text("06", 27, 50) ;
  }

  if (myCounter < 300 && myCounter > 240) {
    fill(#ee6666) ;
    textSize(32) ;
    text("05", 27, 50) ;
  }

  if (myCounter < 240 && myCounter > 180) {
    fill(#ee6666) ;
    textSize(32) ;
    text("04", 27, 50) ;
  }

  if (myCounter < 180 && myCounter > 120) {
    fill(#ee6666) ;
    textSize(32) ;
    text("03", 27, 50) ;
  }

  if (myCounter < 120 && myCounter > 60) {
    fill(#ee6666) ;
    textSize(32) ;
    text("02", 27, 50) ;
  }

  if (myCounter < 60 && myCounter > 0) {
    fill(#ee6666) ;
    textSize(32) ;
    text("01", 27, 50) ;
  }



  //iterate through car array again and delete dead cars
  for (int i = 0; i < myCars.size (); i++) {
    Car thisCar = (Car) myCars.get(i) ;
    if (thisCar.alive == false) {
      myCars.remove(i) ;
    }
  } 

  if (myCars.size() <= 0) {
    myState = 3 ;
  }

  fill(#ffffff) ;
}
