
/* @pjs font="DINNeuzeitGrotesk-BoldCond-Regular.otf" ; */

ArrayList myBars ;  // declare it


String thePhrases[] = {
  "Sustainability", "at Illinois State University", 
 "is an", "evolving process", "which enhances quality of life",  "meets economic, social, and environmental needs",
"of the present",  "without compromising resources for future generations."
} 
;


float easing; // Size of each step along the path

int myState = 0  ; 
int allDone = 1 ;

Bar bar ;
PFont theType ;
PImage theI ; 

void setup() {
  size(1920, 1080);
  background(0);
  noStroke();
  frameRate(24) ; 
  smooth() ; 

  theType = createFont("DINNeuzeitGrotesk-BoldCond-Regular.otf", 200) ; 
  theI = loadImage("milnerBiggerBlue.jpg") ; 
  myBars = new ArrayList() ;
    easing = 0.08;
    

  // add some elements

  for (int i = 0; i < thePhrases.length; i++) {
    myBars.add(new Bar(random(0, width), random(0, height), random(100, 300), 100*i+200, color(255, random(70,95)), thePhrases[i], theType, 2.3*(80-(thePhrases[i].length())))) ;
  }


}

void draw() {

  switch(myState) {

  case 0:  // the reloading state

 
 
    myState = 1 ; 

    break ; 

  
  
  case 1:
    image(theI, 0, 0) ; 
    allDone = 0 ; 

    for (int i = 0; i < myBars.size(); i++) {
      Bar bar = (Bar) myBars.get(i);
      bar.deploy() ;
      allDone = allDone + bar.notDone ;
    }

    if (allDone == 0) {
      myState = 0 ;
    } 

    break ;

  case 2:
    break ;
  }
  
}

// guy walks into a bar

class Bar {
  
  PVector location ;
  PVector targetLocation ;
  String myS ;
  color myC ;
  PFont theType ; 
  int typeSize ;
  int notDone ; 

  
  Bar(float myLocx, float myLocy, float tLocx, float tLocy, color aColor, String s, PFont ty, int ts) {
    location = new PVector(myLocx, myLocy, 0) ;
    targetLocation = new PVector(tLocx, tLocy, 0) ;
    myC = aColor ; 
    myS = s ; 
    theType = ty ;
    typeSize = ts ;
    notDone = 1 ; 
  
  }
  
  void deploy() {
    
      // If the current position is more than 1 pixel away from target  
 //     println(location.dist(targetLocation)) ; // (dist(location.x, location.y, targetLocation.x, targetLocation.y)) ;
      
  if (location.dist(targetLocation) > 1.0) {
    // Update the current position towards the target position
 //   x += (targetX - x) * easing;
    location.y += (targetLocation.y - location.y) * easing;
        location.x += (targetLocation.x - location.x) * easing;

  } else {
    notDone = 0  ; 
  } 
  // Draw an ellipse at the current position
  fill(myC);
  println(location) ;
//  ellipse(location.x, location.y, 20, 20);
textFont(theType, typeSize) ;
text(myS, location.x, location.y) ; 
//  rect(location.x, 20, location.x, location.y) ; 
  }
  
}
    


