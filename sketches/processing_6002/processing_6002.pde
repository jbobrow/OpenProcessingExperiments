

//create monster aids
class aids {
  float aidsX;
  float aidsY;
  float speedAidsX;
  float speedAidsY;
  float aidsDiffx;
  float aidsDiffy;


  //aids behaviour
  aids() {
    aidsX = random(200, width-200);
    aidsY = random(200, height-200);
      if (redBloodHolder[0] != null) {
        aidsDiffx = abs(aidsX - redBloodHolder[0].redBloodX);
        aidsDiffy = abs(aidsY - redBloodHolder[0].redBloodY);
      } 
      else if (redBloodHolder[1] != null) {
        aidsDiffx = abs(aidsX - redBloodHolder[1].redBloodX);
        aidsDiffy = abs(aidsY - redBloodHolder[1].redBloodY);
      } 
      else if (redBloodHolder[2] != null) {
        aidsDiffx = abs(aidsX - redBloodHolder[2].redBloodX);
        aidsDiffy = abs(aidsY - redBloodHolder[2].redBloodY);
      } 
      else if (redBloodHolder[3] != null) {
        aidsDiffx = abs(aidsX - redBloodHolder[3].redBloodX);
        aidsDiffy = abs(aidsY - redBloodHolder[3].redBloodY);
      } 
      else if (redBloodHolder[4] != null) {
        aidsDiffx = abs(aidsX - redBloodHolder[4].redBloodX);
        aidsDiffy = abs(aidsY - redBloodHolder[4].redBloodY);
      } 
    }


  //aids character//display
  void aidsChar() {
ellipse(aidsX, aidsY, 10, 10);
    aidsX = aidsX + speedAidsX;
    aidsY = aidsY + speedAidsY;
    aidsDefineSpeed();
    aidsMovement();
    aidsBoundaries();
    aidsAttack();
  }


  //define speed for aids  
  void aidsDefineSpeed() {
    if (aidsDiffx >= aidsDiffy) {
      speedAidsX = (aidsDiffx/aidsDiffy)/2;
      speedAidsY = 0.5;
    } 
    else { 
      speedAidsX = 0.5;
      speedAidsY = (aidsDiffy/aidsDiffx)/2;
    }
  }


  //aids movements
  void aidsMovement() {
    if (redBloodHolder[0] != null) {
    if (aidsX > redBloodHolder[0].redBloodX) {
      speedAidsX = speedAidsX * -1;
    } 
    else if (aidsX < redBloodHolder[0].redBloodX) {
      speedAidsX = abs(speedAidsX);
    } 
    else {
      speedAidsX = 0;  
    }
    if (aidsY > redBloodHolder[0].redBloodY) {
      speedAidsY = speedAidsY * -1;
    } 
    else if (aidsY < redBloodHolder[0].redBloodY) {
      speedAidsY = abs(speedAidsY);
    } 
    else {
      speedAidsY = 0;
    }
    } else if (redBloodHolder[1] != null) {
    if (aidsX > redBloodHolder[1].redBloodX) {
      speedAidsX = speedAidsX * -1;
    } 
    else if (aidsX < redBloodHolder[1].redBloodX) {
      speedAidsX = abs(speedAidsX);
    } 
    else {
      speedAidsX = 0;  
    }
    if (aidsY > redBloodHolder[1].redBloodY) {
      speedAidsY = speedAidsY * -1;
    } 
    else if (aidsY < redBloodHolder[1].redBloodY) {
      speedAidsY = abs(speedAidsY);
    } 
    else {
      speedAidsY = 0;
    }
  } else if (redBloodHolder[2] != null) {
    if (aidsX > redBloodHolder[2].redBloodX) {
      speedAidsX = speedAidsX * -1;
    } 
    else if (aidsX < redBloodHolder[2].redBloodX) {
      speedAidsX = abs(speedAidsX);
    } 
    else {
      speedAidsX = 0;  
    }
    if (aidsY > redBloodHolder[2].redBloodY) {
      speedAidsY = speedAidsY * -1;
    } 
    else if (aidsY < redBloodHolder[2].redBloodY) {
      speedAidsY = abs(speedAidsY);
    } 
    else {
      speedAidsY = 0;
    }
  } else if (redBloodHolder[3] != null) {
    if (aidsX > redBloodHolder[3].redBloodX) {
      speedAidsX = speedAidsX * -1;
    } 
    else if (aidsX < redBloodHolder[3].redBloodX) {
      speedAidsX = abs(speedAidsX);
    } 
    else {
      speedAidsX = 0;  
    }
    if (aidsY > redBloodHolder[3].redBloodY) {
      speedAidsY = speedAidsY * -1;
    } 
    else if (aidsY < redBloodHolder[3].redBloodY) {
      speedAidsY = abs(speedAidsY);
    } 
    else {
      speedAidsY = 0;
    }
  } else if (redBloodHolder[4] != null) {
    if (aidsX > redBloodHolder[4].redBloodX) {
      speedAidsX = speedAidsX * -1;
    } 
    else if (aidsX < redBloodHolder[4].redBloodX) {
      speedAidsX = abs(speedAidsX);
    } 
    else {
      speedAidsX = 0;  
    }
    if (aidsY > redBloodHolder[4].redBloodY) {
      speedAidsY = speedAidsY * -1;
    } 
    else if (aidsY < redBloodHolder[4].redBloodY) {
      speedAidsY = abs(speedAidsY);
    } 
    else {
      speedAidsY = 0;
    }
  } else {
    speedAidsX = random(-1, 1);
    speedAidsY = random(-1, 1);
  }
}

//aids boundaries
void aidsBoundaries() {
   if (dist(width/2, height/2, aidsX, aidsY) > 350) {
      speedAidsX = speedAidsX * -10;
      speedAidsY = speedAidsY * -10;
    }
}

void aidsAttack() {
  if (redBloodHolder[0] != null) {
    if (dist(aidsX, aidsY, redBloodHolder[0].redBloodX, redBloodHolder[0].redBloodY) < 10) {
      redBloodHolder[0] = null;
    }
  }
  if (redBloodHolder[1] != null) {
    if (dist(aidsX, aidsY, redBloodHolder[1].redBloodX, redBloodHolder[1].redBloodY) < 10) {
      redBloodHolder[1] = null;
    }
  }if (redBloodHolder[2] != null) {
    if (dist(aidsX, aidsY, redBloodHolder[2].redBloodX, redBloodHolder[2].redBloodY) < 10) {
      redBloodHolder[2] = null;
    }
  }if (redBloodHolder[3] != null) {
    if (dist(aidsX, aidsY, redBloodHolder[3].redBloodX, redBloodHolder[3].redBloodY) < 10) {
      redBloodHolder[3] = null;
    }
  } if (redBloodHolder[4] != null) {
    if (dist(aidsX, aidsY, redBloodHolder[4].redBloodX, redBloodHolder[4].redBloodY) < 10) {
      redBloodHolder[4] = null;
    }
  }
}
}


