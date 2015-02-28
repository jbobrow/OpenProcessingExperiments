
/* @pjs preload="barrels.png,woodford.png,makers.png,fourroses.png,jimbeam.png,wildturkey.png,woodfordpic.png,makerspic.png,fourrosespic.png,jimbeampic.png,wildturkeypic.png";
font="Coda-Heavy.ttf"; */

int myState = 0 ;

PFont font1 ; //Coda-Heavy

PImage photo1;
PImage photo2;
PImage photo3;
PImage photo4;
PImage photo5;
PImage photo6;

PImage pic1;
PImage pic2;
PImage pic3;
PImage pic4;
PImage pic5;



float x = 1500 ;
float x1 = -350 ; //woodford
float x2 = 1280 ; // makers
float x3 = -300 ; //four roses
float x4 = 1200 ; // jim beam
float x5 = -300 ;  //wild turkey

float p = -880 ; //woodford
float p1 = 900 ; // makers
float p2 = -640 ; //four roses
float p3 = 910 ; // jim beam
float p4 = -650 ; //wild turkey


void setup() {
  size(960, 720) ; 
  
  photo1 = loadImage("barrels.png");
  photo2 = loadImage("woodford.png");
  photo3 = loadImage("makers.png");
  photo4 = loadImage("fourroses.png");
  photo5 = loadImage("jimbeam.png"); 
  photo6 = loadImage("wildturkey.png");
  
  pic1 = loadImage("woodfordpic.png");
  pic2 = loadImage("makerspic.png");
  pic3 = loadImage("fourrosespic.png");
  pic4 = loadImage("jimbeampic.png");
  pic5 = loadImage("wildturkeypic.png"); 
  
  font1 = createFont("Coda-Heavy.ttf", 80);
  textFont(font1, 80);
  
}


void draw() {
  
  textAlign(CENTER, CENTER) ;
  
  switch(myState) {
    case 0:
    background(photo1) ; 
    
    //textSize(80);
    fill(250, 150) ;
    text("KENTUCKY BOURBON TRAIL", x, height/2) ;
      x = x - 2 ;  
  
   
   if (x < -600) {
   myState = 1;
   x = 1500 ; //reset time counter
  
   
}
    break ;
    
    case 1:
    background(photo2) ; 
    
    image(pic1, p, 260);
    
    //textSize(80);
    text("Woodford Reserve", x1, height/2) ;
     x1 = x1 + 2 ;
     p = p + 2 ;
  
   if (x1 > 1500) {
    myState = 2 ;
    x1 = -350 ; //reset time counter
    p = -880 ;
   }
    
    break ;
    
    case 2:
    background(photo3) ;
    
    image(pic2, p1, 260);
    
    //textSize(80);
    text("Makers Mark", x2, height/2) ;
    x2 = x2 - 2 ; 
    p1 = p1 - 2 ; 
   
   if (x2 < -260) {
   myState = 3;
   x2 = 1280 ; //reset time counter
   p1 = 900 ;
   }
   
    break ;
    
    case 3:
    background(photo4) ;
    
    image(pic3, p2, 260);
    
    //textSize(80);
    text("Four Roses", x3, height/2) ;
    x3 = x3 + 2 ;
    p2 = p2 + 2 ;
  
   if (x3 > 1300) {
    myState = 4 ;
    x3 = -300 ; //reset time counter
    p2 = -640 ;
   }
   
    break ;
   
    
    case 4:
    background(photo5) ;
    
    image(pic4, p3, 260);
    
    //textSize(80);
    text("Jim Beam", x4, height/2) ;
    x4 = x4 - 2 ;
    p3 = p3 - 2 ;
  
   if (x4 < -240) {
    myState = 5 ;
    x4 = 1200 ; //reset time counter
    p3 = 910 ;
   }
   
    break ;
    
    case 5:
    background(photo6) ;
    
    image(pic5, p4, 260);
    
    //textSize(80);
    text("Wild Turkey", x5, height/2) ;
    x5 = x5 + 2 ;
    p4 = p4 + 2 ;
    
    if (x5 > 1300) {
    myState = 0 ;
    x5 = -300 ; //reset time counter
    p4 = -650 ;
   }
   
    break ;
  }
  
}

void mousePressed() {

  
  myState = myState + 1 ;
  x = 1500 ; //reset click counters
  x1 = -350 ;
  x2 = 1280 ;
  x3 = -300 ;
  x4 = 1200 ;
  x5 = -300 ;
  
  p = -880 ;
  p1 = 900 ;
  p2 = -640 ;
  p3 = 910 ;
  p4 = -650 ;
  
  if (myState > 5) {
    myState = 0 ;
  }
}


