
// Samantha Ticknor
// sticknor
// Hw 12
// Copyright 2013

// National Voter Turnout in Presdiential Elections (percentages)
// 1960-2012
// http://www.infoplease.com/ipa/A0781453.html

float[] percent = {63.1, 61.9, 60.8, 55.2, 53.6, 52.6, 53.1, 
                   50.1, 55.1, 49.1, 51.3, 55.3, 56.8, 53.6};
                 
float[][] xys = new float[percent.length][3];
         
                 
final int FIRST_YEAR = 1960;
final int LAST_YEAR = 2012;

PFont f;

float leftEdge, rightEdge, topEdge, bottomEdge; 

float minValue, maxValue;

void setup( ) 
{ 
   size(1024, 768);
 
   rectMode(CORNERS); 
   textAlign(CENTER, CENTER); 
 
   f = loadFont( "f.vlw" );
   textFont( f );
   textSize(18);
 
   leftEdge = 50; 
   rightEdge = width-50; 
   topEdge = 250; 
   bottomEdge = height-50; 

   minValue = min(percent);
   maxValue = max(percent);
}

void drawTitleAndBackground(){
   // background Image
   PImage flagImg;
   flagImg = loadImage("american-flag.jpeg");
   background(flagImg);

   // Transparent Inner Box
   fill(255, 255, 255, 230);
   noStroke();
   rect(50, 50, rightEdge, bottomEdge);

   // Transparent Outer Box
   fill(255, 255, 255, 150);
   noStroke();
   rect(0, 0, width, height);
 
   textSize(32);
   fill(27, 37, 72);
   text( "National Voter Turnout In Presidential Elections", width/2, 100);
   textSize(26);
   fill(47, 63, 118, 90);
   text( "By Percentage Of Population Voting", width/2, 140);
   textSize(18);
}


void plotMean( )
{
  float sum = 0;
  for(int i = 0; i < percent.length; i++){
     sum += percent[i];
  } 
  float mean = sum/percent.length;
  float y = map( mean, maxValue, minValue, topEdge, bottomEdge); 
  
  stroke(47, 63, 118, 90);
  strokeWeight( 2 );
  line( leftEdge, y, rightEdge, y );  
  
  fill(47, 63, 118, 90);
  text( "Average  "+(int(mean))+"%", leftEdge+60, y-12);
}


void testPlots( ) 
{ 
   float oldX, oldY;
   oldX = 0;
   oldY = 0;
 
   for ( int i = 0; i < percent.length; i++){ 
      float xy[] = new float[3];
      float x = map ( i, 0, percent.length, leftEdge+50, rightEdge); 
      float y = map( percent[i], maxValue, minValue, topEdge, bottomEdge-50);
   
      if ( i > 0 ){
         if (y < oldY){
            stroke(64, 173, 71);
            
         }
         else{
            stroke(183, 30, 32); 
         } 
         strokeWeight(1);
         smooth();
         line(oldX, oldY, x, y);         
      }
      
      stroke(27, 37, 72, 200);
      strokeWeight(5); 
      point(x, y);  
      
      fill(27, 37, 72, 200);
      int year = ((i*4 + FIRST_YEAR));
      text(year, x, y-15);
      
      xy[0] = x;
      xy[1] = y;
      xy[2] = year;
      xys[i] = xy;
      
      oldX = x;
      oldY = y;
   } 
}

void draw(){
    drawTitleAndBackground();
    testPlots();
    plotMean();
    displayInfo();
}

void displayInfo() {
  float x = mouseX;
  float y = mouseY;
  int thisYear = 0;
   
   for(int i = 0; i < xys.length; i++){
      float thisx = xys[i][0];
      float thisy = xys[i][1];
      
      if (thisx > x-20 && thisx < x+20 &&
          thisy > y-20 && thisy < y+20){
          thisYear = int(xys[i][2]);
          break;
      }
   }
   yearInfo(thisYear);
}

void yearInfo(int yr){
   switch(yr){
      case(0):
         text("(Hover Over Any Year For Election Information)", 
              width/2, height/2); 
          break;
      case(1960):
          textSize(20);
          fill(27, 37, 72);
          text("1960", width/2, height/3-20);
          
          fill(47, 63, 118, 90);
          text("vs.", width/2, height/3+40);
          text(percent[0]+"% Of Nation Voted", width/2, height/3+100);
          text("Elected John F. Kennedy", width/2, height/3+120);
          
          fill(46, 56, 108);
          text("John F. Kennedy (D)", width/2, height/3+20);
          
          fill(178, 63, 63);
          text("Richard Nixon (R)", width/2, height/3+60);
          break;
      case(1964):
          textSize(20);
          fill(27, 37, 72);
          text("1964", width/2, height/3-20);
          
          fill(47, 63, 118, 90);
          text("vs.", width/2, height/3+40);
          text(percent[1]+"% Of Nation Voted", width/2, height/3+100);
          text("Elected Lydon B. Johnson", width/2, height/3+120);
          
          fill(46, 56, 108);
          text("Lyndon B. Johnson (D)", width/2, height/3+20);
          
          fill(178, 63, 63);
          text("Barry Goldwater (R)", width/2, height/3+60);
          break;
      case(1968):
          textSize(20);
          fill(27, 37, 72);
          text("1968", width/2, height/3-20);
          
          fill(47, 63, 118, 90);
          text("vs.", width/2, height/3+40);
          text(percent[2]+"% Of Nation Voted", width/2, height/3+100);
          text("Elected Richard Nixon", width/2, height/3+120);
          
          fill(46, 56, 108);
          text("Hubert Humphrey (D)", width/2, height/3+20);
          
          fill(178, 63, 63);
          text("Richard Nixon (R)", width/2, height/3+60);
          break;
      case(1972):
          textSize(20);
          fill(27, 37, 72);
          text("1972", width/2, height/3-20);
          
          fill(47, 63, 118, 90);
          text("vs.", width/2, height/3+40);
          text(percent[3]+"% Of Nation Voted", width/2, height/3+100);
          text("Elected Richard Nixon", width/2, height/3+120);
          
          fill(46, 56, 108);
          text("George McGovern (D)", width/2, height/3+20);
          
          fill(178, 63, 63);
          text("Richard Nixon (R)", width/2, height/3+60);
          break;
      case(1976):
          textSize(20);
          fill(27, 37, 72);
          text("1976", width/2, height/3-20);
          
          fill(47, 63, 118, 90);
          text("vs.", width/2, height/3+40);
          text(percent[4]+"% Of Nation Voted", width/2, height/3+100);
          text("Elected Jimmy Carter", width/2, height/3+120);
          
          fill(46, 56, 108);
          text("Jimmy Carter (D)", width/2, height/3+20);
          
          fill(178, 63, 63);
          text("Gerald Ford (R)", width/2, height/3+60);
          break;
      case(1980):
          textSize(20);
          fill(27, 37, 72);
          text("1980", width/2, height/3-20);
          
          fill(47, 63, 118, 90);
          text("vs.", width/2, height/3+40);
          text(percent[5]+"% Of Nation Voted", width/2, height/3+100);
          text("Elected Ronald Reagan", width/2, height/3+120);
          
          fill(46, 56, 108);
          text("Jimmy Carter (D)", width/2, height/3+20);
          
          fill(178, 63, 63);
          text("Ronald Reagan (R)", width/2, height/3+60);
          break;
      case(1984):
          textSize(20);
          fill(27, 37, 72);
          text("1984", width/2, height/3-20);
          
          fill(47, 63, 118, 90);
          text("vs.", width/2, height/3+40);
          text(percent[6]+"% Of Nation Voted", width/2, height/3+100);
          text("Elected Ronald Reagan", width/2, height/3+120);
          
          fill(46, 56, 108);
          text("Walter Mondale (D)", width/2, height/3+20);
          
          fill(178, 63, 63);
          text("Ronald Reagan (R)", width/2, height/3+60);
          break;
      case(1988):
          textSize(20);
          fill(27, 37, 72);
          text("1988", width/2, height/3-20);
          
          fill(47, 63, 118, 90);
          text("vs.", width/2, height/3+40);
          text(percent[7]+"% Of Nation Voted", width/2, height/3+100);
          text("Elected George H. Bush", width/2, height/3+120);
          
          fill(46, 56, 108);
          text("Michael Dukakis (D)", width/2, height/3+20);
          
          fill(178, 63, 63);
          text("George H. Bush (R)", width/2, height/3+60);
          break;
      case(1992):
          textSize(20);
          fill(27, 37, 72);
          text("1992", width/2, height/3-20);
          
          fill(47, 63, 118, 90);
          text("vs.", width/2, height/3+40);
          text(percent[8]+"% Of Nation Voted", width/2, height/3+100);
          text("Elected Bill Clinton", width/2, height/3+120);
          
          fill(46, 56, 108);
          text("Bill Clinton (D)", width/2, height/3+20);
          
          fill(178, 63, 63);
          text("George H. Bush (R)", width/2, height/3+60);
          break;
      case(1996):
          textSize(20);
          fill(27, 37, 72);
          text("1996", width/2, height/3-20);
          
          fill(47, 63, 118, 90);
          text("vs.", width/2, height/3+40);
          text(percent[9]+"% Of Nation Voted", width/2, height/3+100);
          text("Elected Bill Clinton", width/2, height/3+120);
          
          fill(46, 56, 108);
          text("Bill Clinton (D)", width/2, height/3+20);
          
          fill(178, 63, 63);
          text("Bob Dole (R)", width/2, height/3+60);
          break; 
      case(2000):
          textSize(20);
          fill(27, 37, 72);
          text("2000", width/2, height/3-20);
          
          fill(47, 63, 118, 90);
          text("vs.", width/2, height/3+40);
          text(percent[10]+"% Of Nation Voted", width/2, height/3+100);
          text("Elected George W. Bush", width/2, height/3+120);
          
          fill(46, 56, 108);
          text("Al Gore (D)", width/2, height/3+20);
          
          fill(178, 63, 63);
          text("George W. Bush (R)", width/2, height/3+60);
          break;         
      case(2004):
          textSize(20);
          fill(27, 37, 72);
          text("2004", width/2, height/3-20);
          
          fill(47, 63, 118, 90);
          text("vs.", width/2, height/3+40);
          text(percent[11]+"% Of Nation Voted", width/2, height/3+100);
          text("Elected George W. Bush", width/2, height/3+120);
          
          fill(46, 56, 108);
          text("John Kerry (D)", width/2, height/3+20);
          
          fill(178, 63, 63);
          text("George W. Bush (R)", width/2, height/3+60);
          break; 
      case(2008):
          textSize(20);
          fill(27, 37, 72);
          text("2008", width/2, height/3-20);
          
          fill(47, 63, 118, 90);
          text("vs.", width/2, height/3+40);
          text(percent[12]+"% Of Nation Voted", width/2, height/3+100);
          text("Elected Barack Obama", width/2, height/3+120);
          
          fill(46, 56, 108);
          text("Barack Obama (D)", width/2, height/3+20);
          
          fill(178, 63, 63);
          text("John McCain (R)", width/2, height/3+60);
          break;     
      case(2012):
          textSize(20);
          fill(27, 37, 72);
          text("2012", width/2, height/3-20);
          
          fill(47, 63, 118, 90);
          text("vs.", width/2, height/3+40);
          text(percent[13]+"% Of Nation Voted", width/2, height/3+100);
          text("Elected Barack Obama", width/2, height/3+120);
          
          fill(46, 56, 108);
          text("Barack Obama (D)", width/2, height/3+20);
          
          fill(178, 63, 63);
          text("Mitt Romney (R)", width/2, height/3+60);
          break;  
   }
  
}

