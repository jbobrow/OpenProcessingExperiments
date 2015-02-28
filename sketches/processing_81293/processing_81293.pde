
/*
Program Title: A2-6
 Program Description: Create a responsive animation using curves that behaves differently when the mouse is dragged at different
 speeds. Make it so that it begins when the mouse is clicked and ends when any keyboard button is pressed.
 By Jillian Warren, October 4, 2012
 Comments: IAT 800 - Assignment 2 
 
 ***Inspiration from: http://www.openprocessing.org/sketch/64666
 */


//***global variable
boolean startChange; // use as switch for mouse and key activity


//**setup initial canvas
void setup () {
  size(600, 600);
  smooth();

  background(195);
  noFill();
}//end setup


//*** call draw method will draw bezier curves, if the mouse is pressed (trigger switch startChange) then transformations based
// on distance (speed) between points (including mouse dragging position throuh current and previous pts)
void draw () {
  background(195);

  if (startChange == false) {

    for (int i=1; i<16; i++) {
      float y = i*(height/16);
      stroke(i*16-1);
      bezier(width, y, width/3f, y, width*(2/3f), height-y, 0, height-y);
    }//end for loop
  }//end if


  else {

    for (int i=1; i<16; i++) {
      float y = i*(height/16);
      stroke(i*16-1, 255, 255);
      bezier(width, y, 0, 0, dist(pmouseX, pmouseY, width, mouseY), dist(mouseX, mouseY, pmouseX, pmouseY), dist(pmouseX, pmouseY, mouseX, height), height-y);
    }//end for
  }//end else
}//end draw



//***create "switches" for conditional controls within draw()
void mousePressed () {// if mouse pressed set boolean to true, will trigger ability to change curves
  startChange = true;
}

void keyPressed () { // if key pressed set boolean to false, will stop ability to change curves
  startChange = false;
}



