
/*
"CircleClock" Created By Nate "ZombieProof"
Created on November 14, 2010
*/

void setup() {
  size(300, 300);
  colorMode(RGB, 12);
  smooth();
  noStroke();
}

void draw(){
  background(0);
  //hour
  fill(3);
  float hourCenterx = cos(3*PI/2+2*PI*hour()/12+PI/2/12*minute()/60+PI/2/12/60*second()/60+PI/2/12/60/60*millis()/1000)*width/4+width/2;
  float hourCentery = sin(3*PI/2+2*PI*hour()/12+PI/2/12*minute()/60+PI/2/12/60*second()/60+PI/2/12/60/60*millis()/1000)*height/4+height/2;
  ellipse((int)hourCenterx,(int)hourCentery,width/2,height/2);
  //min
  fill(6);
  float minCenterx = cos(3*PI/2+2*PI*minute()/60+PI/2/60*second()/60+PI/2/60/60*millis()/1000)*width/8+hourCenterx;
  float minCentery = sin(3*PI/2+2*PI*minute()/60+PI/2/60*second()/60+PI/2/60/60*millis()/1000)*height/8+hourCentery;
  ellipse((int)minCenterx,(int)minCentery,width/4,height/4);
  //sec
  fill(9);
  float secCenterx = cos(3*PI/2+2*PI*second()/60+PI/2/60*millis()/1000)*width/16+minCenterx;
  float secCentery = sin(3*PI/2+2*PI*second()/60+PI/2/60*millis()/1000)*height/16+minCentery;
  ellipse((int)secCenterx,(int)secCentery,width/8,height/8);
  //millis
  fill(1);
  float milCenterx = cos(3*PI/2+2*PI*millis()/1000)*width/32+secCenterx;
  float milCentery = sin(3*PI/2+2*PI*millis()/1000)*height/32+secCentery;
  ellipse((int)milCenterx,(int)milCentery,width/16,height/16);
}

