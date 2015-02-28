
 ////////libraries in processing, used geomerative, 
////////http://www.ricardmarxer.com/geomerative
////////Creator: Ricard Marxer Follow ricardmp on Twitter 
////////Collaborator: Mark Luffel
////////Overview, examples and bug fixes: Florian Jenett
////////geomerativeEx3b_RFont_RPoint


int whichfont = 0;

import geomerative.*;
RFont [] font;

RPolygon rp;
String buff = "";
boolean didntTypeYet = true;
float lineHeight;



void setup() { /////////////////////////////////////////////
  colorMode(RGB);
  background(0);
  smooth();
  size(850, 350, P3D);
  //stroke(#12FF2B);  //green
  //stroke(#FF8017);  //orange
  stroke(255);  
  strokeWeight(.155);
  RG.init(this);

  /////////////////////////////////////////////


 
/* int [] colors = new int [3];
 colors[0] =  (#12FF2B);
 colors[1] = (#FF8017);
 colors[2] = (255); */
 
/////////////////////////////////////////////


  font = new RFont [3];
  font[0] = new RFont( "Georgia Bold Italic.ttf", 125, RFont.CENTER);
  font[1] = new RFont ("儷黑 Pro.ttf", 125, RFont.CENTER);
  font[2] = new RFont( "Courier New Bold.ttf", 125, RFont.CENTER);

}


void draw()
{ 
  //background(0);



  ////////////////////////speed of line points///////////////////////////
  if (mousePressed) {
    RCommand.setSegmentLength(50.0*mouseX/width);
  } 
  else { 
    RCommand.setSegmentLength (frameCount % 50);
  }  



  if (buff.length()>0)
  {
    translate(width/2, height/1.5);

    RGroup grp = font[whichfont].toGroup(buff); 


    ////////////////////////speed of line points///////////////////////////

    RPoint[] pnts = grp.getPoints();

    for ( int i = 1; i < pnts.length; i++ )
    {
      line( pnts[i-1].x, pnts[i-1].y, pnts[i].x, pnts[i].y );
    }
  }  ////////////////////////pdf///////////////////////////

}


///////////array, trigger in the draw loop, function /////////////////



void keyPressed() {
  if (key == CODED && key != SHIFT) {
    if (keyCode == RIGHT ) {
      saveFrame();
      // save frame here
    }   
    else
      if (keyCode == DOWN ) {
        // switch font
        whichfont ++;
        if (whichfont > font.length -1) {
          whichfont = 0;
        }
      }
      /////////////////////color switch//////////////////////
    /*  else
      if (keyCode == UP ) {
        // switch color
        whichcolor ++;
        if (whichcolor > stroke.length -1) {
          whichcolor = 0;
        }
      }
      */
      
  }
  else {

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
}


