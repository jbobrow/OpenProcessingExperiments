
//You can't be everything to everyone, 
//but you can be everything to a few people. 
//Decide who these people are in your life 
//and treat them like royalty.

/* @pjs font="Tangerine_Regular.ttf"; */


int myState = 0 ;
PImage kids ;
PImage a ;
PImage b ;
PImage c ;
PImage d ;
PFont myFont ;
int x = 1000 ;


void setup(){
  size (1000, 800);
  
  kids = loadImage("1.jpg") ;
  a = loadImage("2.jpg") ;
  b = loadImage("3.jpg") ;
  c = loadImage("4.jpg") ;
  d = loadImage("5.jpg") ;
   myFont = createFont("Tangerine_Regular.ttf", 400);
}

void draw() {
  noStroke();
  smooth();
background(#000000);

 textFont(myFont, 150);

  switch(myState) {
    
    case 0:
    text("Click here to start", 200, 400) ;
    textSize(50);
    text("(continue clicking after words)",350, 450);
    break ;
    
     case 1:
    image(c, 50, 2); 
 textSize(225); 
fill(255,255,255,180); 
    text("You can't be everything to everyone,", x, 725) ;
    x=x-3;
  if (x < -1800) {
  x=1000;
  }
    break ;
    
     case 2:
     image(b, 50, 2);
     textSize(225); 
     fill(255,255,255,180); 
    text("but you can be everything to a few people.",  x, 725) ;
    x=x-3;
  if (x < -1800) {
  x=1000;
  }
    break ;
    
         case 3:
         image(a, 50, 2);
     textSize(225); 
     fill(255,255,255,180);
    text("Decide who these people are in your life",   x, 725) ;
    x=x-3;
  if (x < -2010) {
  x=1000;
  }
    break ;
    
         case 4:
           image(kids, 50, 10);
     textSize(225); 
     fill(255,255,255,180);
    text("and treat them like royalty.",   x, 725) ;
    x=x-3;
  if (x < -1800) {
  x=1000;
  }
    break ;
    
         case 5:
    image(d, 50, 2);
    break ;
    
             case 6:
        textSize(150) ;
        text("el fin", 700, 650);
    break ;
    
        case 7:
    break ;
    
  }
  
}

void mousePressed() {
  
 myState = myState + 1 ;
 if (myState > 7) {
   myState = 0;
 }
  
}


