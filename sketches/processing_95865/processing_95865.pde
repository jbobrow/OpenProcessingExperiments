
/* @pjs font = "UP.ttf"; */

int myState = 0;
PFont alien ;
PImage a ;
PImage b ;
PImage c ;
PImage d ;
PImage e ;

int myCtr = 5*30 ;
 
 
 
void setup() {
  size(700, 500) ;
  frameRate(30);
alien = createFont("UP.ttf", 45);
 a = loadImage("a.jpg");
b = loadImage("b.jpg");
 c = loadImage("c.jpg");
d = loadImage("d.jpg");
e = loadImage("e.jpg");

  myCtr = 5*30 ;
}
 
void draw() {
 
  switch(myState) {
   
      default:
    
    break ;
     
    case 0:
    image(a, 0, 0, 700, 500);
    textAlign(CENTER, CENTER);
    fill(#000000);
     textFont(alien, 60);
    text("Sometimes",   350, 450);
        
    myCtr-- ;
    if (myCtr< 0) {
    myState = 1 ;
    myCtr = 5*30 ;
  }
     
    break ;
     
    case 1:
     
 
    image(b, 0, 0, 700, 500);
 

    textAlign(CENTER, CENTER);
    fill(#07661A);
    textFont(alien, 60);
    text("The Night", 170, 50) ;
     
    myCtr-- ;
    if (myCtr< 0) {
    myState = 2 ;
    myCtr = 5*30 ;
    }
    break ;
     
     case 2:
     

    image(c, 0, 0, 700, 500);
 

   
    fill(#4F020A);
    textFont(alien, 60);
    text("Can Worry", 350, 50);
     
    myCtr-- ;
    if (myCtr< 0) {
    myState = 3 ;
    myCtr = 5*30 ;
    }
    break ;
    
       case 3:
     

    image(d, 0, 0, 700, 500);
 
 
     
    myCtr-- ;
    if (myCtr< 0) {
    myState = 4 ;
    myCtr = 5*30 ;
    }
    break ;
    
       case 4:
     
    background(80) ;
    image(e, 0, 0, 700, 500);
 
 
    
     
    myCtr-- ;
    if (myCtr< 0) {
    myState = 0 ;
    myCtr = 5*30 ;
    }
    break ;
    
 
 
  }
}



