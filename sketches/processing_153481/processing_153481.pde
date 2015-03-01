
/*
 * Creative Coding
 * Week 5, 02 - Digital Clock
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch shows how to use text in Processing
 * The sketch creates a digital clock that shows the current time in hours, minutes and seconds
 * Use the 'h', 'm' and 's' keys to enlarge the hours, minutes or seconds in the display.
 *
 */
PFont myFont;    // font data
char  selected;  // what is selected (h,m,s)
int   gap;       // gap between digits
color white = color(254);
color black = color(1);
float timeY;
int dawn;
int sunSet;
int countUp = 0;
int mHour;
int mMinute;


void setup() {
  size(600, 600);
  dawn=6;
  sunSet=21;
  myFont = loadFont("Frutiger65-Bold-200.vlw");  // load the font from this sketch's data directory
  textFont(myFont);  // set the current font to myFont
  selected = '0';
  gap = width/4;
  noStroke();
 
}

void draw() {
  background(255);
 
   textSize(50);  // normal font size
  
  fill(0);
  rect(0,0,width,height/(24/(24-sunSet)));
  rect(0,height - height/(24/dawn)-textAscent(),width,height - height/(24/dawn)-textAscent());
    
  fill(254);
 countUp++;
 mHour = round(0+countUp/50);
 if(mHour == 25){
 mHour = 0;
 countUp=0;}
 mMinute =minute();
 
 float lerpSeconds = (float)((((mHour*60)+mMinute)*60)+second())/86400;
 timeY = lerp(height,textAscent(),lerpSeconds);

    // draw text offset from the centre of the screen
  String hourZero;
   String minuteZero;
   String secondsZero;
  if(mMinute<10){
   minuteZero = "0";}
  else
 minuteZero = ""; 
 if(second()<10){
 secondsZero ="0";}
 else
 secondsZero ="";
 if(mHour<10){
   hourZero = "0";}
  else
 hourZero = ""; 
 
 
  text(hourZero+mHour, width/2 - (textWidth(hourZero+mHour) * 0.5) -gap, timeY);
  text(":",width/2-gap/2,timeY);
  text(minuteZero+mMinute, width/2 - (textWidth(minuteZero+mMinute) * 0.5), timeY);
  text(":",width/2+gap/2,timeY);
  text(secondsZero+second(), width/2 - (textWidth(""+second()) * 0.5) + gap, timeY);
  
  loadPixels();
 int count =0;
 for(int i = 0; i<=height - height/(24/dawn)-textAscent();i++){
   for(int j = 0;j<=width;j++){
     if(pixels[count] == white){
       pixels[count] = black;}
        count++;
   }}
   updatePixels();
   count =0;
 for(int i = 0; i<=height/(24/(24-sunSet));i++){
   for(int j = 0;j<=width;j++){
     if(pixels[count] == black){
       pixels[count] = white;}
        count++;
   }}
   updatePixels(); 
   
  
}

/*
 * drawNumber
 * takes an integer and draws it offset from the centre of the screen by
 * offsetX and offsetY. If big is true then use a big size for the type.
 */







