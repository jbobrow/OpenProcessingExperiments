
/*
 *    This is a tool to generate and export experimental typography for use in print. 
 *    It relies heavily on Geomerative - created by Richard Marxer.
 *    Some code here was borrowed and modified from the Geomerative Example Library - geomerativeEx3b_RFont_RPoint.
 *    http://www.ricardmarxer.com/geomerative/
 *    --------------
 *    Daniel Surgeon 
 *    Hack Your Practice - Fall 2012 - Brad Borevitz
 */

import geomerative.*;
import processing.pdf.*;
boolean savePDF = false;
int off =100;
String letter = "A";
int mode =0;
int mode2 =0;
int fontchange =0;
RFont [] font;

void setup()
{
  size(800, 800);
  smooth();

  RG.init(this);

  font = new RFont [4];
  font[0] = new RFont("PerlaRegular.ttf", 400, RFont.CENTER);
  font[1] = new RFont ("Interstate-Bold.ttf", 500, RFont.CENTER);
  font[2] = new RFont ("FILOSMCA.ttf", 600, RFont.CENTER);
  font[3] = new RFont ("AauxProBold.ttf", 500, RFont.CENTER);

  frameRate( 20 );
}

void draw()
{

  if ( savePDF ) {
    beginRecord( PDF, "letter-##.pdf" );
  }

  background(255);
  translate(width/2, height/1.5);

  RGroup grp = font[fontchange].toGroup(letter);

  grp = grp.toPolygonGroup();

  RPoint[] pnts = grp.getPoints();


  for ( int i = 1; i < pnts.length; i++ )
  {

    ////////// changeable visual styles \\\\\\\\\\
    switch(mode) {
    case 0:
      line( pnts[i-1].x, pnts[i-1].y, pnts[(i+off)%pnts.length].x, pnts[(i+off)%pnts.length].y );
      break;

    case 1:
      rect( pnts[i-1].x, pnts[i-1].y, pnts[(i+off)%pnts.length].x, pnts[(i+off)%pnts.length].y );
      break;

    case 2:
      ellipse( pnts[i-1].x, pnts[i-1].y, pnts[(i+off)%pnts.length].x, pnts[(i+off)%pnts.length].y );
      break;

    case 3:
      line( pnts[i-1].x, pnts[i-1].y, pnts[i].x, pnts[i].y );
      ellipse(pnts[i].x, pnts[i].y, 50, 50);
      break;

    case 4:
      rect(pnts[i].x, pnts[i].y, 50, 50);
      break;

    case 5:
      rect(pnts[i].x, pnts[i].y, 50, 50);
      break;

    case 6:
      int inc = pnts.length/3;
      triangle(pnts[(i)%pnts.length].x, pnts[(i)%pnts.length].y, pnts[(i+inc)%pnts.length].x, pnts[(i+inc)%pnts.length].y, pnts[(i+2*inc)%pnts.length].x, pnts[(i+2*inc)%pnts.length].y);
      break;

    case 7:
      triangle( pnts[(i*100/3)%pnts.length].x, pnts[i-1].y, pnts[(i*100/3)%pnts.length].x, pnts[i-1].y, pnts[i-1].x, pnts[i-1].y );
      point(pnts[i].x, pnts[i].y);
      break;

    case 8:
      arc(pnts[i-1].x, pnts[i-1].y, 50, 50, PI+QUARTER_PI, TWO_PI);
      line( pnts[i-1].x, pnts[i-1].y, pnts[i].x, pnts[i].y );
      point(pnts[i].x, pnts[i].y);
      break;

    case 9:
      triangle(pnts[i].x, pnts[i].y, 0, 0, pnts[i].x, pnts[i].y);
      break;
    }

    ////////// changeable animation/motion styles \\\\\\\\\\
    switch(mode2) {

    case 0:
      RCommand.setSegmentLength(3);
      RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
      break;

    case 1:
      RCommand.setSegmentLength(frameCount % 175);
      RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
      break;

    case 2:
      RCommand.setSegmentAngle(random(0, HALF_PI));
      RCommand.setSegmentator(RCommand.ADAPTATIVE);
      break;

    case 3:
      RCommand.setSegmentStep(random(0, 3));
      RCommand.setSegmentator(RCommand.UNIFORMSTEP);
      break;
    }

    off++;

    ////////// crazy color surprise! \\\\\\\\\\
    if (mousePressed) {
      fill(random(255), random(255), random(255));
    }
  }
    ////////// export pdf \\\\\\\\\\
    if ( savePDF ) {
      endRecord();
      savePDF = false;
    }
  }


void keyPressed()
{

  if (key!=CODED) {

    ////////// export pdf \\\\\\\\\\
    if ( key == ' ' ) {
      savePDF = true;
    }

    ////////// change typeface \\\\\\\\\\
    else if (key==TAB) {
      fontchange ++;
      if (fontchange>font.length -1) {
        fontchange =0;
      }
    }  

    ////////// change letter \\\\\\\\\\
    else {
      letter=str(key);
    }
  } 
  else {

    ////////// change visual styles \\\\\\\\\\
    if (keyCode==UP) {
      mode ++;
      if (mode>9) {
        mode =0;
      }
    } 
    else 
      if (keyCode==DOWN) {
      mode --;
      if (mode<0) {
        mode =9;
      }
    }

    ////////// change animation/motion styles \\\\\\\\\\
    else {
      if (keyCode==LEFT) {
        mode2 ++;
        if (mode2>3) {
          mode2 =0;
        }
      } 
      else
        if (keyCode==RIGHT) {
          mode2 --;
          if (mode2<0) {
            mode2 =3;
          }
        }

      ////////// change to random color \\\\\\\\\\
        else {
          if (keyCode==CONTROL) {
            fill(random(255), random(255), random(255));
          }
        } 
      ////////// reset color to white \\\\\\\\\
      if (keyCode==ALT) {
        fill(255, 255, 255);
      }
    }
  }
}


