
int myState = 0;
int myCounter = 50;

ArrayList myCars;
PVector frogPos;
String[] myStrings = {"iPads", "laptops", "camcorders", "digital cameras", "clickers", "USB microphones", "projectors", "graphing calculators"}; 
PImage myImage;
PImage myImage2;

void setup() {
  size(800, 600) ; 

myImage = loadImage("OOPMilner.jpg");
myImage2 = loadImage("OOPMilner2.jpg");
frogPos = new PVector(width/2, height/2);
myCars = new ArrayList();

  for (int i = 0 ; i < 8 ; i++) {
    myCars.add(new Car()) ;
  }
}


void draw() {
  myCounter = myCounter - 1;
  if (myCounter < 0) {
 myState = myState + 1;
if (myState > 8) {
 myState = 0;
} 
myCounter = 300;
} 
  background(114, 95, 78) ; 
  image(myImage2, 0, 0, width, height);
  //drawing and moving cars
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car tempCar = (Car) myCars.get(i);
    tempCar.display() ;
    tempCar.drive() ;
  
  switch(myState) {
   case 0:
  image(myImage, 0, 0);
break;

case 2:
image(myImage, 0, 0);
break;
  }
}
}
class Car {
  
  // attributes  
  color myColor ;
 PVector myPosition;
 PVector myVelocity;
 int mySize;
// PFont myFont;
 String myPhrase;
  
  // Constructor
  Car() {
    myVelocity = new PVector(random(-2, 2), random(-2, 2));
    myPosition = new PVector(random(width), random(height));
    myColor = color(random(230), random(222), random(240)) ;
    mySize = int(random(40, 100));
    myPhrase = myStrings[int(random(8))];
  }
  
  // Methods
  void display() {
    // this is the part I will change later!!!!
    fill(myColor) ; 
    textSize(mySize);
    text(myPhrase, myPosition.x, myPosition.y) ;
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


