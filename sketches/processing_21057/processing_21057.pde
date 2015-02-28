
int hours ;
int minutes ; 
int seconds ; 
PFont myFont;

void setup () {
  size (600, 600);
  colorMode (HSB, 100);
  background (20, 0, 15);
  smooth ();
  noStroke();
  
}

void draw () {
  background (20, 0, 15);
  
  //H, M, and S at the top of the screen
  myFont = createFont("Avenir-Heavy", 40);
  textFont(myFont);
  text ("H", 135, 50);
  text ("M", 285, 50);
  text ("S", 435, 50);
  myFont = createFont("Avenir-Heavy", 20);
  textFont(myFont);
 
  
  hours = hour ();
  minutes = minute ();
  seconds = second ();
  
  if (hours > 12) {
   hours -= 12;
   text ("PM", 50, 50); 
  } else {
    text ("AM", 50, 50);
  }
  

  
  //HOURS CIRCLES
  float hYpos = 75; 
  int hCount = 0;
  
  for (int i = 75 ; i < 525; i += 37) {
 // hCount ++;
 // hYpos = ((37 * h) + 75);
  fill (30, 0, 0);
  println (i);
  ellipse (150, i , 20, 20);
  
  }
  
  float hPosition;
  hPosition = ((37.5 * hours)+75);
  fill (0, 0, 100);
  ellipse (150, hPosition, 20, 20);
  
  
  
  //MINUTES CIRCLES
  float mYpos = 75; 
  int mCount = 0;
  
  for (int m = 75; m < 525; m+= 7.5) {
  //mYpos = ((7.5 * hCount) + 75);
  fill (30, 0, 0);
  ellipse (300, m, 6, 6);
  
  }
  
  float mPosition;
  mPosition = ((7.5 * minutes)+75);
  fill (0, 0, 100);
  ellipse (300, mPosition, 6, 6);
  
  //SECONDS CIRCLES
  float sYpos = 75; 
  int sCount = 0;
  
  for (int s = 0; s < 60; s++) {
  sCount ++;
  sYpos = ((7.5 * sCount) + 75);
  fill (30, 0, 0);
  ellipse (450, sYpos, 6, 6);
  
  }
  
  float sPosition;
  sPosition = ((7.5 * seconds) +75);
  fill (0, 0, 100);
  ellipse (450, sPosition, 6, 6);
   
  
}

