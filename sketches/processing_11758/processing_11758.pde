
//this variable will be set by the colorSelector.
//You can refer to it in your code.
color selectedColor = color(0,0,0);

/*
this command establishes the colorSelectorProperties:
xPos, yPos, w & h define where it is drawn on the screen.
mode has three valid values: 0, 1, & 2. Try them...
the mode will also change based on Processing's colorMode(RGB -vs- HSB);
*/

void setupColorSelector(int xPos, int yPos, int w, int h, int mode) {
  colorSelectorXPosition = xPos;
  colorSelectorYPosition = yPos;
  colorSelectorWidth = w;
  colorSelectorHeight = h;
  colorSelectorMode = mode;
}

//this command causes the color selector to be draw on the screen
void drawColorSelector() {
  drawColorSelectorAndGuides();
}

/*
this command will compare the coords you pass it
(likely mouseX and mouseY) and cause the color
selector to respond.
*/
void colorSelectorHandleMouse(int x, int y) {
  if (coordsInsideColorSelector(x, y)) {
    setSelectedColorByCoords(x, y);
  }
}


