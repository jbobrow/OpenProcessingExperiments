
/* @pjs font=Raleway-Heavy.ttf";*/

PFont rh ;

boolean bDisplayMessage; // False by default
int startTime; // The (last) time when the mouse have been clicked
final int DISPLAY_DURATION = 20000; // in milliseconds = 1s

int x = 600 ;

void setup() {
  frameRate(24) ;
  size(600, 600) ;
  // background(200, 100, 70) ;
  rh = createFont("Raleway-Heavy.ttf", 240) ;
  np1 = loadImage("np1.jpg") ;
}

void draw() {
  background(200, 100, 70) ;
  image(np1, 0, 0, width, height);
  fill(100, 175, 230) ;
  textFont(rh, 50) ;
  textAlign (CENTER, CENTER) ;
  //startTime = millis(0) ;
  //DISPLAY_DURATION = millis(20000) ; 
  text("Nippersink", width/2, 40) ;
  textFont(rh, 35) ;
   text("Silver Creek", x, 120);
     text("Nippersink Headwaters", x+600, 120);
       text("Lower Nippersink", x+1200, 120);
        text("Wonder Lake", x+1800, 120);
  text("Acres in Watershed", width/2, 200);
  text("12,010", x, 280);
   text("6,600", x+600, 280);
    text("12,432", x+1200, 280);
    text("7,884", x+1800, 280);
  text("Subwatershed Pollution", width/2, 360);
  text("17,527", x, 440);
  text("472", x+600, 440);
  text("6,620", x+1200, 440);
   text("6,800", x+1800, 440);
 /* text("N", width/2, 40) ;
  text("i", width/2, 80) ;
   text("p", width/2, 120) ;
  text("p", width/2, 160) ;
  text("e", width/2, 200) ;
  text("r", width/2, 240) ;*/
 // text("Sink", width/2, height/2+70 ) ;
 

  x-- ;
  if (x < -2400) {
    x = 0 ;
  }
}



