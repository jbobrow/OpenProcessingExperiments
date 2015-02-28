
/* @pjs font="Sintony-Bold.ttf" ; */

int myCtr ; 
 
int myCtr1 ;

int myCtr2 ;

int x = 550 ;

PImage img;

PImage cld;

PImage cld2;

PImage pig;

PFont myFont ;

int myState = 0 ;

ArrayList myPigs ;

float helix ;
float heliy ;

void setup() {
  
  size (500, 500) ;
  
  background( #82E5F7 ) ;
  
  img = loadImage("helicopter.png");
  
  cld = loadImage("cloud.png");
  
  cld2 = loadImage("cloud2.png");
  
  pig = loadImage("pig.png");
  
 myPigs = new ArrayList() ;
 
  myFont = createFont("Sintony-Bold.ttf", 30) ;
  
  textFont(myFont, 30) ;
  
  // to clear your arrayList, myPigs.clear() ?????
  
 myCtr = 2*60 ;
 
 myCtr1 = 2*80 ;
 
 myCtr2 = 2*80 ;
  
  
  
  
 
}


void draw() {
  
  switch(myState) {
  
  case 0 :
  
  background(#82E5F7) ;
  
  image(cld, x, 100 , 100, 65);
  
  image(cld2, x-130, 300 , 100, 65);
  
  fill(100);
  text("Press SPACEBAR to begin", 30, 50, 200, 1000 ) ;
  
  x = x - 5 ;
  
  if (x < -100 ) {
  x = 650 ;
  }
  
  break;
  
  case 1 :
  
  background(#82E5F7) ;
  
  image(cld, x, 100 , 100, 65);
  
  image(cld2, x-130, 300 , 100, 65);
  
   fill(100);
  text("Level 1 : Training", 30, 50, 200, 1000 ) ;

  
  imageMode(CENTER) ;
  
  helix = height-400 ;
  
  heliy = width/2 ;  
  
  image(img, helix, heliy, 160, 65);
  
   x = x - 5 ;
  
  if (x < -100 ) {
  x = 650 ;
  }
  
  myCtr-- ;
    if (myCtr < 0) {
      myState = 2 ; 
      myCtr = 10 ; 
    }
 
  
  break ;
  
  case 2 :
  
  background(#82E5F7) ;
  
  image(cld, x, 100 , 100, 65);
  
  image(cld2, x-130, 300 , 100, 65);
  
  fill(100);
  text("Use Up, Down, Left, and Right to avoid Pigs", 30, 20, 250, 1000 ) ;
  
  imageMode(CENTER) ;
  
  helix = height-400 ;
  
  heliy = width/2 ;  
  
  image(img, helix, heliy, 160, 65);
  
   x = x - 5 ;
  
  if (x < -100 ) {
  x = 650 ;
  }
  
  myCtr1-- ;
    if (myCtr1 < 0) {
      myState = 3 ; 
      myCtr1 = 10 ; 
    }

  break ; 
  
  case 3 :
  
   for (int i = 0 ; i < 1 ; i ++) {
   myPigs.add(new Pig());
  }
  
  myState = 4 ;
  
  break ;
  
  case 4 :
  
  playPigs() ;
  
  break ;
  
  case 5 :
  
    background(#82E5F7) ;
  
  image(cld, x, 100 , 100, 65);
  
  image(cld2, x-130, 300 , 100, 65);
  
   fill(100);
  text("Survive the Invasion!!!", 30, 50, 200, 1000 ) ;

  
  imageMode(CENTER) ;
  
  helix = height-400 ;
  
  heliy = width/2 ;  
  
  image(img, helix, heliy, 160, 65);
  
   x = x - 5 ;
  
  if (x < -100 ) {
  x = 650 ;
  }
  
  myCtr2-- ;
    if (myCtr2 < 0) {
      myState = 6 ; 
      myCtr2 = 10 ; 
    }
    
    break;
    
    case 6 :
    //loading more pigs
    
    for (int i = 0 ; i < 6 ; i ++) {
   myPigs.add(new Pig());
  }
    
    myState = 7 ;
    
    break ;
    
    case 7: 
    
    playPigs() ;
    
    
    break ;
    
    case 9:
    
     background(#82E5F7) ;
  
    image(cld, x, 100 , 100, 65);
  
    image(cld2, x-130, 300 , 100, 65);
  
    fill(100);
    text("MISSION FAILED", 30, 50, 250, 1000 ) ;
  
    x = x - 5 ;
  
    if (x < -100 ) {
    x = 650 ;
    }
    
    case 8 :
    
    background(#82E5F7) ;
  
    image(cld, x, 100 , 100, 65);
  
    image(cld2, x-130, 300 , 100, 65);
  
    fill(100);
    text("MISSION ACCOMPLISHED", 30, 50, 250, 1000 ) ;
  
    x = x - 5 ;
  
    if (x < -100 ) {
    x = 650 ;
    }
    
    break ;
  
  
 
  
  
    
  
}

}



void keyPressed() {
  
   if (keyCode == 39) {   //right
    helix = helix + 55 ;
  }
  
  if (keyCode == 37) {  //left
    helix = helix - 55 ;
}


if (keyCode == 38) {   //up
    heliy = heliy - 55 ;
  }
  
  if (keyCode == 40) {  //down
    heliy = heliy + 55 ;
}
  
  if (keyCode == 32) { 
  
  myState = myState + 1 ;  
   
  }
 

  
}
  
class Pig {
  
  PVector loc ;
  PVector vel ;
  boolean alive ;
  
  
  Pig() {
    
    loc = new PVector(random(250 , 500) ,random(height)) ;
    vel = new PVector(random( -2 , -1 ), 0 ) ;
    
    alive = true ;
    
}



void display() {
  
  image(pig, loc.x, loc.y, 70, 55);
  
}



void drive() {
  
  loc.add(vel) ;
  
  
 // if (loc.x < 0 ) {
    
//    loc.x = width ;
    
 // }
  
}
}

void playPigs() {
  
  imageMode(CENTER) ;
  
  background(#82E5F7) ;
  
  noStroke() ;
  
  image(cld, x, 100 , 100, 65) ;
  
  image(cld2, x-130, 300 , 100, 65) ;
  
// clouds moving
x = x - 5 ;  

if (x < -100 ) {
  x = 650 ;
}



  




for (int i = 0 ; i < myPigs.size() ; i ++ ) {
 Pig pig = (Pig) myPigs.get(i) ;
  pig.display() ;
  pig.drive() ;
  
   PVector heliLoc = new PVector(helix, heliy) ;
  float d = (pig.loc) .dist(heliLoc) ;
  
  if (d < 80)  {
  //  pig.alive = false ;
    //state change
    myState = 8 ;
  
}

if (pig.loc.x < 0 ) {
   pig.alive = false ;

}

}

for (int i = 0 ; i < myPigs.size() ; i ++ ) {
 Pig pig = (Pig) myPigs.get(i) ;
 
 if (pig.alive == false) {
 myPigs.remove(i) ;
 }
 
}

  
//draw heli

image(img, helix, heliy, 160, 65);

if (myPigs.size() == 0) {
  myState = myState + 1 ;
}
   
  
  
}


