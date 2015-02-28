
/*
| BUTTONS class - allows the creation of a new button with name and a defined area
*/

class Buttons {

  int btnX;
  int btnY;
  int btnSizeX;
  int btnSizeY;
  String btnName;
  String btnText;
  Boolean btnActive;

  Buttons(String name, String txt, int x, int y, int sizeX, int sizeY, Boolean activate) {
    // construct the object with given parameters
    btnName = name;
    btnText = txt;
    btnX = x;
    btnY = y;
    btnSizeX = sizeX;
    btnSizeY = sizeY;
    btnActive = activate;
  }

  String click() {
    // check if the button is clicked and return his name
    if (btnActive == true && mousePressed && mouseX > btnX-btnSizeX/2 && mouseX < btnX+btnSizeX/2 && mouseY > btnY-btnSizeY/2 && mouseY < btnY+btnSizeY/2) {
      return btnName;
    } 
    else {
      return null;
    }
  }
  
  void display() {
    // show the button text
    if (btnActive && btnText != "") {
    noStroke();
    fill(255, 50);
    rectMode(CENTER);
    rect(btnX, btnY, btnSizeX, btnSizeY);
    // and background of button
    fill(255, 200);
    textFont(ABC, float(2*(btnSizeY/3)));
    textAlign(CENTER, CENTER);
    text(btnText, btnX, btnY-btnSizeY/10);
    }
  }
}


