
/* @pjs font="Montaga-Regular.ttf" */

ArrayList myCoins ;

PImage spriteR;
PImage spriteL;
PImage spriteRwings;
PImage spriteLwings;
PImage spriteOriginal;
PImage direction;
PImage myBackground;
PFont mont;

int myState=0;

PVector spritePos;

void setup() {

  size(1260, 264) ;
  noStroke();
  mont=createFont("Montaga-Regular.ttf", 50);
  textFont(mont);
  myBackground=loadImage("8bit-backdrop.png");
  spriteR=loadImage("spriteR.png");
  spriteL=loadImage("spriteL.png");
  spriteRwings=loadImage("spritewings.png");
  spriteLwings=loadImage("sprite2wings.png");
  direction=loadImage("directions.png");
  spritePos = new PVector(width/2, height/2) ;

  spriteOriginal=spriteRwings;  

  myCoins = new ArrayList() ; 

  for (int i = 0 ; i < 20 ; i++) {
    myCoins.add(new Coin()) ;
  }
}


void draw() {

  switch (myState) {
  case 0:
    //splash screen 
    image (myBackground) ;
    fill(0);
    image(direction, 1200, 0);
    textSize(50);
    text("Coin Catch", 510, 70);
    textSize(20);
    text("press the mouse to begin", 520, 100);
    text("Controls:", 30, 30);
    textSize(15);
    text("Press the right arrow to move right", 130, 30);
    text("Press the left arrow to move left", 130, 50);
    text("Press the up arrow to move up", 130, 70);
    text("Press the down arrow to move down", 130, 90);
    break;
  case 1: 
    // play game
    background(myBackground);
    image(direction, 1200, 0);
    image(spriteOriginal, spritePos.x, spritePos.y) ;
    for (int i = 0 ; i < myCoins.size() ; i++) {   
      Coin tempCoin = (Coin) myCoins.get(i) ; 
      tempCoin.display() ;
      tempCoin.drive() ;
      float d=(tempCoin.pos).dist(spritePos);
      if (d<tempCoin.space) {
        tempCoin.alive=false;
      }
    }

    for (int i = 0 ; i < myCoins.size() ; i++) {
      Coin tempCoin = (Coin) myCoins.get(i) ;
      if (tempCoin.alive==false) {
        myCoins.remove(i);
      }
    }

    if (myCoins.size()==0) {
      myState=2;
    }   
    break;  
  case 2:
    fill(0);
    textSize(50);
    text("You Won!", 510, 70);
    textSize(20);
    text("press the mouse to restart", 510, 100);

    break;
  }
}


void keyPressed() {
  switch(keyCode) {
  case 37: // left arrow
    spritePos.x = spritePos.x - 15 ;
    
    if (spritePos.y<170) {
      spriteOriginal=spriteLwings;
    }
      else {
        spriteOriginal=spriteL;
      }
    break ; 

  case 38: // up
    spritePos.y = spritePos.y - 15 ;
    
    if (spritePos.y<170) {
      spriteOriginal=spriteLwings;
    }
      else {
        spriteOriginal=spriteL;
      }
      
    break ;

  case 39: // right
    spritePos.x = spritePos.x + 15 ;

    if (spritePos.y<170) {
      spriteOriginal=spriteRwings;
    }
      else {
        spriteOriginal=spriteR;
      }
      
    break ;

  case 40: // down
    spritePos.y = spritePos.y + 15 ; 
    
    if (spritePos.y<170) {
      spriteOriginal=spriteLwings;
    }
      else {
        spriteOriginal=spriteL;
      }
      
    break ;
  }
}

void mousePressed() {
  if (myState==0) {
    myState=1;
  }

  if (myState==2) {
    for (int i = 0 ; i < 20 ; i++) {
      myCoins.add(new Coin()) ;
    }

    myState=1;
  }
}




class Coin {

  // attributes  
  PVector vel ; 
  PVector pos ;
  PImage coin;
  float space;
  boolean alive;

  // PVector myPosition.z ;

  // Constructor
  Coin() {
    vel = new PVector(random(-2, 2), random(-2, 2)) ;
    pos = new PVector(random(width), random(height)) ; 
    coin=loadImage("coin.png");
    space=(20);
    alive=true;
  }

  // Methods
  void display() {
    fill(0) ; 
    image(coin, pos.x, pos.y, space, 20) ;
  }

  void drive() {
    pos.add(vel) ;
    if (pos.x > width) {
      pos.x = 0 ;
    }
    if (pos.x<0) {
      pos.x=width;
    }
    if (pos.y>height) {
      pos.y=0;
    }
    if (pos.y < 0) {
      pos.y=height;
    }
  }
}



