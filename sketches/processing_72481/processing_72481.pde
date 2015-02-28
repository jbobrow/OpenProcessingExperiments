
class Arm {
  //xPos, yPos, width, height, start of arc (radians), end of arc (radians)
  float xPos = notKirby.xPos-10;
  float yPos = notKirby.yPos+30;
  float wide = notKirby.wide-125;
  float tall = notKirby.tall-150;
  float ang1 = notKirby.ang1;
  float ang2 = notKirby.ang2;

  /*
  Arm(float _xPos, float _yPos, float _wide, float _tall, float _ang1, float _ang2) { //Constructor
   // - no longer needed because we are controlling all the variables through the main object, 'notKirby.'
   xPos = _xPos;
   yPos = _yPos;
   wide = _wide;
   tall = _tall;
   ang1 = _ang1;
   ang2 = _ang2;
   }
   */

  void display() {
    noFill();
    stroke(0); //Color
    strokeWeight(2); //Thickness of arc
    if (direction==true) { //Character is facing to the right.
      if (yVel == 0) { //Character is on a surface.
        arc(xPos, yPos, wide, tall, ang1, ang2);  // Draw arm down and to the left.
      }
      else { //Character is in the air.
        arc(xPos, yPos, wide, tall, -ang2, ang1);  // Draw arm up and to the left.
      }
    }
    else { //Character is facing to the left.
      if (yVel == 0) { //Character is on a surface.
        arc(xPos+20, yPos, wide, tall, ang1, ang2);  // Draw arm down and to the right.
      }
      else { //Character is in the air.
        arc(xPos+20, yPos, wide, tall, -ang2, ang1);  // Draw arm up and to the right.
      }
    }
  }
}


