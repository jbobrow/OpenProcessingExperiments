
/* @pjs font="Gudea-Regular.ttf"; */


int myState = 0 ;
int y = 240 ;
int x = 280 ;
int z= 0;

//PImage sky ;
PImage balloon;
PImage balloonleft;
PImage balloonright;
PImage night ;
PFont myFont ;

void setup() {
  size (600, 780);
  myFont = createFont ("Gudea-Regular.ttf", 120) ;
  smooth() ;

  night = loadImage("night.png") ;
  //sky = loadImage("sky.jpg") ;
  balloon = loadImage("balloon.png");
  left = loadImage("balloonleft.png") ;
  right = loadImage("balloonright.png") ;
}

void draw() {


  textFont(myFont) ;
  switch(myState) {


  case 0:
    image(night, 0, 0);
    image(balloon, 130, 170);
    fill(255);
    textSize(18) ;
    text("Press the arrow keys", 20, 40) ;
    text("to cruise the night!", 20, 60) ;
    break ;

  case 1:
    image(night, 0, 0) ;
    image(balloon, 130, 170);
    break ;

  case 2:
    image(night, 0, 0) ;
    image(balloon, 130, y-=4);
    if (y< -400 ) {
      myState =1 ;
      y = 240 ;
    }
    break;

  case 3:
    image(night, 0, 0) ;
    image(left, x-=4, 170, width/1.9, height/1.9) ;
    if (x <-300) {
      myState = 1 ;
      x = 280 ;
    }
    break ;

  case 4:
    image(night, 0, 0);
    image(right, x+=4, 170, width/1.9, height/1.9);
    if (x > width) {
      myState = 1 ;
      x = 280 ;
    } 
    break ;

   
    }
  }

  void keyPressed() {
    switch(keyCode) {
    case 38:
      myState = 2 ;
      break;

    case 37:
      myState = 3 ;
      break ;

    case 39:
      myState = 4 ;
      break;
    }
  }



