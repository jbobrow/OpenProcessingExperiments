


ArrayList myCars ;
int x=0; 
int myState = 0 ; 
int myCtr ;
PImage red; 
PImage orange;
PImage yellow; 
PImage green; 
PImage blue;
PImage indigo;
PImage violet;
PImage world; 
PImage ro; 
PImage roy; 
PImage royg; 
PImage roygb; 
PImage roygbi; 
PImage roygbiv; 
PImage roygbiv2;
PImage red2; 
PImage roygbiv3; 
PImage roygbiv4; 
PImage roygbiv5; 
PImage roygbiv6; 
PImage roygbiv7; 
PImage world2; 
PImage world3; 

void setup() { 
  size (900,500); 
  myCars = new ArrayList() ;

  for (int i = 0 ; i < 20; i++) {
    myCars.add(new Car()) ;
  }
  
  red =loadImage ("red.png");
  orange = loadImage ("orange.png"); 
  yellow = loadImage ("yellow.png");
  green = loadImage ("green.png"); 
  blue = loadImage ("blue.png"); 
  indigo = loadImage ("indigo.png"); 
  violet = loadImage ("violet.png"); 
  world = loadImage ("world.png"); 
  ro = loadImage ("ro.png"); 
  roy = loadImage ("roy.png"); 
  royg = loadImage ("royg.png"); 
  roygb = loadImage ("roygb.png"); 
  roygbi = loadImage ("roygbi.png"); 
  roygbiv = loadImage ("roygbiv.png"); 
  roygbiv2 = loadImage ("roygbiv2.png"); 
  red2 = loadImage ("red2.png"); 
  roygbiv3 = loadImage ("roygbiv3.png"); 
  roygbiv4 = loadImage ("roygbiv4.png"); 
  roygbiv5 = loadImage ("roygbiv5.png"); 
  roygbiv6 = loadImage ("roygbiv6.png"); 
  roygbiv7 = loadImage ("roygbiv7.png");
  world2 = loadImage ("world2.png");  
  world3 = loadImage ("world3.png"); 

  myCtr = 30*3; 
}
void draw(){ 
  
  switch(myState){

  case 0:
  image (red, 0,0, width, height); 
    for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
 myCtr-- ;
    if (myCtr < 0) {
      myState = 1 ; 
      myCtr =30*3 ; }
    break; 
        
    
  case 1: 
  image (orange, 0,0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
  
myCtr-- ;
    if (myCtr < 0) {
      myState = 2 ; 
      myCtr = 30*3 ; }
  break; 
  
  case 2: 
 image (yellow, 0,0, width, height); 
   for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
    if (myCtr < 0) {
      myState = 3 ; 
      myCtr = 30*3 ; }
  break; 

case 3: 
image (green, 0,0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 4 ; 
      myCtr =30*3 ; }
break; 
  
  case 4: 
image (blue, 0,0, width, height);
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 5 ;
      myCtr = 30*3 ; }
break; 
 
 case 5: 
image (indigo, 0,0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 6 ; 
      myCtr = 30*3 ; }
break; 

case 6: 
image (violet, 0,0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 7 ; 
      myCtr = 30*3 ; }
break; 

case 7: 
image (red2, 0,0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 8 ; 
      myCtr = 30*3 ; }
  break; 

case 8: 
image (ro, 0,0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 9 ; 
      myCtr = 30*3 ; }
break;   

case 9: 
image (roy, 0,0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 10 ; 
      myCtr = 30*3 ; }
break; 

case 10: 
image (royg, 0,0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 11 ; 
      myCtr = 60*3 ; }
break; 

case 11: 
image (roygb, 0,0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 12 ; 
      myCtr = 30*3 ; }
break; 

case 12: 
image (roygbi, 0,0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 13 ; 
      myCtr = 30*3 ; }
break; 

case 13: 
image (roygbiv, 0,0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 14 ; 
      myCtr = 30*3 ; }
break; 

case 14: 
image (roygbiv2, 0,0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 15 ; 
      myCtr = 30*3 ; }
break; 

case 15: 
image (roygbiv3, 0,0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 16 ; 
      myCtr = 30*3 ; }
break; 

case 16: 
image (roygbiv4, 0,0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 17 ; 
      myCtr = 30*3 ; }
break; 

case 17: 
image (roygbiv5, 0,0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 18 ; 
      myCtr = 30*3 ; }
break; 

case 18: 
image (roygbiv6, 0,0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 19 ; 
      myCtr = 30*3 ; }
break; 

case 19: 
image (roygbiv7, 0,0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 20 ; 
      myCtr = 60*3 ; }
break; 

case 20: 
image (world, 0, 0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 21 ; 
      myCtr = 60*3 ; }
break; 

case 21: 
image (world2, 0, 0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 22 ; 
      myCtr = 60*3 ; }
break; 

case 22: 
image (world3, 0, 0, width, height); 
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
  }
myCtr-- ;
if (myCtr < 0) {
      myState = 0 ; 
      myCtr = 60*3 ; }
break; 



}
  
  }
  
 
class Car {
  
  // attributes
  float x ; 
  float y ;
  color myColor ; 
  float v ;

 
  
  // constructor
  Car() {
    x = random(width) ;
    y = random(height) ;
   v = random(-0.1, 0.1) ; 
    myColor = color(random (200, 250), random (200, 240), random (0, 30)) ;  
  }
  
  
  // methods
  void display() {
      noStroke(); 
    fill(myColor) ; 
    ellipse (x, y, random (7), random (7));  
  }
  
  void drive() {
    x = x + v ;
    if (x > width) {
      x = 0 ;
    }
    y = y + v; 
    if (y > height){ 
      y = 0; 
  }
  
  
}
}


