
//Ian L.: DMA252A - Assignment #2, Part B - Clock Sketch

//loading font into data directory

PFont clockFont;

String hourhand = "hour";
String minutehand = "minute";
String secondhand = "second";
String centisecondhand = "centiseond";
String millisecondhand = "millisecond";

char [] hourletters;
char [] minuteletters;
char [] secondletters;
char [] centisecondletters;
char [] millisecondletters;


void setup (){
  size(480, 640);
  smooth();
  clockFont = loadFont("kozgoproextralight100.vlw"); 
  textFont(clockFont, 20);

  hourletters = hourhand.toCharArray();
  minuteletters = minutehand.toCharArray();
  secondletters = secondhand.toCharArray();
  centisecondletters = centisecondhand.toCharArray();
  millisecondletters = millisecondhand.toCharArray();
}

//creating bending action

void draw() {
   background (#CC6600);
  
  int h = hour();  
  int m = minute();
  int s = second(); 
  int l = millis();
  int d = l/100;
    
  int w = 30;  
  int x = 45;
  int y = 75;

//drawing background

stroke(#FFFFCC);
fill(#CC99CC,50);
rectMode(CORNER);
rect(0, 30, x*8.5-w, 60);
rect(0, 105, x*8.5-w, 60);
rect(0, 215, x*8.5-w, 60);
rect(x*2+w, 335, 480, 60);
rect(x*2+w, 485, 480, 60);
line(479,335,479,395);
line(479,485,479,545);


//numerals
    
    fill(#FFFFCC);
    
    text(h, x*2-w/2, y-7.5);
    text(".", x*2+w, y-7.5);
    
    text(m, x*2-w/2, y*2-7.5);
    text(".", x*2+w, y*2-7.5);
    
    text(s, x*2-w/2, y*3.5-7.5);
    text(".", x*2+w, y*3.5-7.5);
    
    text(d, x*8.5, y*5-7.5);
    text(".", x*8.5-w, y*5-7.5);

    
    text(l, x*8.5, y*7-7.5);
    text(".", x*8.5-w, y*7-7.5);

//hours

 pushMatrix();
  translate(x*5, y-7.5);
 
 for (int i = 0; i<hourletters.length; i++){
   float angle = map(h, 0, 600, 0, TWO_PI);
   rotate(angle);
   text(hourletters[i], 0, 0);
   translate(textWidth(hourletters[i]), 0);
 }
 popMatrix();

//minutes

 pushMatrix();
  translate(x*5, y*2-7.5);
 
 for (int i = 0; i<minuteletters.length; i++){
   float angle = map(m, 0, 1200, 0, TWO_PI);
   rotate(angle);
   text(minuteletters[i], 0, 0);
   translate(textWidth(minuteletters[i]), 0);
 }
 popMatrix();

//seconds
   
 pushMatrix();
  translate(x*5, y*3.5-7.5);
 
 for (int i = 0; i<secondletters.length; i++){
   float angle = map(d/10, 0,180, 0, TWO_PI);
   rotate(angle);
   text(secondletters[i], 0, 0);
   translate(textWidth(secondletters[i]),0);
 }
 popMatrix();
 
//centiseconds

 pushMatrix();
  translate(x*5, y*5-7.5);
 
 for (int i = 0; i<centisecondletters.length; i++){
   float angle = map(d, 0, 480, 0, TWO_PI*4);
   rotate(angle);
   text(centisecondletters[i], 0, 0);
   translate(textWidth(centisecondletters[i]), 2);
 }
 popMatrix();

//milliseconds

  pushMatrix();
  translate(x*5, y*7-7.5);
 
 for (int i = 0; i<millisecondletters.length; i++){
   float angle = map(l, 0, 480, 0, HALF_PI);
   rotate(angle);
   text(millisecondletters[i], 0, 0);
   translate(textWidth(millisecondletters[i]), 5);
 }
 popMatrix();
 }
   

    





