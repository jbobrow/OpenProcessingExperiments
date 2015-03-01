

/* @pjs preload="space.jpg, title.jpg, won.jpg" ; */ 
 




// int x ;
//Car myCar1 ; 

ArrayList<Car> myCars ; 
PVector frogLocation ;
int score = 0;
int myState = 0 ;
PImage space ;
PImage title ;
PImage won ;





void setup() {
  size(500, 500) ; 
  //  myCar1 = new Car() ;
 
space = loadImage("space.jpg");
title = loadImage("title.jpg");
won = loadImage("won.jpg");

  myCars = new ArrayList() ;

  for (int i = 0; i < 1; i++) {
    myCars.add(new Car()) ;
  }

  frogLocation = new PVector(width/2-20, height-100) ;
}

void draw() {
  background(100) ;
  switch(myState) {
  
case 0:
  background(100) ;
  image(title, 0, 0) ;
  //text("welcome to my game", width/2, height/2) ;
break ;
 

case 1:
  background(100) ;
  image(space, 0, 0);
  //text(" playing ", width/2, height/2) ;
  game();
break ;
  
case 2:
  background(100) ;
  image(won, 0, 0) ;
 //text("you won!", width/2, height/2) ;
break ;
  
  //case 3:
  //background(100) ;
  //ext("click to play again!", width/2, height/2) ;
  //break ;  
  
  }
  
  
}

void mousePressed() {
  // myState = (myState + 1) ;
   myState = (myState + 1) % 3 ;
  
}


void keyPressed() {
  //println(keyCode) ; 
  
  if (keyCode == 39) {
    frogLocation.x += 30 ;
  }
  
    if (keyCode == 37) {
    frogLocation.x -= 30 ;
  }
  
    if (keyCode == 38) {
    frogLocation.y -= 30 ;
  }
  
    if (keyCode == 40) {
    frogLocation.y += 30 ;
  }
  
  
  
}


class Car {

  // attributes
  PVector location ;
  PVector velocity ; 
  color myColor ;
  float wide ;  
  boolean alive ;
  // constructor(s) 
  Car() {

    location = new PVector(random(width), random(height)) ; 
    velocity = new PVector(random(-3, 3), random(-3, 3)) ;
    myColor = color(random(255), random(255), random(255)) ;
    wide = random(30, 50) ;
    alive = true ; 
    
  }

  // methods
  void display() {  // how it looks
    fill(myColor) ; 
    //rect(location.x, location.y, wide, 25) ;
    //text("hello", location.x, location.y+50) ;
    translate(location.x, location.y) ;
    //rect(0, 0, wide, 25);
    mosta() ;
    
  }

  void drive() {
    location.add(velocity) ; 

    if (location.x > width) {
      location.x = 0 ;
    }

    if (location.x < 0) {
      location.x = width ;
    }

    if (location.y > height) {
      location.y = 0 ;
    }

    if (location.y < 0) {
      location.y = height ;
    }
  }
}




 


void game() { 


  //itereate through car array
  for (Car myCar : myCars) {
    pushMatrix() ;
    myCar.display() ;
    myCar.drive() ;
    popMatrix() ;
    
    //test distance of car to frog
    
    PVector offset = new PVector(0, 0) ;
    PVector fixed = PVector.add(myCar.location, offset);
    float d = fixed.dist(frogLocation) ;
    if (d < 35) {
    //println(" boom! ") ;
    //score++ ;
    myCar.alive = false ;
    
    }
    
  }
  
 
  //iterate through car array and delete hit cars
  
  for (int i = 0 ; i < myCars.size() ; i++) {
    Car thisCar = (Car) myCars.get(i) ;
    if (thisCar.alive == false) {
      myCars.remove(i) ;
    }
  
    
     if (myCars.size() <= 0) {
    myState = 2 ;
    for (int i = 0; i < 1; i++) {
      myCars.add(new Car()) ;
    }
     }
    
}
  
    

  // make my frog
  fill(0, 255, 0) ; 
  pushMatrix() ; 
  translate(frogLocation.x, frogLocation.y) ;
  scale(.75) ;
  gmosta() ;
  popMatrix() ;
  
  
  //ellipse(frogLocation.x, frogLocation.y, 30, 30) ;
  // image(myImage, frogLocation.x, frogLocation.y) ;
  
  
  
  fill(255) ;
  //text(score, 10, 30) ;
  
}
void gmosta() {
//this is the pattern
//for (int y = 0 ; y < 30; y++) {
//for (int x = 0 ; x < 30 ; x++) {
  //ellipse(50*x, 50*y , 10, 10) ;
    //}
//}


  scale(.2) ;
  fill(0, 255, 0) ;
   triangle(220, 55, 250, 10, 280, 55) ;
   rect(60, 270, 80, 30) ;
   rect(350, 270, 90, 30) ;
   rect(195, 340, 30, 100) ;
   rect(275, 340, 30, 100) ;
   rect(175, 440, 50, 30) ;
   rect(275, 440, 50, 30) ;
   
   ellipse(250, 200, 300, 300) ;
  
  
  

  
   fill(255, 255, 255) ;
   ellipse(250, 145, 100, 100) ;
 
  
   fill(0) ;
   rect(214, 265, 75, 40);
   ellipse(250, 160, 50, 50) ;
   //rect(0, 470, width, 30) ; 
   fill(255, 255, 255) ;
   rect(232, 265, 40, 20);



}
 
void mosta() {
//this is the pattern
//for (int y = 0 ; y < 30; y++) {
//for (int x = 0 ; x < 30 ; x++) {
  //ellipse(50*x, 50*y , 10, 10) ;
    //}
//}


  scale(.2) ;
fill(255, 0, 0) ;
   triangle(220, 55, 250, 10, 280, 55) ;
   rect(60, 270, 80, 30) ;
   rect(350, 270, 90, 30) ;
   rect(195, 340, 30, 100) ;
   rect(275, 340, 30, 100) ;
   rect(175, 440, 50, 30) ;
   rect(275, 440, 50, 30) ;
   
   ellipse(250, 200, 300, 300) ;
  
  
  

  
   fill(255, 255, 255) ;
   ellipse(250, 145, 100, 100) ;
 
  
   fill(0) ;
   rect(214, 265, 75, 40);
   ellipse(250, 160, 50, 50) ;
   //rect(0, 470, width, 30) ; 
   fill(255, 255, 255) ;
   rect(232, 265, 40, 20);



}
 


