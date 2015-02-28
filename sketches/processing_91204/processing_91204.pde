
int y = 125;

PFont font1;  
PFont font2;
PFont font3;

String text1 = "If you are not going to give120%someone else will";  
String text2 = "Who knew world war III would be started by USAF";
String text3 = "Winning is not everything, but the will to win is everything";
 void setup() {
   size(600, 200);
   font1 = loadFont("CurlzMT.28.vlw");
   font2 = loadFont("GoudyOldStyleT-Italic-20.vlw");
   font3 = loadFont("Harrington-14.vlw");
   cursor(TEXT);
 }
 void draw() {
   background(15);
   textFont(font1);
   fill(#AFD0FF);  
   text(text1, 15, 50);  
   
   textFont(font2);
   fill(#FF0000);
   text(text2, 15, 150);
   
   textFont(font3);
   fill(#FFFF00);
   text(text3, 15, 250);
 }

