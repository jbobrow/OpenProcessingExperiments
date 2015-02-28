
/**
 * Jeu Ma Ligne v2
 * by Adrien Becchis
 */

IntList  pointsX, pointsY;
int shiftStep;  // parameter: fix the value of step between color
int hueBackground;
int hueLines;
int satLines;
PFont font;

/** Initialise All parameters
 */
void setup() {
  size(400, 500);
   pointsX = new IntList();  // Stack for points
   pointsY = new IntList();
   colorMode(HSB, 100);
   font = createFont("Arial",16,true); // create font
   hueLines = (int) random(0,100); //random initial
   satLines = (int) random(75,100); //random initial
   hueBackground = (int) random(0,100); //random initial
   shiftStep = (int) random(2,8);
 }

void draw() {
  int tmp = 50 - pointsX.size()* (shiftStep)/4;
    tmp = (tmp<0)? 0 : tmp ;

    /*background getting more and more pale */
    background(hueBackground, 60 + tmp , 50 + tmp ); // §Toc
    strokeWeight(1);

    if(pointsX.size() == 0) {drawInterface(); return; }
    else if(pointsX.size() == 1)
  {
      set(pointsX.get(0), pointsY.get(0), color(0));
  }

    /* draw the "ligne brisée"  */
  for (int i = pointsX.size()-1; i >= 1; i--) {
      // draw line between each of points saved.
      tmp = 100 - i* shiftStep;
      tmp = (tmp<0)? 0 : tmp ;
      // normalise at zero

      strokeWeight(i);
      // Chose color
      stroke(hueLines, satLines,
             (tmp > 50)? tmp: 50, // brightness
             (tmp > 50)? 100: 50 + 2 * tmp ); // opacity
      // draw the line
      line(pointsX.get(i), pointsY.get(i), pointsX.get(i-1), pointsY.get(i-1));

  }
  // Draw the interface to chose the hue
  drawInterface();
}

/** Draw the hue selector interface */
void drawInterface(){
      /* text of hue selector */
      strokeWeight(1);
      fill(50,12,50, 50);  //50 Opacity
      rect(0,400,399,99);
      textFont(font,16); // Specify font used
      fill(10,0,90);     // Specify color of text
      text("Change Line Color!",10,435);
      text("Change Background!",10,475);

      /* Draw hue selector */
      // Line de 180 à 380
      drawGradient(180, 410, 35);
      drawGradient(180, 455, 35);
}

/** Draw a gradient at the specified coordinated */
void drawGradient(int x, int y, int height){
  line(x, y, x+20, y);
  line(x , y+height, x+200, y+height);
  // noStroke();
      for (int i = 0; i < 100; i++) {
          stroke(i, 100, 100);
          line(x + 2*i , y, x + 2*i , y+height ); // Double line
          line(x + 2*i+1, y ,x + 2*i+1, y+height );
  }

}

/**
 * Choose appropriate active according where click was made
 */
void mousePressed() {

  // reset if double click
  if (mouseEvent.getClickCount()==2){
    reset();
    return;
  }

    // Save point when in frame
  if(inFrame(mouseX,mouseY)){
  // add the point to the array
    pointsX.append(mouseX);
    pointsY.append(mouseY);

    }
  //  change hue color
  else if (inHueLineSelector(mouseX,mouseY)){
    hueLines = getHue(mouseX);

  }else if (inHueBackgroundSelector(mouseX,mouseY)){
    hueBackground = getHue(mouseX);
  }


}
/** check if Mouse in frame
 * Sqaure (except 10 pixel )
 */
boolean inFrame(int x, int y){
  return( (x>10) && (x < 390) &&
          (y>10) && (y < 390) );
}

/** Check if mouse in Hue Line Selector */

boolean inHueLineSelector(int x, int y){
   return( (y>410) && (y < 445) &&
           (x>=180) && (x < 381) );
}
/** Check if mouse in Hue Background Selector */
boolean inHueBackgroundSelector(int x, int y){
   return( (y>455) && (y < 490) &&
           (x>=180) && (x < 381) );
}


/** retrive Hue from x position */
int getHue(int x){
  return  (x - 180) / 2;
}


/** Reset points
 * Reset color and lines
 */
void reset(){
    pointsX = new IntList();  // Create an empty ArrayList
    pointsY = new IntList();
    hueLines = (int) random(0,100); //random initial
    hueBackground = (int) random(0,100); //random initial
}
void mouseWheel(){
  reset();
}



