

class ClassArrayCircle {
  float xpos;
  float ypos;
  float Bdiameter;
  color circlecolor;
  float xspeed;
  float yspeed;
  float xdirection;
  float ydirection;  
  float cursorToBallDistance;
  boolean wasItEverOnMe;  
  int blowBackStep;
  //int circleID; TEST

  ClassArrayCircle(
  float TEMP_xpos, 
  float TEMP_ypos, 
  float TEMP_diameter, 
  color TEMP_circlecolor, 
  float TEMP_xspeed, 
  float TEMP_yspeed, 
  float TEMP_xdirection, 
  float TEMP_ydirection, 
  int circleID                   
    ) {
    xpos = TEMP_xpos;
    ypos = TEMP_ypos;
    Bdiameter = TEMP_diameter;
    circlecolor = TEMP_circlecolor;
    xspeed = TEMP_xspeed;
    yspeed = TEMP_yspeed;
    xdirection = TEMP_xdirection;
    ydirection = TEMP_ydirection;
    wasItEverOnMe = false;
  }

  void display() {
    noStroke();
    fill(circlecolor);
    if (whichGeometricObject == 1) {
      ellipse(xpos, ypos, Bdiameter, Bdiameter);
    } else if (whichGeometricObject == 2) {
      rect(xpos, ypos, Bdiameter, Bdiameter);
    } else if (whichGeometricObject == 3) {
      triangle( 
      EqTriangle(xpos, ypos, Bdiameter, 'A', 'x'), EqTriangle(xpos, ypos, Bdiameter, 'A', 'y'), 
      EqTriangle(xpos, ypos, Bdiameter, 'B', 'x'), EqTriangle(xpos, ypos, Bdiameter, 'B', 'y'), 
      EqTriangle(xpos, ypos, Bdiameter, 'C', 'x'), EqTriangle(xpos, ypos, Bdiameter, 'C', 'y')
        );
    }
  }
  void move() {
    xpos = xpos + (xspeed * xdirection);
    ypos = ypos + (yspeed * ydirection);
    if (xpos >= 590 || xpos <= 0) {
      xdirection *= -1;
    }
    if (ypos >= height || ypos <= 0) {
      ydirection *= -1;
    }
  }
  void cursorG() {
    //blowBackTimer = 1;
    cursorToBallDistance = dist(xpos, ypos, mouseX, mouseY);
    if (cursorToBallDistance < 11) {
      cursorToBallDistance = 10;
    }
    if (cursorToBallDistance <= mouseGravity && cursorToBallDistance > 10) {

      xpos = xpos - (((xpos - mouseX)/cursorToBallDistance)*2.5);
      ypos = ypos - (((ypos - mouseY)/cursorToBallDistance)*2.5);
    } 
    else if (cursorToBallDistance <= 10) {
      println("noMovement");  
      xpos = mouseX;
      ypos = mouseY;
    }
    
     
  }

  void counter() {
    if (cursorToBallDistance <= 10 && wasItEverOnMe == false) {
      wasItEverOnMe = true;
      collected++;
    }
    else if (cursorToBallDistance > 10 && wasItEverOnMe == true) {
      collected--;
      wasItEverOnMe = false;
    }
  }
}//END OF CLASS      

