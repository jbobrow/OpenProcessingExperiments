
int black = 0;
int white = 0;
String thetext =  "abcdefghijklmnopqrstuvwxyz"
+ "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
+ "1234567890";


PFont myFont;
 
void setup() {
  size(640, 480);
  smooth();
  
  myFont = loadFont("TheSerif-ExtraBoldCaps-50.vlw");
  textFont(myFont, 36);
}
 
void draw() {
  background(0);
  smooth();
  fill(255);
  text("“I do not know with what weapons", 10, 50);
  text("World War III will be fought,", 10, 100); 
  text("but World War IV will be fought", 10, 150); 
  text("with                          ”", 10, 200); 



 if(mousePressed) {
   fill(0,0,0,black);
   noStroke();
   rect(0,0,640,170);  
  
  fill(0,0,0,black);
  text("“World War III will be fought", 10, 50);
  text("with sticks and stones,", 10, 100); 
  text("World War III will be fought,", 10, 150);
  fill(255,255,255,white);
  text("sticks and stones.", 100, 200); 
 
 }

else {
 black = 0;
 white = 0; 
  
}


black = black+2;

white = white+1;

fill(255,0,0);
text("press the left mouse button", 10, 450); 
}
 





