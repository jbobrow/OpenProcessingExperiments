
/* @pjs preload="space1.jpg ; font = "game_over.ttf" */

ArrayList<Car> myCars;
PVector  frogLocation ;
int score = 0 ;
int myState = 0 ;
int myCounter = 20 * 60 ; // 20 seconds of gameing 
PImage space1 ; 
PImage rocket ;
PFont game_over ;


void setup() {
  size (736, 414) ;
  game_over = createFont("game_over.ttf", 220) ;

  // loading image
  space1 = loadImage("space1.jpg");
  rocket = loadImage("rocket.png") ;

  // my car1 = new car ();


  myCars = new ArrayList() ;

  for (int i = 0; i <15; i++) {
    myCars.add(new Car());
  }


  frogLocation = new PVector (width/2, height-50) ;
}

void draw() {



  switch (myState) {
  case 0:   // Spalsh welcome screen 
    background(#03A040) ;
    textFont( game_over, 100 ) ;
    text ("Rack up as many points!!!", width/5, height/3) ;
    break ;


  case 1:
    //playing the game
    game() ;
    println(myCounter) ;
    image (space1, width, height) ; 
    myCounter = myCounter - 1 ;
    if (myCounter < 0) {  //go to case 2
      myState = 2 ;
    } 
    break ;

  case 2:
    // game is ending
    background(#FC1212) ;
     textFont( game_over, 100 ) ;
    text ("GAME OVER", width/2, height/3);
    

    break ;
  }
}

void mousePressed() {
  myState = (myState +1) % 3
    ;
}


void keyPressed() {
  println(keyCode) ; 
  if (keyCode == 39 ) {
    frogLocation.x += 30 ;
  }

  if (keyCode == 37 ) {
    frogLocation.x -= 30 ;
  }

  if (keyCode == 38 ) {
    frogLocation.y -= 30 ;
  }

  if (keyCode == 40 ) {
    frogLocation.y += 30 ;
  }
}

/* @pjs preload="space1.jpg, rocket.png" ; font = "TechnoHideo.ttf",  */

void game() {
  
 image  (space1 , 0 , 0) ;


  //iterate through car array

  for (Car myCar : myCars) {
 pushMatrix () ;
    myCar.display() ;
    myCar.drive() ;
    popMatrix () ;
    //test distance of car to frog 
   // float d = (myCar.location).dist(frogLocation); 
PVector offset = new PVector(50, 50) ;
    PVector fixed = PVector.add(myCar.location, offset);
    float d = fixed.dist(frogLocation) ;
    if (d < 20)

    if (d < myCar.wide) {
      println( "BOOM!" ) ;
      score++ ;
      myCar.alive = false ;
    }
  }

  //iterate thru car array and delete
  for (int i = 0; i < myCars.size (); i++ ) {
    Car thisCar = (Car) myCars.get(i) ; 
    if (thisCar.alive == false) {
      myCars.remove(i) ;
    }

    //make the frog
    fill (0, 255, 0) ;
    //ellipse (frogLocation.x, frogLocation.y, 30, 30) ;
    image(rocket, frogLocation.x, frogLocation.y, 70, 70) ;

    fill(255) ;
    text(score, 10, 30) ;
  }
  
}
void monster () {

 
     fill(#F7CDCD) ; // SKULL
  arc(399, 169, 150, 100, PI, TWO_PI) ;
   
  fill(#1AD63D) ; // Main body thingy
 ellipse(300, 300, 150, 170) ;
   
  fill(#1AD63D) ; // Head of my amazing monster 
  ellipse(400, 215, 200, 100) ;

   
  fill(#8C6AF5) ; //Left foot of monster man
  arc(230, 385, 105, 105, PI, TWO_PI) ;
   
  fill(#8C6AF5) ; //right foot of monster man
  arc(380, 380, 115, 110, PI, TWO_PI) ;
   
  fill(0) ; //bottom of mouth
  rect(350, 242, 100, 20) ;
  
  fill(0) ; //bottom of mouth
  rect(350, 220, 100, 20) ;
   
  fill(#FF0808) ;  // SCARY TOOTH1
  triangle(427, 260, 437, 245, 449, 260) ;
  
  fill(#FF0808) ;  // SCARY TOOTH1
  triangle(407, 240, 417, 225, 429, 240) ;
  
 
    fill(#E815D0) ; //brain 1 lower
  arc(365, 170, 20, 20, PI, TWO_PI) ;
  
  fill(#E31014) ; //Brain 2 lower
  arc(385, 170, 20, 20, PI, TWO_PI) ;
  
  fill(#E815D0) ; //brin 3 lower 
  arc(405, 170, 20, 20, PI, TWO_PI) ;
  
  fill(#E31014) ; //brain 4 lower
  arc(426, 170, 20, 20, PI, TWO_PI) ;
   
   fill(#832ACE) ; //brain 5 upper
  arc(426, 160, 20, 20, PI, TWO_PI) ;
  
  fill(#832ACE) ; //brain 6 upper
  arc(403, 160, 20, 20, PI, TWO_PI) ;
   
   fill(#832ACE) ; //brain 7 upper
  arc(380, 160, 20, 20, PI, TWO_PI) ;
   
 
   

  
  fill(#FFF700) ;  //left eye
  ellipse(320, 180, 75, 75) ;
   
  fill(#FFF700) ;  // right eye
  ellipse(480, 180, 75, 75) ;
  
  
  fill(#FA0008) ;  //  left eye detail
  ellipse(320, 180, 20, 35) ;
  
  fill(#B614B7) ;  //  left eye detail
  ellipse(480, 180, 35, 20) ;
  
  fill(#FFE6CC);
ellipse(200, 250, 70, 30); // left hand

fill(#FFE6CC);
ellipse(420, 300, 100, 30); // right hand

}
class Car {

  //attributes 
  PVector location ;
  PVector velocity ;
  color myColor;
  float wide;
  boolean alive ;


  // Constructor
  Car () {

    location = new PVector(random(width), random(height) ) ;
    velocity = new PVector( random(-3, 3), random(-3, 3)) ;
    myColor = color(random(255), random(255), random(255)) ;
    wide = 50 ;
    alive = true ;
  }

  //methods
  void display() {
    fill (myColor) ;
   // rect( location.x, location.y, wide, 25) ;
   // text ( "Bad guy", location.x, location.y+50) ;
   
    translate (location.x, location.y) ;
    scale (.2, .2) ;
    monster () ;
  }

  void drive() {
    location.add(velocity) ;


    if (location.x > width) {
      location.x = 0 ;
    }
    if (location.x < 0) {
      location.x = width ;
    }
    if (location.x > height) {
      location.y = 0 ;
    }
    if (location.y < 0) {
      location.y = height ;
    }
  }
}



