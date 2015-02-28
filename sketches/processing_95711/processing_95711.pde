
PImage basket;
PFont myFont;
PImage appleTree;
ArrayList myCars ;
float basketX;
float basketY;
int myLevel = 0;

void setup() {
  size(500, 500) ;
  
  basketX = width - 340;
  basketY = height-170;
  
  basket = loadImage("basket.png");
  
 myFont = loadFont("AppleCasual-200.vlw");
  
  //center the rectange
  //imageMode(CENTER);

  appleTree = loadImage("appletree.png");

  myCars = new ArrayList() ;

  for (int i = 0 ; i < 20; i++) {
    myCars.add(new Car()) ;
  }
}


void draw() {
  background(100) ; 
  background(#5DB4FF);
  image(appleTree, 0,0,500,500);
  
  
  /*
      
      background(#5DB4FF);
      textFont (myFont, 50);
      //text("use the arrow keys left, right, up, and down, to move the basket");
      image (appleTree, 0, 0, 500, 500);  
      text("Collect all of the apples in your basket",width/2, height/2);
    
 */
  
     background(#5DB4FF);
     image (appleTree, 0, 0, 500, 500);
  
 
//moves my apples
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ;
    
    
    PVector frogLoc = new PVector (basketX, basketY);
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
  
  //Load basket image
  image (basket, basketX, basketY, 200,200);
  
  
  textFont (myFont, 46);
  text("Collect all of the apples" ,10, 50);
  textFont(myFont, 32);
  text("use the arrows to move the basket", 10,80);

  /*
  //draw my frog
  fill(0,150,0);
  */
  //rect(basketX, basketY, 40, 50);
  
  
    
}


void keyPressed(){
  //Shows the key code for the frogger game- codes always the same for any comp
 //println("key pressed: " + keyCode); 
   
 if (keyCode == 39){
     basketX = basketX + 100;
   }
   
   if(keyCode == 37){
    basketX = basketX - 20; 
   }
   
   if (keyCode == 40){
     basketY = basketY + 20;
   }
   
   if(keyCode == 38){
    basketY = basketY - 20; 
   }
   
   //large jump
   if (keyCode == 32){
     basketY = basketY - 100;
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
PImage apple;
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
    apple = loadImage("apple.png");
   }
  
  
  // methods
  void display() {
    image (apple,location.x,location.y, size.x, size.x);
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


