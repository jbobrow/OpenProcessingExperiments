



class Button {

  int bWidth;
  int bHeight;

  int locX;
  int locY;

  int fillColor;
  int borderColor;
  int borderWidth;
  int colorBrightness;

  boolean selStat;

  Button(int tempLocX, int tempLocY, int tempBWidth, int tempBHeight, int tempFillColor, int tempBrightness, int tempBorderColor, int tempBorderWidth, boolean tempStat) {

    selStat = tempStat;
    colorBrightness = tempBrightness;
    bWidth = tempBWidth;
    bHeight = tempBHeight;
    locX = tempLocX;
    locY = tempLocY;
    fillColor = tempFillColor;
    borderColor = tempBorderColor;
    borderWidth = tempBorderWidth;
  }


  void display() {

    fill(fillColor, colorBrightness, 255);
    stroke(255, 255, 0);

    if (selStat == true) {

      strokeWeight(borderWidth + 3);
    }
    else {

      strokeWeight(borderWidth);
    }

    rect(locX, locY, bWidth, bHeight);
  }

  boolean checkStatus() {

    if (mouseX > locX && mouseX < locX + bWidth && mouseY > locY && mouseY < locY + bHeight) {

      selStat = true;

      // selColor = fillColor;
      //selBrightness = colorBrightness;

      return true;
    }
    else {

      selStat = false;

      return false;
    }
  }
}


