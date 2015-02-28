
/* @pjs font= "Font.ttf"; */


PImage Spaceship;
PFont myFont;
PImage galaxy;
ArrayList myCars ;
float SpaceshipX;
float SpaceshipY;
int myLevel = 0;
  
void setup() {
  size(500, 500) ;
    
  SpaceshipX = width - 340;
  SpaceshipY = height-170;
    
  Spaceship = loadImage("Spaceship.png");
  
   myFont = createFont("Font.ttf", 40);
   textFont(myFont);
    
  //center the rectange
  //imageMode(CENTER);
 
//galaxy = loadImage("galaxy.jpg");
  
  myCars = new ArrayList() ;
  
  for (int i = 0 ; i < 20; i++) {
    myCars.add(new Car()) ;
  }
}
  
  
void draw() {
  background(100) ;
  background(#FFFFFF);
  //image(galaxy, 0, 0, 500, 500) ;
   
    
    
  /*
        
      background(#5DB4FF);
      textFont (myFont, 35);
      //text("use the arrow keys left, right, up, and down, to move the Spaceship");
      image (galaxy, 0, 0, 500, 500);
      text("Avoid getting hit by an astroid!",width/2, height/2);
      
 */
    
   background(#FFFFFF) ;
   //image (galaxy, 0, 0, 500, 500) ;
   
//moves my droids
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
      
      
    PVector frogLoc = new PVector (SpaceshipX, SpaceshipY);
    float d = (car.location).dist(frogLoc);
      
      
      
    //distance of car to the object
    if (d < 50){
     println("BOOM! " + "car " +i);
     //score = score + 1;
     car.alive = false;
    }
      
  }
    
  //check to see the number of cars- possibly using states/levels
    
     
      
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
      
    //check if the car is alive
    if (car.alive == false){
      myCars.remove (i);
    }
      
      
      
  }
    
  //Load Spaceship image
  image (Spaceship, SpaceshipX, SpaceshipY, 200,200);
    
    
  textFont (myFont, 36);
  fill(#0D0B0B);
  text("Dodge The Asteroids!" ,10, 50);
  textFont(myFont, 22);
  text("use the arrows to move your spaceship!", 10,80);
  
  /*
  //draw my frog
  fill(0,150,0);
  */
  //rect(SpaceshipX, SpaceshipY, 40, 50);
    
    
      
}
  
  
void keyPressed(){
  //Shows the key code for the frogger game- codes always the same for any comp
 //println("key pressed: " + keyCode);
     
 if (keyCode == 39){
     SpaceshipX = SpaceshipX + 100;
   }
     
   if(keyCode == 37){
    SpaceshipX = SpaceshipX - 20;
   }
     
   if (keyCode == 40){
     SpaceshipY = SpaceshipY + 20;
   }
     
   if(keyCode == 38){
    SpaceshipY = SpaceshipY - 20;
   }
     
   //large jump
   if (keyCode == 32){
     SpaceshipY = SpaceshipY - 100;
   }
     
       
}
  
/*
  void keyReleased() {
    if (value == 0) {
      value = 255;
      } else {
      value = 0;
    }
  }
*/
PImage droid;
class Car {
    
  // attributes
  PVector location;
  PVector size;
  PVector velocity;
  color myColor ;
  boolean alive;
    
  //float x ;
  //float y ;
  //float v ;
  
    
  // constructor
  Car() {
    size = new PVector (random(30, 100),random(30, 100));
    location = new PVector (random(width), random(height)) ;
    velocity = new PVector (0, random(1,5));
    myColor = color(random(255), random(255), random(255)) ;
    alive = true;
    droid = loadImage("droid.png");
   }
    
    
  // methods
  void display() {
    image (droid,location.x,location.y, size.x, size.x);
    //fill(myColor) ;
    //ellipse(location.x, location.y, 50, 25) ;
  }
    
  void drive() {
    location.add(velocity);
    //location.x = location.x + velocity.x ;
    if (location.y > height) {
      location.y = 0 ;
    }
  }
    
    
}



