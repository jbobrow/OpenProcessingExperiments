


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
  smooth();
  size(650, 150, P3D);
  smooth();
  stroke(#12FF2B);
  strokeWeight(.75);
  RG.init(this);
  font = new RFont( "lucon.ttf", 105, RFont.CENTER);


  strokeCap(SQUARE);
}



void draw()
{
  background(0);
  
  ////////////////////////////////////work/////////////////////////////
  if(mouseX>325){
    RCommand.setSegmentLength(frameCount % 300);
  } else{ RCommand.setSegmentLength (frameCount % 50);
  } 
  


  if (buff.length()>0)
  {
    translate(width/2, height/1.25);



    RGroup grp = font.toGroup(buff);


    //RCommand.setSegmentLength(frameCount % 100);
   // RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
   
   
   //speed - incremented at different rates from different variables (1-5)
   //mouse x with the width (multiply by rate for range)


    RPoint[] pnts = grp.getPoints();

    for ( int i = 1; i < pnts.length; i++ )
    {
      line( pnts[i-1].x, pnts[i-1].y, pnts[i].x, pnts[i].y );
    }
  }
}

void keyPressed()
{
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


