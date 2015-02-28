
/* @pjs font = "RalewayDots-Regular.ttf"; */
PImage bg ;
PImage w1 ;
PImage w2 ;
PImage w3 ;
PImage beach ;
PImage guy ;
PImage guy2 ;
PImage water ;
PImage water2 ;
PFont Dots ;
int y1 = 0 ;
int x2 = 0 ;
int x3 = 0 ;


String line1 = "Then take me disappearin' through the smoke rings of my mind" ;  
String line2 = "Down the foggy ruins of time, far past the frozen leaves" ;
String line3 = "The haunted, frightened trees, out to the windy beach" ;
String line4 = "Far from the twisted reach of crazy sorrow" ;
String line5 = "Yes, to dance beneath the diamond sky with one hand waving free" ;
String line6 = "Silhouetted by the sea, circled by the circus sands" ;
String line7 = "With all memory and fate driven deep beneath the waves" ;
String line8 = "Let me forget about today until tommorow" ;

void setup () {

  size(400, 400) ;
  bg = loadImage("background.png") ;
  w1 = loadImage("waves 1.png") ;
  w2 = loadImage("waves 2.png") ;
  w3 = loadImage("waves 3.png") ;
  beach = loadImage("beach.png") ;
  water = loadImage("water.png") ;
  water2 = loadImage("water2.png") ;
  guy = loadImage("guy.png") ;
  guy2 = loadImage("guy(2).png") ;
  
  Dots = createFont("RalewayDots-Regular.ttf", 12) ;
  y1 = 0 ;
  x2 = 0 ;
  x3 = 0 ;

  
}

void draw () {
 image(bg, 0, 0) ; 
 image(w1, 0, y1) ;
 image(w2, x2, 0) ;
 image(w3, x3, 0) ;
 image(beach, 0, 0) ;
 textFont(Dots, 12) ;
 textAlign(LEFT) ;
 
 if (mousePressed) {
   
   image(water, 0, 0) ;
   image(guy, 0, 0) ;
 } 
 else { 
   
   image(water2, 0, 0) ;
   image(guy2, 0, 0) ;
 }


  text (line1, 50, 24);
  text (line2, 45, 39);
  text (line3, 65, 54);
  text (line4, 65, 69);
  text (line5, 30, 84);
  text (line6, 45, 99);
  text (line7, 30, 114);
  text (line8, 45, 129);
 
  //MOON///////////////////////////////////////Moon/////////////////
  ellipse(0, 0, 75, 75) ; //moon//
  fill(#E8E04D) ; //moon//
  ellipse(25, 15, 10, 10) ;
  ellipse(15, 5, 5, 5) ;
  ellipse(5, 20, 5, 5) ;
 
 y1 = y1 + 1;
 if ( y1 > 25) {
   y1 = 0;
   }
   
  
   
}



