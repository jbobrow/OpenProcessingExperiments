
/* @pjs preload="splash.png, orange1.png, purple2.png, green3.png, turq4.png, congrats.png, tryagain.png, nicescreen.png"; */
PImage screen1 ;
PImage screen2 ;
PImage screen3 ;
PImage screen4 ; 
PImage splashScreen ; 
PImage screen5 ;
PImage screen6 ; 
PImage screen7 ; 



int myState = 0 ;
int myNextState = 0 ;

void setup() {
  size(500, 500) ; 
  splashScreen = loadImage("splash.png") ;
  screen1 = loadImage("orange1.png") ;
  screen2 = loadImage("purple2.png") ; 
  screen3 = loadImage("green3.png") ; 
  screen4 = loadImage("turq4.png") ; 
  screen5 = loadImage("congrats.png") ; 
  screen6 = loadImage("tryagain.png") ; 
  screen7 = loadImage("nicescreen.png") ; 
  // screen2 = load
}

void draw() {

  switch(myState) {
  case 0 :
    image(splashScreen, -50, -30) ; 
    break ;

  case 1:
    background(0) ;
    image(screen1, -210, -7) ; 
    break ;

  case 2:
     background(0) ;
    image(screen2, -215, -5) ;
    break ;

  case 3: 
     background(0) ;
    image(screen3, -215, -5) ;
    break ;

  case 4:
    image(screen4, -215, -5) ; 
    break ;
    
    case 5: // congrats
        background(0) ; 
    image(screen5, -1, -1) ;
    break ; 

  case 10: // oops! Try again!
  background(0) ; 
    image(screen6, -1, -1) ; 
    //  image(oops, 0, 0) ; 
    break ;


  case 11: // awesome
  background(0) ; 
    image(screen7, -1, -1) ; 
    break ;
  }

//  fill(255) ; 
//  text(mouseX + ", " + mouseY, 400, 400) ;
}

void mouseReleased() {
  switch(myState) {
  case 0: //splash
 if (overRect(360, 425, 40, 30)) {
    myState = 1 ; 
 } 
    break ;
    

  case 1: // orange
    if (overCircle(180, 130, 100)) {
      myState = 11 ;
      myNextState = 2 ;
    } else {
      myState = 10 ;
      myNextState = 1 ;
    }
    break ;


  case 2: // purple 
    if (overCircle(170, 357, 100)) {
      myState = 11 ; // same
      myNextState = 3 ;  // change to the next number
    } else {
      myState = 10 ;  // same
      myNextState = 2 ; // change to same as above
    }
    break ;
    
    
    case 3: // green 
    if (overCircle(70, 80, 100)) {
      myState = 11 ; // same
      myNextState = 4 ;  // change to the next number
    } else {
      myState = 10 ;  // same
      myNextState = 3 ; // change to same as above
    }
    break ;
    
    case 4: // turq
    if (overCircle(200, 240, 100)) {
      myState = 11 ; // same
      myNextState = 5 ;  // change to the next number
    } else {
      myState = 10 ;  // same
      myNextState = 4 ; // change to same as above
    }
    break ;
    
    case 5:
    myState = 0 ; 
 
    break ; 
    
    
  case 10:
  case 11:
    myState = myNextState ;
    break ;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}


