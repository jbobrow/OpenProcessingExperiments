
/**********************************************************************
 *
 *          Title:  gradientMadness
 *         Author:  Terence Caulkins
 *
 *    Description:  Gradient sketch for processing class @ 3rd Ward. 
 *
 *           Date:  9/25/2011
 *
 **********************************************************************/

void setup() {
  size(600, 600);
  smooth();
//  frameRate(600);
}
float fillColor;
float botBound;
float topBound;
float windowOpening = 0.;
float incOpening = 0.1;
float fillAlpha;

void draw() {
  background(0);   
  noStroke();
  windowOpening += incOpening;
if ( windowOpening < 0. || windowOpening > 0.5 ) {
     incOpening *= -1.;
    windowOpening += incOpening;
  }
  for (float y=0.; y<(height); y+=1) {
    for (float x=0.; x<(width); x+=1) {
      if ((x+y) < (width+height)*windowOpening) {
        botBound = 0.;
        topBound = (width+height)*windowOpening;
        fillColor = map((x+y), botBound, topBound, 0, 255);
        fill(fillColor);
        rect(x, y, 1, 1);
      }
      else if ((x+y) > (width+height)*(1.-windowOpening))
      { 
        botBound = (width+height)*(1.-windowOpening);
        topBound = (width+height);
        fillColor = map((x+y), botBound, topBound, 255, 0);
        fill(fillColor);
        rect(x, y, 1, 1);
      }
      else
      { 
        fillColor = noise(x, y)* 255.;  
        botBound = (width+height)*windowOpening;
        topBound = (width+height)*(1.-windowOpening);    
        fillAlpha = map((x+y), botBound, topBound, 255, 0);
        fill(fillColor, fillAlpha);        
        rect(x, y, 1, 1);
      }
    }
  }
}


