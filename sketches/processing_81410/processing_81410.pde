
/*
 **  Bug.pde
 **  Created by Xiaolan Wang
 **  October 13th, 2012
 **  xiaolanw@sfu.ca
 **  
 **  This Bug class is subclass of Insect
 **  It provide bugs for spider to eat
 **  There are two methods display() and fly(), which implement the abstract ones in superclass Insect
 */

class Bug extends Insect {
  // constructor
  Bug (PImage img, int lives, float xpos, float ypos, float speed, int score) {
    // call to superclass constructor
    super(img, lives, xpos, ypos, speed, score);
  }

  /* required method implementation from abstract Insect superclass
   display img with the image() function
   the position of upper-lest corner of the image is (xpos, ypos),
   and its size is 90 * 60 pixels
   */
  void display() {
    image(img, xpos, ypos, 90, 60);
  }

  /* required method implementation from abstract Insect superclass
   move to the right, when xpos can be diveded by 10, ypos changes value
   by adding a random value between -5 and 5
   */
  void fly() {
    xpos = xpos + 2*speed; 
    if (xpos%10 == 0) {
      ypos = ypos + random(-5, 5);
    }
    /* if the xpos of the upper-corner is superier to width of the window
     assign -10 to xpos, which means to fly again from out of the left side of the window
     */
    if (xpos > width ) {
      xpos = -10;
    }
  }
}


