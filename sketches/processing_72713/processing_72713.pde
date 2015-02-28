
//Please note - protagonist notKirby is also known as "Ball" throughout this code and commentary. Live free of perplexity!

class Arm { //Note I learned the hard way: any variables initialized here will only use the values from the first frame. If I need to update the variables, I must initialize them in a function into which I can pass the updated variables each frame.
  //xPos, yPos, width, height, start of arc (radians), end of arc (radians)
  float xPos;
  float yPos;
//  float xPos = notKirby.xPos-(10 * resizer); //These two are no longer necessary (replaced with the two above) because they would pull only the first value of xPos and yPos from the notKirby object. We need to update each frame so the parts move together, so we update the display function below with the coordinates and initialize them there.
//  float yPos = notKirby.yPos+(30 * resizer);
  float wide = notKirby.wide-(125 * resizer);
  float tall = notKirby.tall-(150 * resizer);
  float ang1 = notKirby.ang1;
  float ang2 = notKirby.ang2;

  /*
  Arm(float _xPos, float _yPos, float _wide, float _tall, float _ang1, float _ang2) { //Constructor - no longer needed because we are controlling all the variables through the main object, 'notKirby.'
   xPos = _xPos;
   yPos = _yPos;
   wide = _wide;
   tall = _tall;
   ang1 = _ang1;
   ang2 = _ang2;
   }
   */

  void display(float _xPos, float _yPos) {
    xPos = _xPos-(10 * resizer);
    yPos = _yPos+(30 * resizer);
    noFill();
    stroke(0); //Color
    strokeWeight(2 * resizer); //Thickness of arc
    if (direction==true) { //Character is facing to the right.
      if (notKirby.yVel == 0) { //Character is on a surface.
        arc(xPos, yPos, wide, tall, ang1, ang2);  // Draw arm down and to the left.
      }
      else { //Character is in the air.
        arc(xPos, yPos, wide, tall, -ang2, ang1);  // Draw arm up and to the left.
      }
    }
    else { //Character is facing to the left.
      if (notKirby.yVel == 0) { //Character is on a surface.
        arc(xPos+(20 * resizer), yPos, wide, tall, ang1, ang2);  // Draw arm down and to the right.
      }
      else { //Character is in the air.
        arc(xPos+(20 * resizer), yPos, wide, tall, -ang2, ang1);  // Draw arm up and to the right.
      }
    }
  }
}


