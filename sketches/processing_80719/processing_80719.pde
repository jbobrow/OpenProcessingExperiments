
////////libraries in processing, used geomerative and pdf exports/////////////

import processing.pdf.*;
boolean record;


import geomerative.*;
RFont font;
RPolygon rp;
String buff = "";
boolean didntTypeYet = true;
float lineHeight;
int leftmargin = 10;
int rightmargin = 20;



void setup()
{
  colorMode(RGB);
  
  if (record) {
    beginRecord(PDF, "frame-####.pdf"); 
  }
  background(0);
  smooth();
  size(650, 150, P3D);
  smooth();
  //stroke(#12FF2B);  //green
  //stroke(#FF1596);  //orange
  stroke(255);  
  strokeWeight(.25);
  RG.init(this);
  font = new RFont( "Courier New Bold.ttf", 115, RFont.CENTER);

  strokeCap(SQUARE);
  
 
}




void draw()
{ 
  //background(0);
 
       ////////////////////////pdf///////////////////////////
 

  ////////////////////////speed of line points///////////////////////////
  if (mousePressed) {
    RCommand.setSegmentLength(50.0*mouseX/width);
  } 
  else { 
    RCommand.setSegmentLength (frameCount % 50);
  }  

  ////////////////////////speed of line points///////////////////////////

/*
  for(mouseX += 650; mouseX > 216; mouseX = 432){
  if(mouseX > 216){ 
    font = new RFont( "Georgia Bold Italic.ttf", 115, RFont.CENTER);
   } 
   else if (mouseX < 432) {
     stroke(#FF1596);
     font = new RFont ("HeadlineA", 115, RFont.CENTER);
   }
   
   else {
     stroke(#12FF2B);
     font = new RFont( "Courier New Bold.ttf", 115, RFont.CENTER);
   }
  }
   */


  if (buff.length()>0)
  {
    translate(width/2, height/1.25);

    RGroup grp = font.toGroup(buff);

    RPoint[] pnts = grp.getPoints();

    for ( int i = 1; i < pnts.length; i++ )
    {
      line( pnts[i-1].x, pnts[i-1].y, pnts[i].x, pnts[i].y );
    }

  }
   if (record) {
    endRecord();
	record = false;
  }
  }






void keyPressed() {
  
  if (record){
   if (key == ' ') {
    if (keyCode == DOWN) {
    endRecord();
    record = true;
  }
  }
  }
  
  char k;
  k = (char)key;
  switch(k) {
  case 8:


    if (buff.length()>0) {
      buff = buff.substring(0, buff.length()-1);
    }
    break;
  case 13:  // Avoid special keys
  case 10:
  case 65535:
  case 127:
  case 27:
    break;
  default:
    // tests to see if text is beyond margins
    if (buff.length()<10) {
      buff=buff+k;
    }
    break;
  }
}


