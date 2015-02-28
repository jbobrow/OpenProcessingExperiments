
/*

ERIC™
Description: Valentine's Day heart rate

Click on the page numbers to navigate between pages.

*/

// Set global variables
float x; float y; float i;
float position = 3.0/5.0;      // determines position of electrocardiogram

void setup () {

  size (900, 600);            // set style
  background (255);
  smooth ();
  stroke (100);
  strokeWeight (2);

// load navigation panel
  PImage Page1; Page1 = loadImage ("1c.png"); image (Page1,10,10);
  PImage Page2; Page2 = loadImage ("2.png"); image (Page2,60,10);
  PImage Page3; Page3 = loadImage ("3.png"); image (Page3,110,10);
  PImage Page4; Page4 = loadImage ("4.png"); image (Page4,160,10);
  
  line (0,height*position, PI*40,height*position);

// load first page

  fill (100);
  textAlign (CENTER);
  textSize (35);
  text("BEFORE I MET YOU", width/2.0, 100);

  x=PI*40;
  for (i=0; i<10*PI; i=i+0.01) {y=50*sin(i/10); point(x+i,y+height*position);}
  
  x=PI*50;
  for (i=0; i<PI*30; i=i+0.01) {y=-200*sin(i/15); point (x+i,y+height*position);}

  x=PI*80;
  for (i=0; i<10*PI; i=i+0.01) {y=-50*sin(i/10); point(x+i,y+height*position);}
  
  line (PI*90,height*position,PI*190,height*position);
  
  x=PI*190;
  for (i=0; i<10*PI; i=i+0.01) {y=50*sin(i/10); point(x+i,y+height*position);}
  
  x=PI*200;
  for (i=0; i<PI*30; i=i+0.01) {y=-200*sin(i/15); point (x+i,y+height*position);}

  x=PI*230;
  for (i=0; i<10*PI; i=i+0.01) {y=-50*sin(i/10); point(x+i,y+height*position);}
  
  line (PI*240,height*position,width,height*position);
  
}


void draw () {}


void mousePressed() {

// Before I meet you

if ((10 < mouseX) && (mouseX < 50) && (10 < mouseY) && (mouseY < 50)) {    // check mouse click
  
  background (255);  // clear background
  
  // load navigation panel
  PImage Page1; Page1 = loadImage ("1c.png"); image (Page1,10,10);
  PImage Page2; Page2 = loadImage ("2.png"); image (Page2,60,10);
  PImage Page3; Page3 = loadImage ("3.png"); image (Page3,110,10);
  PImage Page4; Page4 = loadImage ("4.png"); image (Page4,160,10);
  
  // load electrocardiogram
  
  textSize (35);
  text("BEFORE I MET YOU", width/2.0, 100);
  
  line (0,height*position, PI*40,height*position);

  x=PI*40;
  for (i=0; i<10*PI; i=i+0.01) {y=50*sin(i/10); point(x+i,y+height*position);}
  
  x=PI*50;
  for (i=0; i<PI*30; i=i+0.01) {y=-200*sin(i/15); point (x+i,y+height*position);}

  x=PI*80;
  for (i=0; i<10*PI; i=i+0.01) {y=-50*sin(i/10); point(x+i,y+height*position);}
  
  line (PI*90,height*position,PI*190,height*position);
  
  x=PI*190;
  for (i=0; i<10*PI; i=i+0.01) {y=50*sin(i/10); point(x+i,y+height*position);}
  
  x=PI*200;
  for (i=0; i<PI*30; i=i+0.01) {y=-200*sin(i/15); point (x+i,y+height*position);}

  x=PI*230;
  for (i=0; i<10*PI; i=i+0.01) {y=-50*sin(i/10); point(x+i,y+height*position);}
  
  line (PI*240,height*position,width,height*position);
}
  
  
// When I first held your hands

if ((60 < mouseX) && (mouseX < 100) && (10 < mouseY) && (mouseY < 50)) {    // check mouse click

  background (255);  // clear background
  
  // load navigation panel
  PImage Page1; Page1 = loadImage ("1.png"); image (Page1,10,10);
  PImage Page2; Page2 = loadImage ("2c.png"); image (Page2,60,10);
  PImage Page3; Page3 = loadImage ("3.png"); image (Page3,110,10);
  PImage Page4; Page4 = loadImage ("4.png"); image (Page4,160,10);
  
  // load electrocardiogram

  textSize (35);  
  text("WHEN I FIRST HELD YOUR HANDS", width/2.0, 100); // when I first held your hands
  
  line (0,height*position, PI*30,height*position);

  x=PI*30;
  for (i=0; i<10*PI; i=i+0.01) {y=50*sin(i/10); point(x+i,y+height*position);}
  
  x=PI*40;
  for (i=0; i<PI*30; i=i+0.01) {y=-200*sin(i/15); point (x+i,y+height*position);}

  x=PI*70;
  for (i=0; i<10*PI; i=i+0.01) {y=-50*sin(i/10); point(x+i,y+height*position);}
  
  line (PI*80,height*position,PI*120,height*position);
  
  x=PI*120;
  for (i=0; i<10*PI; i=i+0.01) {y=50*sin(i/10); point(x+i,y+height*position);}
  
  x=PI*130;
  for (i=0; i<PI*30; i=i+0.01) {y=-200*sin(i/15); point (x+i,y+height*position);}

  x=PI*160;
  for (i=0; i<10*PI; i=i+0.01) {y=-50*sin(i/10); point(x+i,y+height*position);}
  
  line (PI*170,height*position, PI*210,height*position);
  
  x=PI*210;
  for (i=0; i<10*PI; i=i+0.01) {y=50*sin(i/10); point(x+i,y+height*position);}
  
  x=PI*220;
  for (i=0; i<PI*30; i=i+0.01) {y=-200*sin(i/15); point (x+i,y+height*position);}

  x=PI*250;
  for (i=0; i<10*PI; i=i+0.01) {y=-50*sin(i/10); point(x+i,y+height*position);}
  
  line (PI*260,height*position, width,height*position);

}


// When we kissed

if ((110 < mouseX) && (mouseX < 150) && (10 < mouseY) && (mouseY < 50)) {    // check mouse click

  background (255);  // clear background
  
  // load navigation panel
  PImage Page1; Page1 = loadImage ("1.png"); image (Page1,10,10);
  PImage Page2; Page2 = loadImage ("2.png"); image (Page2,60,10);
  PImage Page3; Page3 = loadImage ("3c.png"); image (Page3,110,10);
  PImage Page4; Page4 = loadImage ("4.png"); image (Page4,160,10);
  
  // load electrocardiogram

  textSize (35);
  text("WHEN WE KISSED", width/2.0, 100);
  
  x=0;
  for (i=0; i<PI*30; i=i+0.01) {y=-200*sin(i/15); point (x+i,y+height*position);}

  x=PI*30;
  for (i=0; i<10*PI; i=i+0.01) {y=-50*sin(i/10); point(x+i,y+height*position);}

  x=PI*40;
  for (i=0; i<10*PI; i=i+0.01) {y=50*sin(i/10); point(x+i,y+height*position);}
  
  x=PI*50;
  for (i=0; i<PI*30; i=i+0.01) {y=-200*sin(i/15); point (x+i,y+height*position);}

  x=PI*80;
  for (i=0; i<10*PI; i=i+0.01) {y=-50*sin(i/10); point(x+i,y+height*position);}
  
  x=PI*90;
  for (i=0; i<10*PI; i=i+0.01) {y=50*sin(i/10); point(x+i,y+height*position);}
  
  x=PI*100;
  for (i=0; i<PI*30; i=i+0.01) {y=-200*sin(i/15); point (x+i,y+height*position);}

  x=PI*130;
  for (i=0; i<10*PI; i=i+0.01) {y=-50*sin(i/10); point(x+i,y+height*position);}
  
  x=PI*140;
  for (i=0; i<10*PI; i=i+0.01) {y=50*sin(i/10); point(x+i,y+height*position);}
  
  x=PI*150;
  for (i=0; i<PI*30; i=i+0.01) {y=-200*sin(i/15); point (x+i,y+height*position);}

  x=PI*180;
  for (i=0; i<10*PI; i=i+0.01) {y=-50*sin(i/10); point(x+i,y+height*position);}

  x=PI*190;
  for (i=0; i<10*PI; i=i+0.01) {y=50*sin(i/10); point(x+i,y+height*position);}
  
  x=PI*200;
  for (i=0; i<PI*30; i=i+0.01) {y=-200*sin(i/15); point (x+i,y+height*position);}

  x=PI*230;
  for (i=0; i<10*PI; i=i+0.01) {y=-50*sin(i/10); point(x+i,y+height*position);}
  
  x=PI*240;
  for (i=0; i<10*PI; i=i+0.01) {y=50*sin(i/10); point(x+i,y+height*position);}
  
  x=PI*250;
  for (i=0; i<PI*30; i=i+0.01) {y=-200*sin(i/15); point (x+i,y+height*position);}

  x=PI*280;
  for (i=0; i<10*PI; i=i+0.01) {y=-50*sin(i/10); point(x+i,y+height*position);}
  
}


// Happy Valentine's Day!

if ((160 < mouseX) && (mouseX < 200) && (10 < mouseY) && (mouseY < 50)) {    // check mouse click

  background (255);  // clear background
  
  // load navigation panel
  PImage Page1; Page1 = loadImage ("1.png"); image (Page1,10,10);
  PImage Page2; Page2 = loadImage ("2.png"); image (Page2,60,10);
  PImage Page3; Page3 = loadImage ("3.png"); image (Page3,110,10);
  PImage Page4; Page4 = loadImage ("4c.png"); image (Page4,160,10);

  // load Valentine's wish
  textSize (30);
  text ("You make my heart beat faster.", width/2.0, 110);
  text ("May we be together until there's a straight line.", width/2.0,170);
  
  line (0,height*position, width,height*position);  
  
  textSize (35);
  text ("HAPPY     ALENTINE'S DAY, MY DARLING!", width/2.0, 480);
  
  PImage Heart; Heart = loadImage ("heart.png"); image (Heart,237,446);
  

}
  
  
}

