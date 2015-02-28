


import geomerative.*;
RFont font;
RPolygon rp;
String buff = "";
boolean didntTypeYet = true;
float lineHeight;



void setup()
{
    smooth();
    size(650,130, P3D);
    smooth();
    //frameRate( 30 );
    stroke(255);
    strokeWeight(3);
    RG.init(this);
    font = new RFont( "lucon.ttf", 105, RFont.CENTER);
    
    /* textSize(textSize);
  // get line height be measuring letters
  lineHeight = textDescent() + textAscent();
    */
    frameRate( 50 );
    
    strokeCap(SQUARE);
}
  
  
 
void draw()
{
    background(0);
    translate(width/2,height/1.25);
    


    RGroup grp = font.toGroup("WORD");
    
    
    RCommand.setSegmentLength(frameCount % 100);
    RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
    


    RPoint[] pnts = grp.getPoints();

    for ( int i = 1; i < pnts.length; i++ )
    {
        line( pnts[i-1].x, pnts[i-1].y, pnts[i].x, pnts[i].y );
    }
        
      ////////////////////////////////////////////////////////
    /*  if ((millis() % 500) < 250) {  // Only fill cursor half the time
    noFill();
  }
  else {
    fill(0);
  }

  float rPos;
  // Store the cursor rectangle's position
  rPos = textWidth(buff)+leftmargin;

  // draw cursor
  rect(rPos+1, 0 + textDescent(), textWidth(" "), lineHeight);


  fill(0);
  pushMatrix();
  translate(rPos, lineHeight);
  char k;
  // since letters are put in buffer backwards
  // draw one letter at a time moving back with
  // translate at each letter
  for (int i=0;i<buff.length();i++) {
    k = buff.charAt(i);
    translate(-textWidth(k), 0);
    text(k, 0, 0);
  }
  popMatrix();
}  */

}



/*
void keyPressed()
{
  char k;
  k = (char)key;
  switch(k) {
  case 8:
    if (buff.length()>0) {
      // 8 is the code of the delete key
      // remove last letter by getting substring
      // that starts at 1 (not 0, the 1st one)
      buff = buff.substring(1);
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
    if (textWidth(buff+k)+leftmargin < width-rightmargin) {
      // letters are backwards becasue of order of addition
      // if you wanted to use this in a different way, just reverse:
      // buff + k
      buff=k+buff;
    }
    break;
  }
}
*/

