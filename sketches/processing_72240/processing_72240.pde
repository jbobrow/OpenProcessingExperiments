
/*
///////////////////////////////////////////////
 --------- GEOMERATIVE EXAMPLES ---------------
 //////////////////////////////////////////////
 Title   :   TypoGeo_Random
 Date    :   01/03/2011 
 Version :   v0.5
 Basic random creation of lines. Press mouse to generate
 a new random outline. Press CONTROL to save pdf.
 
 Licensed under GNU General Public License (GPL) version 3.
 http://www.gnu.org/licenses/gpl.html
 
 A series of tutorials for using the Geomerative Library
 developed by Ricard Marxer. 
 http://www.ricardmarxer.com/geomerative/
 
 More info on these tutorial and workshops at :
 www.freeartbureau.org/blog
 
 */
//////////////////////////////////////////////

import geomerative.*;
import processing.pdf.*;
boolean doSave = false;

RFont font;
String myText = "V o n";

int actRandomSeed = 20;
int iter = 0;

//----------------SETUP---------------------------------
void setup() {
  size(800, 800);
  background(255);
  noFill(); 
  smooth();
  RG.init(this); 
  font = new RFont("FreeSans.ttf", 300, CENTER);
}

//----------------DRAW---------------------------------

void draw() {
  if (doSave) beginRecord(PDF, timestamp()+".pdf");
  background(255);
  randomSeed(actRandomSeed);
  stroke(0);
  strokeWeight(0.3);
  translate(width/2, 600);

  RCommand.setSegmentLength(20);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  RGroup myGroup = font.toGroup(myText); 
  myGroup = myGroup.toPolygonGroup();
  RPoint[] myPoints = myGroup.getPoints();

  if (iter < myPoints.length){
    iter++;
  } else {
    iter = 0;
  }

  beginShape();

  for (int i=0; i<iter-1; i++) {
    float jitter = random(0, mouseX/16);
    fill(random(255));
    println(myPoints[i].x);
    if((myPoints[i].x != 29.5 )&&(myPoints[i].x != -217.5)){
      line(myPoints[i].x, myPoints[i].y,myPoints[i+1].x, myPoints[i+1].y);
    }
    ellipse(myPoints[i].x,myPoints[i].y,mouseX/2,mouseY/2);
  }
  endShape();
  if (doSave) {
    doSave = false;
    endRecord();
    saveFrame(timestamp()+".png");
  }
}
//--------------------------------------------------------------------------
void mousePressed() {
  actRandomSeed = (int) random(1000);
}
//--------------------------------------------------------------------------
void keyReleased() {
  if (keyCode == CONTROL) doSave = true;
}
//--------------------------------------------------------------------------
// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
//////////////////////////////////////////////
