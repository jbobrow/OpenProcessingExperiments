
int myState = 0 ;
int y = 240 ;

PImage sky ;
PImage balloon;

void setup() {
  size (600, 700);
  smooth() ;

  sky = loadImage("sky.jpg") ;
  balloon = loadImage("balloon.png");
}

void draw() {
  switch(myState) {
  case 0:
    image(sky, 0, 0);
    image(balloon, 100, 300);
    fill(#000000);
    textSize(30) ;
    text("Press the UP arrow key", 20, 40) ;
    text("to help the balloon lift off!", 20, 80) ;
    break ;

  case 1:
    image(sky, 0, 0) ;
    image(balloon, 100, 300);
    break ;

  case 2:
    image(sky, 0, 0) ;
    image(balloon, 100, y-=4);
    if (y< 0 ) {
      myState =1 ;
      y = 240 ;
    }
    break;
    
    
    
  }
}

void keyPressed() {
  switch(keyCode) {
  case 38:
    myState = 2 ;
    break;
    
  
  }
}



