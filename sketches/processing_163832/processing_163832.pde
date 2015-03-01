
 // variables
//Car myCar1 ; 

ArrayList<Car> myCars;
int myState = 0 ;
PVector frogLocation ;
int score = 0;

void setup() {
  size(500, 500) ;
  //myCar1 = new Car() ;
  
  myCars = new ArrayList() ;
  
  
  for (int i = 0; i < 15; i++) {
    myCars.add(new Car());
    
  }
  frogLocation = new PVector(width/2, height-50) ;
}

void draw() {
   switch(myState) {
   case 0:
   background(0);
   text("Welcome to my game", width/3, height/2) ;
   break ;
   
   case 1:
   //playing game
   game() ;
   break ;
   
   case 2:
   background(200);
   text("click to play again", width/4, height/2);
   break;
 }
  
  
}

void mousePressed() {
  myState = (myState + 1) % 3 ;
}

void keyPressed() {
  
  switch(keyCode) {
   case 39:
   frogLocation.x += 20 ;
   break;
    
   case 38:
   frogLocation.y -= 20 ;
   break;
   
   case 37:
   frogLocation.x -= 20 ; 
   break;
    
   case 40:
   frogLocation.y += 20 ;
   break; 
  }
  //println(keyCode) ;
  
}
class Car {

  //attributes
  color myColor ;
  PVector location ;
  PVector velocity ;
  float wide ;
  boolean alive ;


  //Constructors
    Car() {
    location = new PVector(random(width), random(height)) ;
    velocity = new PVector(random(-3, 3), random(-3, 3));
    myColor = color(random(255), random(255), random(255));
    wide = random(.9, 1.6);
    alive = true ;
  }

  //methods
  void display() {
    //fill(myColor) ;
    //rect(location.x, location.y, wide, 25) ;
    //fill(0);
    //ellipse(location.x+5, location.y+28, 10, 10) ;
    //ellipse(location.x+(wide-5), location.y+28, 10, 10) ;
    translate(location.x, location.y) ;
    scale(wide) ;
    monster() ;
  }

  void drive() {
    location.add(velocity) ;
    
    if (location.x > width) {
      location.x = 0 ;
    }
    if (location.y > height) {
      location.y = 0 ;
    }
    if (location.x < 0) {
      location.x = width ;
    }
    if (location.y < 0) {
      location.y = height ;
    }
  }
}


void game() {
  background(50) ;
  
  //iterate through car array
  
  for (Car myCar : myCars) {
    pushMatrix() ;
    myCar.display() ;
    popMatrix();
    myCar.drive() ;
    
    //test distance of car to frog
    PVector offset = new PVector(65, 20) ;
    offset.mult(myCar.wide) ;  
    PVector fixed = PVector.add(myCar.location, offset);
    float d = fixed.dist(frogLocation) ;
    if (d < (myCar.wide * 25)){
      println("BOOM!") ;
      score++ ;
      myCar.alive = false ;
      
    }
  }
  if (score == 15){
    text("You win!", 225, 35);
  }
  
  //iterate thru car array and delete dead cars
  for (int i = 0 ; i < myCars.size() ; i++){
    Car thisCar = (Car) myCars.get(i) ;
    if (thisCar.alive == false) {
      myCars.remove(i) ;
    }
  }
  
  
  
  fill(0, 67, 0) ;
  ellipse(frogLocation.x, frogLocation.y, 20, 25) ;
  fill(255) ;
  text(score, 10, 480) ;
}
void monster(){
scale(.2) ;
fill(150) ;
rect(30, 20, 620, 115) ;
fill(255) ;
ellipse(300, 30, 40, 40) ;
ellipse(380, 30, 40, 40) ;
fill(0) ;
ellipse(300, 30, 10, 10) ;
ellipse(380, 30, 10, 10) ;
fill(150) ;
  quad(300, 65, 380, 65, 460, 140, 220, 140) ;
  rect(220, 80, 240, 120) ;
  fill(0, 0, 100, 30) ;
  triangle(225, 85, 225, 195, 340, 140) ;
  triangle(225, 85, 455, 85, 340, 140) ;
  triangle(455, 85, 455, 195, 340, 140) ;
  triangle(455, 195, 225, 195, 340, 140) ;
ellipse(340, 140, 70, 60) ;
}



