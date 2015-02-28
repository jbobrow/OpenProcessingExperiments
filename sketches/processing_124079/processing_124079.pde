
/* @pjs font="OpenSans-Light.ttf, OpenSans-ExtraBold.ttf"; */

////////////////dataleft//////////////
int actualSecs; //actual seconds elapsed since start
int scrnSecs; //seconds displayed on screen (will be 0-60)
int scrnMins = 13; //minutes displayed on screen (will be infinite)
int restartSecs = 2; //number of seconds elapsed at last click or 60 sec interval
int startSec = 0; //used to reset seconds shown on screen to 0
float i = 0 ;

//////////data right//

int actualSecs2; //actual seconds elapsed since start
int scrnSecs2; //seconds displayed on screen (will be 0-60)
int scrnMins2 = 2; //minutes displayed on screen (will be infinite)
int restartSecs2 = 2; //number of seconds elapsed at last click or 60 sec interval
int startSec2 = 0; //used to reset seconds shown on screen to 0
float z = 0 ;

////////////////circl const///////
int myState = 0 ;
float circleX ;
float circleY ;
float percent1 ;
///////////////////circle construct/////

//////////////fonts/////////////////////
PFont bold ;
PFont light ;
//////////////fonts/////////////////////


void setup() {
  size(1000, 700);
  smooth() ;
  ellipseMode(RADIUS) ;
  percent1 = 0 ;
  light = createFont("OpenSans-Light.ttf", 18) ;
  bold = createFont("OpenSans-ExtraBold.ttf", 18) ;
}

void draw() {
  background(#2d2d2d);
  textFont(light) ;
  textSize(14) ;


/////////setting of timers///////
  actualSecs = millis()/75; //convert milliseconds to seconds, store values.
  scrnSecs = actualSecs - restartSecs; //seconds to be shown on screen

  actualSecs2 = millis()/75; //convert milliseconds to seconds, store values.
  scrnSecs2 = actualSecs2 - restartSecs2; //seconds to be shown on screen
/////////setting of timers///////

////////////dataLefts IFS//////
if (actualSecs % 1000 == 0) { //after 100 secs, restart second timer 
    restartSecs = actualSecs;   //placeholder for this second in time
    scrnSecs = startSec; //reset to zero
    i = i + .50 ;
  }///endif

  if (i >= 2) {
    scrnMins = scrnMins + 1 ;
    i = 0 ;
  }///endsecondif////
////////////dataLefts IFS//////

////////////dataRights IFS//////
if (actualSecs2 % 1000 == 0) { //after 60 secs, restart second timer 
    restartSecs2 = actualSecs2;   //placeholder for this second in time
    scrnSecs2 = startSec2; //reset to zero
    z = z + .50 ;
  }///endif

  if (z >= 2) {
    scrnMins2 = scrnMins2 + 1 ;
    i = 0 ;
  }///endiff
////////////dataRights IFS//////

 ////left data
  textAlign(CENTER, CENTER) ;
  fill(#a8d06c) ;
  textFont(bold) ;
  textSize(26);
  text("LINES OF CODE WRITTEN", width/2-225, height/2+150) ;

  stroke(255) ;
  line(width/2-385, height/2+175, width/2-65, height/2+175) ;

  fill(#FAFAFA) ;
  textFont(light) ;
  textSize(48);
  text(nf(scrnMins, 3) + " , " + nf(scrnSecs, 3), width/2-225, height/2+205);

  
  ///////right data
  textAlign(CENTER, CENTER) ;
  fill(#a8d06c) ;
  textFont(bold) ;
  textSize(26);
  text("ENERGY DRINKS CONSUMED", width/2+225, height/2+150) ;

  stroke(255) ;
  line(width/2+40, height/2+175, width/2+410, height/2+175) ;

  fill(#FAFAFA) ;
  textFont(light) ;
  textSize(48);
  text(nf(scrnMins2, 3) + " , " + nf(scrnSecs2, 3), width/2+220, height/2+205);


  ///////////beginingofCirclSiwthc//////////////  
  switch(myState) {

  case 0:
  textAlign(CENTER,CENTER) ;
    noStroke() ;
    fill(#3d3d3d) ;
    ellipse(width/2-225, 175, 100, 100) ;
    ellipse(width/2+225, 175, 100, 100) ;
    textSize(18) ;
    fill(#a8d06c) ;
    text("MAC", width/2-220, 290) ;
     text("PC", width/2+230, 290) ;
    break ;

  case 1:
  textAlign(CENTER,CENTER) ;
    noStroke() ;
    fill(#3d3d3d) ;
    ellipse(width/2-225, 175, 100, 100) ;
    ellipse(width/2+225, 175, 100, 100) ;

    fill(#a8d06c) ;
    ellipse(width/2-225, 175, circleX, circleY) ;
    ellipse(width/2+225, 175, circleX, circleY) ;
    circleX+=.50;
    circleY+=.50;
    if (circleX > 90) {
      circleX = 90;
      circleX+= 0;
    } 

    if (circleY > 90) {
      circleY = 90;
      circleY+= 0;
      stroke(#FAFAFA);
      ellipse(width/2-225, 175, circleX, circleY) ;
      ellipse(width/2+225, 175, circleX, circleY) ;
    }

    if (circleY > 25) {
      textSize(18) ;
      fill(#3d3d3d) ;
      text("MAC", width/2-230, 170) ;
      text("PC", width/2+225, 170) ;
    }


    if (percent1 < 195) {
      percent1 += (1) ;
    }

    int hundPerc = round(percent1/2) ;
    fill(#FAFAFA) ;
    textSize(16) ;
    text(hundPerc + "%", width/2-227, 290);
    text(hundPerc + "%", width/2+230, 290);


    break ;
  }///endswitch//
}///enddraw....

void mouseOver() {
  if (myState == 0) {
    myState = 1 ;
  }////endiff
}///endofmouse


