
/* @pjs font="ufonts.com_gotham-light.ttf"; */

int myState = 0 ;
int x = 275 ;
int y = 240 ;

PImage background1 ;
PImage rocket_up ;
PImage rocket_right ;
PImage rocket_down ;
PImage rocket_left ;

PFont light ;

void setup() {
  size(600, 600) ;
  smooth() ;

  background1 = loadImage("space_background-01.png") ;
  rocket_up = loadImage("rocket_up.png") ;
  rocket_right = loadImage("rocket_right.png") ;
  rocket_down = loadImage("rocket_down.png") ;
  rocket_left = loadImage("rocket_left.png") ;
  
}

void draw() {
  background(255) ;
  fill(0) ;

  switch(myState) {
  case 0:
    image(background1, 0, 0);
    image(rocket_up, 275, 240);
    fill(255) ;
    textSize(24) ;
    text("Use the arrow keys", 200, 100) ;
    text("to make the rocket fly through space!", 100, 125) ;
    break ;

  case 1:
    image(background1, 0, 0);
    image(rocket_up, 275, 240);
    break ;

  case 2:
    image(background1, 0, 0);
    image(rocket_up, 275, y-=4);
    if (y < 0) {
      myState = 1 ;
      y = 240 ;
    }  
    break ;

  case 3:
    image(background1, 0, 0);
    image(rocket_right, x+=4, 240);
    if (x > width) {
      myState = 1 ;
      x = 275 ;
    }  
    break ;

  case 4:
    image(background1, 0, 0);
    image(rocket_down, 275, y+=4);
    if (y > height) {
      myState = 1 ;
      y = 240 ;
    }  
    break ;

  case 5:
    image(background1, 0, 0);
    image(rocket_left, x-=4, 240);
    if (x < 0) {
      myState = 1 ;
      x = 275 ;
    }
    break ;
  }
}

void keyPressed() {

  switch(keyCode) {
  case 38:
    myState = 2 ;
    break; 

  case 39: 
    myState = 3 ;
    break ;

  case 40:
    myState = 4 ;
    break; 

  case 37:
    myState = 5;
    break ;
  }
}



