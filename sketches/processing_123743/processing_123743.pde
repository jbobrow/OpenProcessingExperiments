
/* @pjs font = "PressStart2P.ttf"; */

int myState = 0;
int time ;
int wait = 1000;
boolean collision ;
boolean splat = false ;

ArrayList myGrandmas ;
ArrayList myMans ;
ArrayList myWomans ;
ArrayList myShelves ;

PFont type ;
PImage lot ;
PImage floor ;

///player//// is controlled by keypress
float playerX ;////set later in draw
float playerY ;
float playerW = 39;
float playerH = 76;
//PVector playerStart ;
float playerStartX ;
float playerStartY ;

PVector playerPos ;
PVector playerSize ;

PImage PU ;
PImage PD ;
PImage PR ;
PImage PL ;
PImage player ;

////shelves
PImage S1 ;
PImage S2 ;
PImage S3 ;
PImage S4 ;
PImage S5 ;
PImage S6 ;

///shelf is static in the enviorment

PVector shelfSize ;
PVector shelfSpot ;
float shelfLocationX = 168.0 ;
float shelfLocationY = 437.0 ;
float shelfWidth = 332.0 ;
float shelfHeight = 493.0 ;



void setup() {
  time = millis() ;///storing the current time
  size(500, 600);
  smooth () ;
  collision = false ;
  type = createFont("PressStart2P.ttf", 12) ;
  lot = loadImage("parking-lot.png") ;
  floor = loadImage("floor.png") ;
  PD = loadImage("PL-D.png") ;
  PU = loadImage("PL-U.png") ;
  PL = loadImage("PL-L.png") ;
  PR = loadImage("PL-R.png") ;
  S1 = loadImage("shelf-1.png") ;
  S2 = loadImage("shelf-2.png") ;
  S3 = loadImage("shelf-3.png") ; 
  S4 = loadImage("shelf-4.png") ;
  S5 = loadImage("shelf-5.png") ;
  S6 = loadImage("shelf-6.png") ;



  playerPos = new PVector(0.0, 0.0) ;
  // println("Player pos = "+ playerPos) ; 

  playerStartX = width/2 ;
  playerStartY = 550 ; 
      playerPos.set(playerStartX, playerStartY, 0) ;
  //playerStart = new PVector(width/2, 550) ; // don't use this 

  playerSize = new PVector(playerW, playerH) ;
  player = PU ;

  shelfSpot = new PVector(shelfLocationX, shelfLocationY) ;
  shelfSize = new PVector(shelfWidth, shelfHeight) ;

  myGrandmas = new ArrayList() ;
  for ( int i = 0 ; i < 3; i++ ) {
    myGrandmas.add(new Grandma()) ;
  }//endgrandmafor

  myMans = new ArrayList() ;
  for ( int i = 0 ; i < 6; i++ ) {
    myMans.add(new Man()) ;
  }//endmanfor

  myWomans = new ArrayList() ;
  for ( int i = 0 ; i < 4; i++ ) {
    myWomans.add(new Woman()) ;
  }//endwomanfor

  myShelves = new ArrayList() ;
  for ( int i = 0 ; i < 6; i++ ) {
    myShelves.add(new Shelf(i)) ;
  }//endshelffor
}/////endsetup


void draw () {
  imageMode(CENTER) ;
  //println(playerStart) ; 

  switch(myState) {

    ////////splash screen///////
  case 0:

    textFont(type, 12) ;
    image(lot, width/2, height/2) ;
    textAlign(CENTER, CENTER) ;
    ///title///
    textSize(31) ;
    fill(255) ;
    text("BLACK FRIDAY", width/2, height/2-130);
    fill(255, 0, 0) ;
    textSize(32) ;
    text("BLACK FRIDAY", width/2, height/2-130);
    fill(255) ;
    textSize(12) ;
    text("Lower Prices at a Higher Cost", width/2, height/2-100);
    textSize(10) ;
    fill(255, 0, 0) ;
    text("Run here to Start Game!", width/2, height/2-65);
    //title//
    //directions//
    textSize(8) ;
    fill(255) ;
    text("Use Arrows to Move", width/2, height/2-50);
    //    playerX = playerStart.x ;
    //    playerY = playerStart.y ;
    image(player, playerPos.x, playerPos.y);

    if (playerPos.y<300) {
      myState = 1 ;
    }


    break;

  case 1://///directions

    background(0);
    fill(255);
    textAlign(CENTER, CENTER) ;
    textSize(14) ;
    text("RUN OVER THE OTHER SHOPPERS", width/2, height/2-150);
    text("TO GET THE BEST PRICES", width/2, height/2-120);
    fill(255,0, 0);
     text("AVOID SHELVES OR LOSE!", width/2, height/2-50);
     image(PU, width/2, height/2+50);
     fill(255);
     textSize(12) ;
     text("Use Arrow Keys to Move", width/2, height/2+175);
    fill(255, 0, 0) ;
    textSize(14) ;
    text("CLICK TO START!", width/2, height/2+225);
    fill(255, 0, 0) ;



    break ;

  case 2:

    //////this is where the game is played/////
    image(floor, width/2, height/2) ;
    //shelves//
    /*    image(S1, 100, 125) ;
     image(S2, 250, 125) ;
     image(S3, 400, 125) ;
     image(S4, 140, 325) ;
     image(S5, 360, 325) ;
     imageMode(CORNERS) ;
     image(S6, shelfLocationX, shelfLocationY, shelfWidth, shelfHeight) ;
     
     imageMode(CENTER);
     */

    //  imageMode(CORNERS) ;
    rectMode(CORNERS) ;



    // see how many things are left in the game
    if (myGrandmas.size() == 0 && myMans.size() == 0 && myWomans.size() == 0) {
      myState = 3;
    }//ifend


    // shelves // 

    for (int i = 0 ; i < myShelves.size() ; i++) {
      Shelf tempShelf = (Shelf) myShelves.get(i) ; 
      tempShelf.display() ;

      if (((abs(playerPos.x-tempShelf.pos.x)) < (tempShelf.S.width/2+playerW/2)) && ((abs(playerPos.y-tempShelf.pos.y)) < (tempShelf.S.height/2 + playerH/2))) {
        //   println("boom!! with shelf "+ i) ; 
        myState = 4 ;
      }
    }//for



    //grandma//

    for (int i = 0 ; i < myGrandmas.size() ; i++) {
      Grandma tempGrandma = (Grandma) myGrandmas.get(i) ;
      tempGrandma.display() ;
      tempGrandma.drive() ;

      float d = (tempGrandma.pos).dist(playerPos) ;
      if (d < tempGrandma.wide) {
        if (millis() - time >= wait) {
          time = millis();//also update the stored time
          splat = true ;
          tempGrandma.death() ;
        }//iff
        tempGrandma.alive = false ;
      } //if
    }//for

    for (int i = 0 ; i < myGrandmas.size() ; i++) {
      Grandma tempGrandma = (Grandma) myGrandmas.get(i) ;
      if (tempGrandma.alive == false) {
        myGrandmas.remove(i) ;
      }//if
    }//for


    //Man//

    for (int i = 0 ; i < myMans.size() ; i++) {
      Man tempMan = (Man) myMans.get(i) ;
      tempMan.display() ;
      tempMan.drive() ;

      float d = (tempMan.pos).dist(playerPos) ;
      if (d < tempMan.wide) {
        if (millis() - time >= wait) {
          time = millis();//also update the stored time
          splat = true ;
          tempMan.death() ;
        }//iff
        tempMan.alive = false ;
      } //if
    }//for

    for (int i = 0 ; i < myMans.size() ; i++) {
      Man tempMan = (Man) myMans.get(i) ;
      if (tempMan.alive == false) {
        myMans.remove(i) ;
      }//if
    }//for
    ///endof man///


    ///woman///


    for (int i = 0 ; i < myWomans.size() ; i++) {
      Woman tempWoman = (Woman) myWomans.get(i) ;
      tempWoman.display() ;
      tempWoman.drive() ;

      float d = (tempWoman.pos).dist(playerPos) ;
      if (d < tempWoman.wide) {
        if (millis() - time >= wait) {
          time = millis();//also update the stored time
          splat = true ;
          tempWoman.death() ;
        }//iff
        tempWoman.alive = false ;
      } //if
    }//for

    for (int i = 0 ; i < myWomans.size() ; i++) {
      Woman tempWoman = (Woman) myWomans.get(i) ;
      if (tempWoman.alive == false) {
        myWomans.remove(i) ;
      }//if
    }//for
    ///endof womanman///


    // determine whether collision detected for our new location
    boolean collisionDetected = isCollidingPlayerShelf(playerX, playerY, 
    playerW, playerH, shelfLocationX, shelfLocationY, shelfWidth, shelfHeight);

    // draw player
    if ((collisionDetected == true)) {
      fill(255, 0, 0); // colored red on collision
      println("boom") ;
    }
    else {
      fill(255);     // white for no collision
    }

    image(player, playerPos.x, playerPos.y, playerW, playerH);

    if (playerPos.x == shelfWidth && playerPos.y == shelfHeight) {
      println("HIT");
    }

    break;

  case 3: ////winscreen
    playerPos.set(playerStartX, playerStartY, 0) ; // reset the player position
    
    textFont(type, 12) ;
    image(lot, width/2, height/2) ;
    fill(255);
    textAlign(CENTER, CENTER) ;
    textSize(18) ;
    text("YOU RAN EM ALL DOWN", width/2, height/2-150);
    text("GOOD JOB!", width/2, height/2-120);
    textSize(12) ;
    fill(255, 0, 0) ;
    text("Click to Play Again", width/2, height/2-60);

    break;

  case 4: ///lose screeen//
    playerPos.set(playerStartX, playerStartY, 0) ; // reset the player position

    textFont(type, 12) ;
    textSize(18) ;
    image(lot, width/2, height/2) ;
    fill(255, 0 , 0) ;
    text("YOU HIT A SHELF!", width/2, height/2-150) ;
    fill(255,0,0) ;
    text("YOU LOSE!", width/2, height/2-120) ;
    fill(255) ;
    textSize(12) ;
    text("Click to Play Again", width/2, height/2-60);

    break ;
  }////////end of switch states//////
}///////end of draw//////

void keyPressed() {
  //  println(keyCode) ;
  switch(keyCode) {

  case 37:///left

    player = PL ;
    playerPos.x = playerPos.x - 20 ;
    playerW = 76 ;
    playerH = 39 ;

    if (playerPos.x < -76) {
      playerPos.x = width + 76 ;
    }

    break ; 

  case 38: // up

    player = PU ;
    playerPos.y = playerPos.y - 20 ;
    playerW = 39 ;
    playerH = 76 ;

    if (playerPos.y <= -76) {
      playerPos.y = height + 76 ;
    }

    break ;

  case 39: // right

    player = PR ;
    playerPos.x = playerPos.x + 20 ;
    playerW = 76 ;
    playerH = 39 ;

    if (playerPos.x > width + 76) {
      playerPos.x =-76 ;
    }

    break ;

  case 40: // down 

    player = PD ;
    playerPos.y = playerPos.y + 20 ; 
    playerW = 39 ;
    playerH = 76 ;

    if (playerPos.y >= height + 76 ) {
      playerPos.y = -76 ;
    }

    break ;
  }//switch//
//  println(playerStart) ;
}//keypress//


void mousePressed() {


  if (myState == 1) {
    myState = 2 ;
    playerPos.set(playerStartX, playerStartY, 0) ; // reset the player position

  }

  if (myState == 2) {
    playerPos.set(playerStartX, playerStartY, 0) ; // reset the player position

  }

  if (myState == 3) { // winning state!
    image(lot, 0, 0) ;
       playerPos.set(playerStartX, playerStartY, 0) ; // reset the player position

    myState = 0 ;
    for (int i = 0 ; i < 3 ; i++) {
      myGrandmas.add(new Grandma()) ;
    }//for
    for (int i = 0 ; i < 6 ; i++) {
      myMans.add(new Man()) ;
    }//for
    for (int i = 0 ; i < 4 ; i++) {
      myWomans.add(new Woman()) ;
    }//for
    myShelves.clear() ;
    for ( int i = 0 ; i < 6; i++ ) {
      myShelves.add(new Shelf(i)) ;
    }//endshelffor
  }//if

  if (myState == 0) {
    myState = 1 ;
      playerPos.set(playerStartX, playerStartY, 0) ; // reset the player position

  }

  if (myState == 4) {  // losing state!
    playerPos.set(playerStartX, playerStartY, 0) ; // reset the player position

    myState = 1 ;
    myGrandmas.clear() ;
    myMans.clear() ; 
    myWomans.clear() ;
    myShelves.clear() ; 

    for (int i = 0 ; i < 3 ; i++) {
      myGrandmas.add(new Grandma()) ;
    }//for
    for (int i = 0 ; i < 6 ; i++) {
      myMans.add(new Man()) ;
    }//for
    for (int i = 0 ; i < 4 ; i++) {
      myWomans.add(new Woman()) ;
    }//for
    for ( int i = 0 ; i < 6; i++ ) {
      myShelves.add(new Shelf(i)) ;
    }//endshelffor
  }
}//mousepress


/********************************************************
 isCollidingPlayerShelf()
 
 params:
 playerX - center x coordinate for player
 playerY - center y coordinate for player
 width/height - for player
 shelfX - top left corner X coordinate
 shelfY - top left corner Y coordinate
 shelfWidth - width of rectangle
 shelfHeight - and the height
 
 ********************************************************/
boolean isCollidingPlayerShelf(
float playerX, 
float playerY, 
float playerW, 
float playerH, 
float shelfX, 
float shelfY, 
float shelfWidth, 
float shelfHeight)
{
  float playerDistanceX = abs(playerX - shelfX - shelfWidth/2);
  float playerDistanceY = abs(playerY - shelfY - shelfHeight/2);

  if (playerDistanceX > (shelfWidth/2 + playerW)) { 
    return false;
  }
  if (playerDistanceY > (shelfHeight/2 + playerH)) { 
    return false;
  }

  if (playerDistanceX <= (shelfWidth/2)) { 
    return true;
  }
  if (playerDistanceY <= (shelfHeight/2)) { 
    return true;
  }

  float cornerDistance_sq = pow(playerDistanceX - shelfWidth/2, 2) +
    pow(playerDistanceY - shelfHeight/2, 2);

  return (cornerDistance_sq >= pow(playerW, 2));
}

class Grandma {

  ///attributes/// 
  PVector vel ;
  PVector pos ;
  float wide ;
  boolean alive ;
  PImage G ;


  //////constructors////
  Grandma() {
   
    vel = new PVector(random(-1,-3), 0) ;
    pos = new PVector(random(40,600), random(200,400)) ;
    wide = 75 ;
    alive = true ;


    G = loadImage("H3-L.png") ;
  }///constructgrnandpa///


  ///////Methods//////
  void display() {
    fill(255, 0, 0);
    image(G, pos.x, pos.y, wide, 39) ;
    
  }///display///
  
  void drive() {
    pos.add(vel) ;
    
    if (pos.x > width) {
      pos.x = 0;
    }
   
    if (pos.x < 0) {
      pos.x = width;
      pos.y = pos.y + random(-150,150);
    }
 
   if (pos.y > height) {
      pos.y = pos.y - 200;
    }
   
    if (pos.y < 0) {
      pos.y = pos.y + 200;
    }
    
  }///drive//
  
  
  void death() {
    if (splat == true) {
      fill(255, 0, 0 ) ;
      noStroke() ;
      ellipse(pos.x, pos.y, 40, 40) ;
    }//if   
  }//death
} //ClassGrandma////

class Man {

  ///attributes/// 
  PVector vel ;
  PVector pos ;
  float wide ;
  boolean alive ;
  PImage M ;


  //////constructors////
  Man() {
   
    vel = new PVector(0,random(+1,+4)) ;
    pos = new PVector(random(100,400), 0) ;
    wide = 27 ;
    alive = true ;


    M = loadImage("H1-D.png") ;
  }///constructman///


  ///////Methods//////
  void display() {
    fill(255, 0, 0);
    image(M, pos.x, pos.y, wide, 18) ;
 
  }///display///
  
  void drive() {
    pos.add(vel) ;
    
    if (pos.y > height) {
      pos.y = 0;
      pos.x = pos.x + random(-150,150);
    }
    
    if (pos.x > width) {
      pos.x = pos.x - 200;
    }
   
    if (pos.x < 0) {
      pos.x = pos.x + 200;
    }
      
  }///drive//
  
  void death() {
    if (splat == true) {
      fill(255, 0, 0 ) ;
      noStroke() ;
      ellipse(pos.x, pos.y, 40, 40) ;
    }//if   
  }//death
  
} //ClassMan////

class Shelf {

  ///attributes///
  PVector pos ;
  PImage S ;
  PImage shelfArray[] = {
    S1, S2, S3, S4, S5, S6
  } 
  ;
  int num ;

  // Constructor 
  Shelf(int i) {
    pos = new PVector(random(width), i*80) ; // random(height-200)) ;  // don't want any shelves on bottom where we place the shopper at the beginning
    S = shelfArray[int(random(shelfArray.length))] ;
    num = i ;
  }


  // Methods
  void display() {
    image(S, pos.x, pos.y) ;
    //   text(num, pos.x, pos.y) ; // each shelf has a number - for debugging purposes
  }
}

class Woman {

  ///attributes/// 
  PVector vel ;
  PVector pos ;
  float wide ;
  boolean alive ;
  PImage W ;


  //////constructors////
  Woman() {
   
    vel = new PVector(random(2,3),0) ;
    pos = new PVector(0, random(100,500)) ;
    wide = 27 ;
    alive = true ;


    W = loadImage("H2-R.png") ;
  }///constructman///


  ///////Methods//////
  void display() {
    fill(255, 0, 0);
    image(W, pos.x, pos.y, wide, 44) ;
 
  }///display///
  
  void drive() {
    pos.add(vel) ;
    
    if (pos.x > width) {
      pos.x = 0;
      pos.y = pos.y + random(-100,100);
    }
    
     if (pos.y > height) {
      pos.y = pos.y - 200;
    }
   
    if (pos.y < 0) {
      pos.y = pos.y + 200;
    }
    
  }///drive//
  
  void death() {
    if (splat == true) {
      fill(255, 0, 0 ) ;
      noStroke() ;
      ellipse(pos.x, pos.y, 40, 40) ;
    }//if   
  }//death
} //ClassWoman////



