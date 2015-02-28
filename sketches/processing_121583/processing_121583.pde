
/* @pjs font="cookies.ttf"; */

int myState = 0;

ArrayList myCars;
PVector frogPos;
PImage myImage;
PImage Background;
PFont myFont;

void setup() {
  size(500, 500) ; 
  Background = loadImage("SSBackground.png");
  myImage = loadImage("CookieMonster.png");
  frogPos = new PVector(width/2, height/2);
  myCars = new ArrayList();
  myFont = loadFont("cookies.ttf");

  for (int i = 0 ; i < 10 ; i++) {
    myCars.add(new Car()) ;
  }
}

void draw() {
  switch(myState) {
  case 0:  
    image(Background, 0, 0);
    textFont(myFont, 25);
    fill(255);
    text("Click to Start", 160, 400);
    break;

  case 1:
    image(Background, 0, 0);
    textFont(myFont, 25);
    fill(255);
    text("Press Arrow Keys to Eat Cookies!", 37, 233);
    for (int i = 0 ; i < myCars.size() ; i++) {
      Car tempCar = (Car) myCars.get(i);
      tempCar.display() ;
      tempCar.drive() ;

      float d = (tempCar.myPosition).dist(frogPos);
      if (d < tempCar.wide) {
        //println("boom!"); 
        tempCar.alive = false;
      }
    }

    for (int i = 0 ; i < myCars.size() ; i++) {
      Car tempCar = (Car) myCars.get(i);
      if (tempCar.alive == false) {
        myCars.remove(i);
      }
    }

    //draw frog
    //fill(0, 255, 0);
    image(myImage, frogPos.x, frogPos.y, 75, 75);

    if (myCars.size() == 0) {
      myState = 2;
    }
    break;

  case 2:
    image(Background, 0, 0);
    textFont(myFont, 25);
    fill(255);
    text("Click to Eat MORE COOKIES!", 85, 233);
    textFont(myFont, 60);
    text("OMNOMNOMNOM", 55, 420);
    break;
  }
}

void mousePressed() {
 if(myState == 0) {
  myState = 1;
 } 
 
 if(myState == 2) {
  for(int i = 0; i < 50; i++) {
   myCars.add(new Car());
  }
  myState = 1;
 }
}
    void keyPressed() {
      switch(keyCode) {
      case 37: // left
        frogPos.x = frogPos.x - 10;
        break;

      case 38: // up
        frogPos.y = frogPos.y - 10;
        break;


      case 39: //right
        frogPos.x = frogPos.x + 10;
        break;

      case 40://down
        frogPos.y = frogPos.y + 10;
        break;
      }
    }

class Car {
  
  // attributes  
  PImage myImage;
  color myColor ;
 PVector myPosition;
 PVector myVelocity;
 float wide;
 boolean alive;
  
  // Constructor
  Car() {
    myImage = loadImage("Cookie.png");
    //loadImage
    myVelocity = new PVector(random(-2, 2), random(-2, 2));
    myPosition = new PVector(random(width), random(height));
    myColor = color(random(255), random(255), random(255)) ;
    wide = random(30, 60); 
    alive = true;
  }
  
  // Methods
  void display() {
    // this is the part I will change later!!!!
    //fill(129, 26, 17) ; 
    image(myImage, myPosition.x, myPosition.y, 25, 25) ; 
  }
  
  void drive() {
    myPosition.add(myVelocity);
    
    if (myPosition.x > width) {
      myPosition.x = 0 ;
    }
    if (myPosition.x < 0) {
     myPosition.x = width; 
    }
    
    if (myPosition.y < 0) {
     myPosition.y = height; 
    }
    
    if (myPosition.y > height) {
     myPosition.y = 0; 
    }
  }
     
}


