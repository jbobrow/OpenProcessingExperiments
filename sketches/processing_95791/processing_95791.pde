
/* @pjs font="Gabriela-Regular.otf"; */

ArrayList myCars;
PImage knight;
PImage scene;
PFont myFont;
float knightX;
float knightY;
int myLevel = 0;

void setup(){
  size (500,500);
  knightX = width -390;
  knightY = height -205;
  
  myFont = loadFont("Gabriela-Regular.otf", 35) ; 
  textFont (myFont);
  
  
  knight = loadImage ("knight.png");
  scene = loadImage("scene.jpg") ;
  
  myCars = new ArrayList () ;
  
  for (int i = 0 ; i < 20; i++) {
    myCars.add(new Car()) ;
}
}
void draw() {
  background (100) ; 
  image(scene, 0, 0,width, height);
  
  textFont (myFont, 24);
  text("Click to begin!",5,35 );
  text("Use the arrows to protect", 5,55);
  text("the castle!", 5, 75) ;
  
  // moves gators
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get (i) ;
    car.display() ;
    car.drive() ;
    
    PVector knightLoc = new PVector (knightX, knightY) ;
    float d = (car.loc).dist(knightLoc);
    
    if ( d < 30 ) {
      //println("BOOM!" + "car" + i);
      car.alive = false;
    }
}
for (int i = 0 ; i < myCars.size() ; i++){
  Car car = (Car) myCars.get (i) ;
  
  //check if car is alive
  if (car.alive == false) {
    myCars.remove (i);
  }
}
  //draw knight
  image (knight,knightX,knightY,200,200);

}
  
 void keyPressed() {
   //pringln("key pressed =" + keyCode);
   
    if (keyCode == 39) {
      knightX = knightX + 100;
    }
    if (keyCode == 37) {
      knightX = knightX - 20;
    }
    if (keyCode == 40) {
      knightY = knightY + 20;
    }
    if (keyCode == 38){
      knightY = knightY - 20 ;
    }
    
    if (keyCode == 32) {
      knightY = knightY - 100 ;
    }
 }



PImage gator;
class Car {
  // attributes
  PVector loc ;
  PVector size;
  PVector vel ;
  color myColor;
  boolean alive;
  
  //float x;
  //float y;
  //float v;
  
  //constructor 
  Car() {
    size = new PVector (random (50,200), random(50,200));
    loc = new PVector(random(0,200), random(0,500)) ; 
    vel = new PVector (random(1,3),0) ;
    myColor = color(random(255),random(255),random(255));
    alive = true ;
    gator = loadImage ("gata.png") ;
  }
  
  //methods
  void display() {
    image (gator, loc.x, loc.y, size.x, size.y) ;
    imageMode(CORNER);
    //fill(myColor) ;
    //ellipse(location.x,location.y,50,25) ;
    
  }
  
  void drive(){
    loc.add(vel) ;
    if ( loc.x > width) {
      loc.x = 0 ;
    }
}
}


