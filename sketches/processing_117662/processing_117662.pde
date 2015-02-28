
/* @pjs preload="dragon1.png,dragon2.png,dragon3.png,dragon4.png,dragon5.png; 
font="NewRocker-Regular.ttf"; */
 

int myState = 0 ;

PFont font1 ; //NewRocker

PImage photo1;
PImage photo2;
PImage photo3;
PImage photo4;
PImage photo5;

float x = 1800 ;  //text starting point
float x1 = 1350 ;
float x2 = 1350 ;
float x3 = 1350 ;
float x4 = 1350 ;

float y = -1500 ;  //text starting point
float y1 = -1000 ;
float y2 = -1000 ;
float y3 = -1000 ;
float y4 = -1000 ;


void setup() {
  size(960, 640) ; 
  
  photo1 = loadImage("dragon1.png");
  photo2 = loadImage("dragon2.png");
  photo3 = loadImage("dragon3.png");
  photo4 = loadImage("dragon4.png");
  photo5 = loadImage("dragon5.png"); 
  
  font1 = createFont("NewRocker-Regular.ttf", 200);
  textFont(font1, 150);
  
}


void draw() {
  
  textAlign(CENTER, CENTER) ;
  
  switch(myState) {
    case 0:
    background(photo1) ;
   
    textSize(20);
    fill(255) ;
    text("Click on image to advance to slide 2 >", y, 620) ;
    y = y + 1 ;  // speed of text
    
    textSize(150);
    fill(#e17c39, 200) ;
    text("TAIL OF THE DRAGON", x, 520) ;
    x = x - 2 ;  // speed of text
  
   
   /*if (x < -800) {
   myState = 1;
   x = 1800 ; //reset time counter
  
   
}*/
    break ;
    
    case 1:
    background(photo2) ; 
    
    textSize(20);
    fill(255) ;
    text("Click on image to advance to slide 3 >", y1, 620) ;
    y1 = y1 + 1 ;  // speed of text
    
    textSize(150);
    fill(#e17c39, 200) ;
    text("318 Curves...", x1, 520) ;
     x1 = x1 - 2;
  
   /*if (x1 < -400) {
    myState = 2 ;
    x1 = 1350 ; //reset time counter
    
}*/
    break ;
    
    case 2:
    background(photo3) ;
    
    textSize(20);
    fill(255) ;
    text("Click on image to advance to slide 4 >", y2, 620) ;
    y2 = y2 + 1 ;  // speed of text
    
    textSize(150);
    fill(#e17c39, 200) ;
    text("in 11 Miles!", x2, 520) ;
    x2 = x2 - 2 ;  
   
   /*if (x2 < -400) {
   myState = 3;
   x2 = 1350 ; //reset time counter
   
}*/
    break ;
    
    case 3:
    background(photo4) ;
    
    textSize(20);
    fill(255) ;
    text("Click on image to advance to slide 5 >", y3, 620) ;
    y3 = y3 + 1 ;  // speed of text
    
    textSize(80);
    fill(#e17c39, 200) ;
    text("America's number one...", x3, height/2) ;
    x3 = x3 - 2 ;
  
   /*if (x3 < -400) {
    myState = 4 ;
    x3 = 1350 ; //reset time counter
   }*/
    break ;
   
    
    case 4:
    background(photo5) ;
    
    textSize(20);
    fill(255) ;
    text("Click on image to advance to slide 1 >", y4, 620) ;
    y4 = y4 + 1 ;  // speed of text
    
    textSize(80);
    fill(#e17c39, 200) ;
    text("motorcycle & sports car road.", x4, height/2) ;
    x4 = x4 - 2 ;
  
   /*if (x4 < -550) {
    myState = 0 ;
    x4 = 1350 ; //reset time counter
   }*/
    break ;
    
  }
  
}

void mousePressed() {

  
  myState = myState + 1 ;
  x = 1800 ; //reset click counters
  x1 = 1350 ;
  x2 = 1350 ;
  x3 = 1350 ;
  x4 = 1350 ;
  
  y = -1500 ; //reset click counters
  y1 = -1000 ;
  y2 = -1000 ;
  y3 = -1000 ;
  y4 = -1000 ;
  
  if (myState > 4) {
    myState = 0 ;
  }
}


