
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

/* 
  Electronic Media Studio II Clock
  William Crownover
  Copyright 10-2-12
*/

//Setup Minim Library and Variables
Minim minim;
AudioOutput au_out;
SquareWave sDsqw, mnDsqw, hDsqw, dDsqw, mthDsqw;
LowPassSP lpass;
HighPassSP hpass;

//Global Variables
int xCenter, yCenter, screenPhase;
boolean showUnits, showTime;
float s, mn, h, d, mth;
float sx, sy, mnx, mny, hx, hy, dx, dy, mthx, mthy;
float sCol, mnCol, hCol, dCol, mthCol;
float sSd, mnSd, hSd, dSd, mthSd;

////////////////////////////////////////////////////////////
void setup() {
  size ( 600, 600 );
  smooth();
  frameRate(60);
  minim = new Minim(this);
  au_out = minim.getLineOut();
  
  //Variables
  xCenter = width/2;
  yCenter = height/2;
  screenPhase = 1;
  showUnits = false;
  showTime = false;
  
  //Audio Variables
  sDsqw = new SquareWave(0, 1, 44100);
  mnDsqw = new SquareWave(0, 1, 44100);
  hDsqw = new SquareWave(0, 1, 44100);
  dDsqw = new SquareWave(0, 1, 44100);
  mthDsqw = new SquareWave(0, 1, 44100);
  lpass = new LowPassSP(50, 44100);
  hpass = new HighPassSP(400, 44100);
  au_out.addSignal(sDsqw);
  au_out.addSignal(mnDsqw);
  au_out.addSignal(hDsqw);
  au_out.addSignal(dDsqw);
  au_out.addSignal(mthDsqw);
  au_out.addEffect(lpass);
  au_out.addEffect(hpass);
}

////////////////////////////////////////////////////////////
void stop() {
  super.stop();
}

////////////////////////////////////////////////////////////
void draw() {
  background( 255 );
  translate( xCenter, yCenter );
  if( screenPhase == 1 ) {
    cautionScreen();
  }
  if( screenPhase == 2 ) {
    defineTimeVariables();
    ellipseShade();
    if( showUnits == true ) {
      displayMarkers();
    }
    timeShape();
    timePoints();
    timeSound();
    if( showTime == true ) {
      displayTime();
    }
  }
}

////////////////////////////////////////////////////////////
void cautionScreen() {
  textAlign( CENTER );
  fill(200, 0, 0);
  textSize(30);
  text( "Sensory Clock\nBy William Crownover\n\n-CAUTION-\nThis Program uses Sound Output\n"+
    "\nm = Mute/Unmute\nt = Display Numerical Time\nMouse Click to Display Time Scale\n"+
    "Press c to Continue", 0, -yCenter/1.5); 
}

////////////////////////////////////////////////////////////
//Defines the Time Variables for Position, Color, and Sound
void defineTimeVariables() {
  //Time Variables
  s = map((millis()/1000.0)%60, 0, 60, 0, radians(360)) - radians(90);
  mn = map(minute()+second()/60.0, 0, 60, 0, radians(360)) - radians(90);
  h = map(hour()%12+minute()/60.0, 0, 12, 0, radians(360)) - radians(90);
  d = map(day()+hour()/24.0, 1, 31, 0, radians(360)) - radians(90);
  mth = map(month()+day()/30.0-1, 0, 12, 0, radians(360)) - radians(90);

  //Line Coordinates
  sx = cos(s)*(width*.5);
  sy = sin(s)*(height*.5);
  mnx = cos(mn)*(width*.4);
  mny = sin(mn)*(height*.4);
  hx = cos(h)*(width*.3);
  hy = sin(h)*(height*.3);
  dx = cos(d)*(width*.2);
  dy = sin(d)*(height*.2);
  mthx = cos(mth)*(width*.1);
  mthy = sin(mth)*(height*.1);
  
  //Time Colors
  sCol = map((millis()/1000.0)%60, 0, 60, 255, 0);
  mnCol = map(minute()+second()/60.0, 0, 60, 255, 0);
  hCol = map(hour()%12+minute()/60.0, 0, 12, 255, 0);
  dCol = map(day()+hour()/24.0, 1, 31, 255, 0);
  mthCol = map(month()+day()/30.0-1, 0, 12, 255, 0);
  
  //Sound Variables
  sSd = map((millis()/1000.0)%60, 0, 60, 200, 400);
  mnSd = map(minute()+second()/60.0, 0, 60, 200, 400);
  hSd = map(hour()%12+minute()/60.0, 0, 12, 200, 400);
  dSd = map(day()+hour()/24.0, 1, 31, 200, 400);
  mthSd = map(month()+day()/30.0-1, 0, 12, 200, 400);
}

////////////////////////////////////////////////////////////
//The Background Circles with Grey Tone Corresponding to Time
void ellipseShade() {
  noStroke();
  //Second Shade
  fill(sCol);
  ellipse( 0, 0, width, height);
  //Minute Shade
  fill(mnCol);
  ellipse( 0, 0, width*.8, height*.8);
  //Hour Shade
  fill(hCol);
  ellipse( 0, 0, width*.6, height*.6);
  //Day Shade
  fill(dCol);
  ellipse( 0, 0, width*.4, height*.4);
  //Month Shade
  fill(mthCol);
  ellipse( 0, 0, width*.2, height*.2);
}

////////////////////////////////////////////////////////////
//Red Lines Defining the Unit of Time
void displayMarkers() {
  stroke(255, 0, 0);
  strokeWeight(1);
  for( int i = 0; i<12; i++) {
    pushMatrix();
      rotate(radians(30)*i);
      line(0,-height*.2, 0, -yCenter);
      line(0, 0, 0, -yCenter*.2);
    popMatrix();
  }
  for( int i = 0; i<60; i++) {
    pushMatrix();
      rotate(radians(6)*i);
      line(0,-height*.5, 0, -yCenter*.8);
    popMatrix();
  }
  for( int i = 0; i<30; i++) {
    pushMatrix();
      rotate(radians(360/30)*i);
      line( 0, -height*.2, 0, -yCenter*.2);
    popMatrix();
  }
}

////////////////////////////////////////////////////////////
//Fills in the Shapes Between Time Data
void timeShape() {
  noStroke();
  //Second Shapes
  fill(sCol, mnCol, hCol, 20);
  triangle(sx, sy, mnx, mny, hx, hy);
  triangle(sx, sy, mnx, mny, dx, dy);
  triangle(sx, sy, mnx, mny, mthx, mthy);
  triangle(sx, sy, mnx, mny, 0, 0);
  triangle(sx, sy, hx, hy, dx, dy);
  triangle(sx, sy, hx, hy, mthx, mthy);
  triangle(sx, sy, hx, hy, 0, 0);
  triangle(sx, sy, dx, dy, mthx, mthy);
  triangle(sx, sy, dx, dy, 0, 0);
  triangle(sx, sy, mthx, mthy, 0, 0);
  //Minute Shapes
  fill(mnCol, hCol, sCol, 20);
  triangle(mnx, mny, hx, hy, dx, dy);
  triangle(mnx, mny, hx, hy, mthx, mthy);
  triangle(mnx, mny, hx, hy, 0, 0);
  triangle(mnx, mny, dx, dy, mthx, mthy);
  triangle(mnx, mny, dx, dy, 0, 0);
  triangle(mnx, mny, mthx, mthy, 0, 0);
  //Hour Shapes
  fill(hCol, sCol, mnCol, 20);
  triangle(hx, hy, dx, dy, mthx, mthy);
  triangle(hx, hy, dx, dy, 0, 0);
  triangle(hx, hy, mthx, mthy, 0, 0);
  //Day Shapes
  triangle(dx, dy, mthx, mthy, 0, 0);
}

////////////////////////////////////////////////////////////
//Lines and Points that make up the Clock Time
void timePoints() {
  //Shape Lines
  noFill();
  stroke(255);
  strokeWeight(1);
  //Second Lines
    line(sx, sy, hx, hy);
    line(sx, sy, dx, dy);
    line(sx, sy, mthx, mthy);
    line(sx, sy, 0, 0);
  //Minute Lines
    line(mnx, mny, dx, dy);
    line(mnx, mny, mthx, mthy);
    line(mnx, mny, 0, 0);
  //Hour Lines
    line(hx, hy, mthx, mthy);
    line(hx, hy, 0, 0);
  //Day Lines
    line(dx, dy, 0, 0);
  
  //Time Line
  noFill();
  stroke(0);
  strokeWeight(2);
  beginShape();
    vertex(sx, sy);
    vertex(mnx, mny);
    vertex(hx, hy);
    vertex(dx, dy);
    vertex(mthx, mthy);
    vertex(0, 0);
  endShape();
  
  fill(0);
  //Second Point
  pushMatrix();
    translate(sx, sy);
    ellipse( 0, 0, width*.015, height*.015);
  popMatrix();
  //Minute Point
  pushMatrix();
    translate(mnx, mny);
    ellipse( 0, 0, width*.015, height*.015);
  popMatrix();
  //Hour Point
  pushMatrix();
    translate(hx, hy);
    ellipse( 0, 0, width*.015, height*.015);
  popMatrix();
  //Day Point
  pushMatrix();
    translate(dx, dy);
    ellipse( 0, 0, width*.015, height*.015);
  popMatrix();
  //Month Point
  pushMatrix();
    translate(mthx, mthy);
    ellipse( 0, 0, width*.015, height*.015);
  popMatrix();
  //Year Point
  ellipse( 0, 0, width*.015, height*.015);
}

////////////////////////////////////////////////////////////
//Creates the Tones Corresponding to Time
void timeSound() {
  sDsqw.setFreq(sSd);
  mnDsqw.setFreq(mnSd);
  hDsqw.setFreq(hSd);
  dDsqw.setFreq(dSd);
  mthDsqw.setFreq(mthSd);
}

////////////////////////////////////////////////////////////
//Shows the Time as Text Above Data Points
void displayTime() {
  noStroke();
  textSize(width/40);
  //Second Text
  pushMatrix();
    translate(sx, sy);
    fill(255);
    ellipse(0, -height/40, width/30, height/30);
    fill(0);
    text((millis()/1000)%60, 0, -height/60);
  popMatrix();
  //Minute Text
  pushMatrix();
    translate(mnx, mny);
    fill(255);
    ellipse(0, -height/40, width/30, height/30);
    fill(0);
    text(minute(), 0, -height/60);
  popMatrix();
  //Hour Text
  pushMatrix();
    translate(hx, hy);
    fill(255);
    ellipse(0, -height/40, width/30, height/30);
    fill(0);
    text(hour()%12, 0, -height/60);
  popMatrix();
  //Day Text
  pushMatrix();
    translate(dx, dy);
    fill(255);
    ellipse(0, -height/40, width/30, height/30);
    fill(0);
    text(day(), 0, -height/60);
  popMatrix();
  //Month Text
  pushMatrix();
    translate(mthx, mthy);
    fill(255);
    ellipse(0, -height/40, width/30, height/30);
    fill(0);
    text(month(), 0, -height/60);
  popMatrix();
  //Year Text
  fill(255);
  ellipse(0, -height/40, width/15, height/30);
  fill(0);
  text(year(), 0, -height/60);
}

////////////////////////////////////////////////////////////
void mouseClicked() {
  showUnits = !showUnits;
}

void keyPressed() {
  if( key == 'm' ) {
    if( au_out.isMuted()) {
      au_out.unmute();
    }
    else {
      au_out.mute();
    }
  }
  if( key == 'c' ) {
    screenPhase = 2;
  }
  if( key == 't' ) {
    showTime = !showTime;
  }
}
  
  

