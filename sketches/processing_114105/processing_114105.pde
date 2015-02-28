

void mousePressed() {
  if(mouseOnScreen()){
  db.fill(0, 10);
  db.rect(0, 0, canvasWidth, canvasHeight);
}
  if ((!mouseDown)&&(mouseOnScreen())) {
    mouseDown = true;
    mouseStartX = mouseX;
    mouseStartY = mouseY;
  }
}

void mouseReleased() {
  mouseDown = false;
  movingSingle = false;
  for (int k = 0; k<maxTileX;k++) {
    for (int j = 0; j<maxTileY;j++) {
      tile[k][j].offsetsSet = false;
    }
  }
}


void keyPressed() {
  // Toggles the visibility of the back buffer
  if (key == 'p') {
    bbToggle = !bbToggle;
  }
  // Hotkeys for buttons
  if (key == ' ') {
    resetButton.active = true;
  }
  if (key == 'g') {
    saveButton.active = true;
  }
  //Selection hotkeys
  if (key == 'a') {
      Button cb = (Button) selectButtonsList.get(0);
      cb.active = true;
      activeButton = "ALL";
      activeList = "Selects";
  }
  if (key == 's') {
      Button cb = (Button) selectButtonsList.get(1);
      cb.active = true;
      activeButton = "SOFT";
      activeList = "Selects";
  }
  if (key == 'd') {
      Button cb = (Button) selectButtonsList.get(2);
      cb.active = true;
      activeButton = "SINGLE";
      activeList = "Selects";
  }
  //Tools hotkeys
  if (key == 'q') {
      Button cb = (Button) buttonList.get(0);
      cb.active = !cb.active;
      activeButton = "MOVE";
      activeList = "Tools";
  }
  if (key == 'w') {
      Button cb = (Button) buttonList.get(1);
      cb.active = !cb.active;
      activeButton = "ROTATE";
      activeList = "Tools";
  }
  if (key == 'e') {
      Button cb = (Button) buttonList.get(2);
      cb.active = !cb.active;
      activeButton = "ZOOM";
      activeList = "Tools";
  }
  //Backgrounds hotkeys
  if (key == 'z') {
      Button cb = (Button) backgroundButtonsList.get(0);
      cb.active = true;
      activeButton = "BLACK";
      activeList = "Backgrounds";
  }
  if (key == 'x') {
      Button cb = (Button) backgroundButtonsList.get(1);
      cb.active = true;
      activeButton = "FADE";
      activeList = "Backgrounds";
  }
  if (key == 'c') {
      Button cb = (Button) backgroundButtonsList.get(2);
      cb.active = true;
      activeButton = "IMAGE";
      activeList = "Backgrounds";
  }
  if (key == 'v') {
      Button cb = (Button) backgroundButtonsList.get(3);
      cb.active = true;
      activeButton = "NONE";
      activeList = "Backgrounds";
  }
  // Number keys quickly assigning tileResolution
  if (key == '1') {
    resetResolution = 2;
    cp5.controller("resetResolution").setValue(resetResolution);
  }
  if (key == '2') {
    resetResolution = 2;
    cp5.controller("resetResolution").setValue(resetResolution);
  }
  if (key == '3') {
    resetResolution = 3;
    cp5.controller("resetResolution").setValue(resetResolution);
  }
  if (key == '4') {
    resetResolution = 4;
    cp5.controller("resetResolution").setValue(resetResolution);
  }
  if (key == '5') {
    resetResolution = 5;
    cp5.controller("resetResolution").setValue(resetResolution);
  }
  if (key == '6') {
    resetResolution = 7;
    cp5.controller("resetResolution").setValue(resetResolution);
  }
  if (key == '8') {
    resetResolution = 8;
    cp5.controller("resetResolution").setValue(resetResolution);
  }
  if (key == '9') {
    resetResolution = 9;
    cp5.controller("resetResolution").setValue(resetResolution);
  }
  if (key == '0') {
    resetResolution = 10;
    cp5.controller("resetResolution").setValue(resetResolution);
  }
}


