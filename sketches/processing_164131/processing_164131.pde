

ArrayList<Car> myCars;
int myState = 0 ;
PVector frogLocation ;
int score = 0;
Deadly spin = new Deadly();


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
   score = 0;
   background(0);
   fill(255);
   text("RoboTop", width/4, 50) ;
   fill(0, 230, 0);
   text("Catch the green tops to win!", width/3, 100);
   fill(175, 0, 0);
   text("If the red top hits you, you lose!", width/3, 495);
   
   pushMatrix();
   scale(.8);
   translate(275, 100);
   fill(0, 0, 100);
   rect(225, 10, 50, 100);
   fill(175, 0, 0);
   triangle(100, 100, 400, 100, 250, 300);
   quad(90, 110, 410, 110, 390, 80, 110, 80);
   fill(255);
   ellipse(215, 95, 30, 30);
   ellipse(285, 95, 30, 30);
   fill(0);
   ellipse(215, 95, 10, 10);
   ellipse(285, 95, 10, 10);
   fill(130, 0, 0);
   triangle(265, 100, 320, 80, 270, 80);
   triangle(235, 100, 180, 80, 230, 80);
   popMatrix();
   
   pushMatrix();
   scale(.5);
   translate(-50, 400);
   fill(0, 0, 230);
   rect(225, 10, 50, 100);
   fill(0, 150, 0);
   triangle(100, 100, 400, 100, 250, 300);
   quad(90, 110, 410, 110, 390, 80, 110, 80);
   fill(255);
   ellipse(215, 95, 30, 30);
   ellipse(285, 95, 30, 30);
   fill(0);
   ellipse(215, 85, 10, 10);
   ellipse(285, 105, 10, 10);
   popMatrix();
   
   pushMatrix();
   translate(0, 190);
   fill(100);
rect(225, 10, 50, 100);
fill(150);
triangle(100, 100, 400, 100, 250, 300);
quad(90, 110, 410, 110, 390, 80, 110, 80);
fill(255);
ellipse(215, 95, 30, 30);
ellipse(285, 95, 30, 30);
fill(0);
ellipse(215, 95, 10, 10);
ellipse(285, 95, 10, 10);
popMatrix();
   break ;
   
   case 1:
   //playing game
   game() ;
   break ;
   
   case 2:
   background(180);
   pushMatrix();
   translate(0, 190);
   fill(100);
rect(225, 10, 50, 100);
fill(150);
triangle(100, 100, 400, 100, 250, 300);
quad(90, 110, 410, 110, 390, 80, 110, 80);
fill(255);
ellipse(215, 95, 30, 30);
ellipse(285, 95, 30, 30);
fill(0);
ellipse(215, 95, 10, 10);
ellipse(285, 95, 10, 10);
popMatrix();
   fill(255);
   text("Congrats!", width/2, height/5);
   text("click to play again", width/3, height/2);
   break;
   
   case 3:
   background(100, 0, 0);
   fill(255);
   text("GAME      OVER", 205, 20);
   pushMatrix();
   translate(0, 100);
   fill(0, 0, 100);
   rect(225, 10, 50, 100);
   fill(175, 0, 0);
   triangle(100, 100, 400, 100, 250, 300);
   quad(90, 110, 410, 110, 390, 80, 110, 80);
   fill(255);
   ellipse(215, 95, 30, 30);
   ellipse(285, 95, 30, 30);
   fill(0);
   ellipse(215, 95, 10, 10);
   ellipse(285, 95, 10, 10);
   fill(130, 0, 0);
   triangle(265, 100, 320, 80, 270, 80);
   triangle(235, 100, 180, 80, 230, 80);
   popMatrix();
   break;
 }
  
  
}

void mousePressed() {
  if (myState == 0){
    myState = 1;
  }
  else{
    myState = 0;
  }
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
    alive = true ;
  }

  //methods
  void display() {
    //fill(myColor) ;
    //rect(location.x, location.y, wide, 25) ;
    //fill(0);
    //ellipse(location.x+5, location.y+28, 10, 10) ;
    //ellipse(location.x+(wide-5), location.y+28, 10, 10) ;
    pushMatrix();
    translate(location.x, location.y) ;
    fill(0, 150, 0);
    ellipse(0, 0, 50, 50);
    fill(myColor);
    ellipse(0, 0, 20, 20);
    popMatrix();
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

class Deadly {
  
  //attributes
  color myColor ;
  PVector location ;
  PVector velocity ;
  boolean kill ;
  
  //Constructors
  Deadly() {
    location = new PVector(random(width), (random(height) - 150)) ;
    velocity = new PVector(random(-3, 3), random(-3, 3));
    myColor = color(random(255), random(255), random(255));
    kill = false ;
    
  }
  //methods
  void display(){
    translate(location.x, location.y) ;
    //monster()
    fill(175, 0, 0);
    ellipse(0, 0, 75, 75);
    fill(0, 0, 100);
    ellipse(0, 0, 25, 25);
  }
  
  void drive(){
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
    float d = myCar.location.dist(frogLocation) ;
    if (d < 40){
      score++ ;
      myCar.alive = false ;
      
    }

  }
      
      pushMatrix();
      spin.display();
      popMatrix();
      spin.drive();
      
      float k = spin.location.dist(frogLocation);
      if (k < 40){
       spin.kill = true;
       myState = 3;
      } 
    
    

  
  //iterate thru car array and delete dead cars
  for (int i = 0 ; i < myCars.size() ; i++){
    Car thisCar = (Car) myCars.get(i) ;
    if (thisCar.alive == false) {
      myCars.remove(i) ;
    }
  }
  
  if (myCars.size() <= 0){
  myState = 2;
  for (int i = 0; i < 15; i++) {
    myCars.add(new Car());
    
  }  
  }
  
  
  fill(150) ;
  ellipse(frogLocation.x, frogLocation.y, 50, 50) ;
  fill(100);
  ellipse(frogLocation.x, frogLocation.y, 20, 20);
  fill(255) ;
  text(score, 10, 480) ;
}


