
/*void keyPressed() {
  println(keyCode) ;

  switch(keyCode) {
    case 38:
    println("UP") ; 
    break; 
    
    case 39: 
    println("RIGHT") ;
    break ;
    
    case 40:
    println("DOWN") ; 
    break; 
    
    case 37:
    println("LEFT") ; 
    break ;
  }
}
*/
/* @pjs font="Frijole-Regular.ttf"; */
 
 
int myState = 0 ;
int y = 250 ;
int x = 280 ;
int z= 0;
 
//PImage sky ;
PImage snowboarder;
PImage left;
PImage right;
PImage snow ;
PFont sass ;
 
void setup() {
  size (600, 780);
  sass = createFont ("Frijole-Regular.ttf", 120) ;
  smooth() ;
 
  snow = loadImage("background.png") ;
  snowboarder = loadImage("snowboarder1.png");
  left = loadImage("snowboarderleft.png") ;
  right = loadImage("snowboarderright.png") ;
}
 
void draw() {
 
 
  textFont(sass) ;
  switch(myState) {
 
 
  case 0:
    image(snow, 0, 0);
    image(snowboarder, 130, 250);
    fill(255);
    textSize(30) ;
    text("Press the arrow keys", 50, 100) ;
    text("to steer the snowboarder!", 20, 130) ;
    break ;
 
  case 1:
    image(snow, 0, 0) ;
    image(snowboarder, 130, 250);
    break ;
 
  case 2:
    image(snow, 0, 0) ;
    image(snowboarder, 130, y-=4);
    if (y< -400 ) {
      myState =1 ;
      y = 240 ;
    }
    break;
 
  case 3:
    image(snow, 0, 0) ;
    image(left, x-=4, 250, width/1.9, height/1.9) ;
    if (x <-300) {
      myState = 1 ;
      x = 280 ;
    }
    break ;
 
  case 4:
    image(snow, 0, 0);
    image(right, x+=4, 250, width/1.9, height/1.9);
    if (x > width) {
      myState = 1 ;
      x = 280 ;
    }
    break ;
 
 case 5:
    image(snow, 0, 0) ;
    image(snowboarder, 130, y-=-4);
    if (y< -400 ) {
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
 
    case 37:
      myState = 3 ;
      break ;
 
    case 39:
      myState = 4 ;
      break;
      
    case 40:
    myState = 5 ; 
    break; 
    }
  }


