
/*
    Ben Norskov, Creative Computing, Parsons Spring 2013
    This sketch won't work online because you need the Sprites library.
    You can download it here: https://code.google.com/p/sprites4processing/downloads/list
    This is only for reference.
*/
import sprites.utils.*;
import sprites.maths.*;
import sprites.*;

Sprite ryu;
StopWatch s = new StopWatch();
void setup() {
  size(400, 400);
  //Sprite(this, name of file, number of columns, number of rows, z-index);
  ryu = new Sprite(this, "ryu.png", 3, 1, 0);
  ryu.setXY(200, 200);//have to set x and y like this
}
void draw() {
  background(200);
  ryu.update((float) s.getElapsedTime());
  ryu.draw();
  //If you have lots of sprites, do this instead:
  /*
  S4P.updateSprites((float) s.getElapsedTime());
  S4P.drawSprites();
  */
}
void keyPressed() {
  //set the animation each time a button is pressed
  //(start frame, end frame, time for each frame, number of times to play);
  ryu.setFrameSequence(0, 2, .08, 1);
}
