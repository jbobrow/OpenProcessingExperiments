

/** This is a study for a data visualization mechanism 
/* with lots of modifiable parameters that I probably will not use and am not using now...
/* I am basically testing out my openprocessing classroom
/* thank you...
**/

float easing; // Size of each step along the path
PFont myFont ; 

Bar bar ;

void setup() {
  size(200, 300);
  background(0);
  noStroke();

  myFont = loadFont("Candara-48.vlw", 48) ;

  frameRate(24) ; 
  
/*
   Bar(PVector StartingLocation, 
       PVector TargetLocation, 
       color aColor, 
       int WhatShape (0 = 
       int hD)
*/

  bar = new Bar(new PVector(20, 20, 0), new PVector(20, 200, 0), color(255, 0, 0), 0, 1) ;

  bar1 = new Bar(new PVector(40, 20, 0), new PVector(40, 150, 0), color(0, 255, 0), 1, 1) ;

  bar2 = new Bar(new PVector(60, 20, 0), new PVector(60, 340, 0), color(0, 0, 255), 2, 1) ;

  bar3 = new Bar(new PVector(80, 20, 0), new PVector(80, 140, 0), color(0, 255, 255), 3, 1) ;

  bar4 = new Bar(new PVector(100, 20, 0), new PVector(1000, 70, 0), color(255, 0, 255), 4, 1) ;

  easing = 0.08;
}

void draw() {
  // Fade the background
//  fill(0, 1);
//  rect(0, 0, width, height);


  bar.deploy() ;
  bar1.deploy() ;
  bar2.deploy() ;
  bar3.deploy() ;
  bar4.deploy() ;

  fill(0) ;

//  textFont(myFont) ; 
//  text("hello", 30, 30) ;

}

// guy walks into a bar

class Bar {

  PVector location ;
  PVector targetLocation ;
  color myC ;
  int whatShape ; 
  int horizDirection ;

  Bar(PVector myLoc, PVector tLoc, color aColor, int ws, int hD) {
    location = new PVector(0, 0, 0) ;
    targetLocation = new PVector(0, 0, 0) ;
    myC = aColor ; 
    whatShape = ws ;
    horizDirection = hD ;

    location.set(myLoc) ;
    targetLocation.set(tLoc) ;
  }

  void deploy() {

    // If the current position is more than 1 pixel away from target  
    println(location.dist(targetLocation)) ; // (dist(location.x, location.y, targetLocation.x, targetLocation.y)) ;

    if (location.dist(targetLocation) > 1.0) {
      // Update the current position towards the target position

      if (horizDirection == 1) {
        location.y += (targetLocation.y - location.y) * easing;
      } 
      else {
        location.x += (targetLocation.x - location.y) * easing;
      }
    }




    fill(myC);
    println(location) ;


    switch(whatShape) {

    case 0 : // 1 standard rectangular bar spanning the length
      rect(location.x, 20, location.x, location.y) ; 
      break ;

    case 1 :  // dots
      ellipse(location.x, location.y, 20, 10) ;
      break ; 

    case 2 :
      rect(location.x, location.y, 20, 10) ;
      break ; 

    case 3 :
      int ty = 20 ;
      while (ty < location.y) {

        rect(location.x, ty, 10, 10) ;
        ty = ty + 12 ;
      } 
      ;
      break ;
    }
  }
}



