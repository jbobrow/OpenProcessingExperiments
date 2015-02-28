
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Exercise 9-8: Write a Button class (see Example 5-5 for a non-object-oriented button). The button 
// class should register when a mouse is pressed over the button and change color.  Create button objects 
// of different sizes and locations using an array. Before writing the main program, sketch out the 
// Button class. Assume the button is off  when it first appears.  

// Button class

//-------------------------------------------------------------------------------------------------------
//Credit to Colin for Explaining

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

    fill(fillColor, 79, colorBrightness);
    stroke(0, borderColor, 0);

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
      return true;
    }
    else {

      selStat = false;

      return false;
    }
  }
}


