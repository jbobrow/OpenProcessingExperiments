
int myState = 0;
PFont fonty ;
int counter = 0;
int y = 0;
int y1 = 0;
int y2 = 0;
int y3 = 0;
int y4 = 0;
PImage theClock;
int x = 0;
int x1 = 0;
int x2 = 0;
int y5 = 0;



void setup () {
  
  size ( 850, 400);
  fonty = createFont("BanglaMN.vlw",200);
  theClock = loadImage("clock.png");

  
}

void draw () {
 
 counter = counter + 1;
if (counter > 200) {
 myState = myState + 1;
if (myState > 4) {
 myState = 0; }
counter = 0;
}

noStroke();

background(0);

switch(myState) {
  
  case 0:
  
  y = y+3;
  if (y > 300) {
    y = 300;
  }
  
  fill(#4F6AB9) ;
  rect(0,0, width, height);
  fill(#D5E349);
  ellipse( 400, y, 200, 200);
  fill(#2D5D23);
  rect(0, 300, width, 200);
  fill(#214748);
  fill(255);
   textFont(fonty, 50);
  text("How did it get so late so soon?", 50, 100);
  
  
  break;
  
  case 1:
  fill(#2A3058) ;
  rect(0,0, width, height);
  fill(#EDEDED);
  ellipse( 400, 300, 200, 200);
  fill(#0B3E13);
  rect(0, 300, width, 200);
  fill(#214748);
  fill(255);
  textFont(fonty, 50);
  text("It's night before it's afternoon.", 50, 50);
  
  break;
  
  
  case 2:
  y1 = y1 + 1 ;
  if (y1 > 300) {
    y1 = 0;
  }
    y2 = y2 + 2 ;
  if (y2 > 300) {
    y2 = 0;
  }
    y3 = y3 + 3 ;
  if (y3 > 300) {
    y3 = 0;
  }
    y4 = y4 + 4 ;
  if (y4 > 400) {
    y4 = 0;
  }
  
  fill(#99E0F5) ;
  rect(0,0, width, height);
  fill(#F5F099);
  ellipse( 200, 100, 200, 200);
  fill(255);
  ellipse( 350, y1, 20, 20);
  fill(255);
  ellipse( 100, y2, 20, 20);
  fill(255);
  ellipse( 200, y3, 20, 20);
  fill(255);
  ellipse( 150, y4, 20, 20);
  fill(255);
  ellipse( 250, y1, 20, 20);
  fill(255);
  ellipse( 50, y2, 20, 20);
  fill(255);
  ellipse( 320, y3, 20, 20);
  ellipse( 400, y1, 20, 20);
  fill(255);
  ellipse( 450, y2, 20, 20);
  fill(255);
  ellipse( 500, y3, 20, 20);
  fill(255);
  ellipse( 550, y4, 20, 20);
    ellipse( 400, y1, 20, 20);
  fill(255);
  ellipse( 600, y2, 20, 20);
  fill(255);
  ellipse( 650, y3, 20, 20);
  fill(255);
  ellipse( 700, y4, 20, 20);
   ellipse( 750, y1, 20, 20);
  fill(255);
  ellipse( 800, y2, 20, 20);
  fill(255);
  ellipse( 850, y3, 20, 20);
  fill(255);
  rect(0, 300, width, 200);
  textFont(fonty, 50);
  text("December is here,", 300, 50);
  text("before it's june.", 350, 100);
  
  break;
  
 
  case 3:
  
  background(100);
  x = x + 12;
  if (x > width) {
    x = 0;
  }
  x1 = x1 + 10;
  if (x1 > width) {
    x1 = 0;
  }
  x2 = x2 - 7;
  if (x2 < 0) {
    x2 = 850;
  }
  y5 = y5 + 10;
  if (y5 > 450) {
    y5 = 0;
  }
  
  image(theClock, x, 0);
  image(theClock, x1, 160);
  image(theClock, x2, 90);
  image(theClock, x, 200);
  image(theClock, x1, 350);
  image(theClock, x2, 250);
  image(theClock, 100, y5);
  image(theClock, 700, y5);
  
  textFont(fonty, 50);
   text ("My goodness how has ", 10, 50);
   textFont(fonty, 50);
   text ("the time flewn!", 10, 100);
  break;
  
  case 4:
  textFont(fonty, 50);
   text ("How did it get so late so soon?", 50, 200);
   textFont(fonty, 50);
      text ("- Dr. Seuss", 100, 300);
  
  break;


}
}




