
int elementsInX = 1200/100; //1200 is the width of my canvas, adjust if width is adjusted.
int elementsInY = 300/100; //300 is the height of my canvas, adjust if width is adjusted.
int numberOfElements = (elementsInX*elementsInY);
int selectedSquare = 0;
String paintFlavor = "";
String[] squareStatus = new String[numberOfElements];
float[] x1 = new float[numberOfElements];
float[] y1 = new float[numberOfElements];
float squareW;
float squareH;
int mousePresses = 0;
int mouseReleases = 0;

void setup() {
  size(1200, 300);
  // Font Variables
  PFont font;
  font = loadFont("Arial-BoldMT-48.vlw"); 
  textFont(font, 48);
  // initialize every square except the button squares to the string "none"
  for (int xElement=0; xElement<elementsInX; xElement++) {
    for (int yElement=0; yElement<elementsInY; yElement++) {
      squareStatus[xElement+(yElement*elementsInX)] = "none";
    }
  }
}

void buttonDrawer(int iButton, float xB, float yB, float wB, float hB) {
  // Determining button fill
  if (iButton%2 == 1) 
    fill(0);
  else 
    fill(255);
  rect(xB, yB, wB, hB);
}

void arrowDrawer(int iButton, float xA, float yA) {
  textAlign(CENTER);
  String buttonArrow = "";
  // Making the arrows for the buttons   
  if (iButton%2 == 0) 
    fill(0);
  else 
    fill(255);
  switch(iButton) {
  case 0: 
    buttonArrow = "↕";
    break;
  case 1: 
    buttonArrow = "↕";
    break;
  case 2: 
    buttonArrow = "↓↓";
    break;
  case 3: 
    buttonArrow = "↓↓";
    break;
  case 4: 
    buttonArrow = "↑↑";
    break;
  case 5: 
    buttonArrow = "↑↑";
    break;
  case 6: 
    buttonArrow = "↓";
    break;
  case 7: 
    buttonArrow = "↓";
    break;
  case 8: 
    buttonArrow = "↑";
    break;
  case 9: 
    buttonArrow = "↑";
    break;
  }  
  text(buttonArrow, xA, yA);
}

void draw() {
  // Button parameters
  squareW = width/12;
  squareH = height/3;

  // outer-empty squares for the buttons and the button interactions.
  fill(200);
  stroke(0);
  for (int i=0; i<12; i++) {
    for (int f=0; f<3; f++) {
      float xA = squareW*i;
      float yA = squareH*f;
      float xB = squareW*i+squareW;
      float yB = squareH*f+squareH;
      int selectedSquare = i+(f*elementsInX);
      rect(xA, yA, xB, yB);
      x1[selectedSquare] = xA;
      y1[selectedSquare] = yA;
    }
  }

  // inner squares of the buttons.
  noStroke();
  for (int j=0; j<10; j++) {
    // Drawing the buttons
    float squareX = squareW + (squareW*j) + (squareW*0.10);
    float squareY = squareH + (squareH*0.10);
    buttonDrawer(j, squareX, squareY, squareW*0.80, squareH*0.80);
    float arrowX = squareW*(j+1)+squareW/2;
    /* 
     * squareY is just squareH plus 10 percent of square of H to 
     * account for how text is placed on screen so that it gets 
     * centered with respect to the button.
     */
    float arrowY = squareH/2+squareY; 
    arrowDrawer(j, arrowX, arrowY);
  }
  goThroughAnimatedSquares();
}

void goThroughAnimatedSquares() {
  for (int xElement=0; xElement<elementsInX; xElement++) {
    for (int yElement=0; yElement<elementsInY; yElement++) {
      selectedSquare = xElement+(yElement*elementsInX);

      if (squareStatus[selectedSquare] == "mousePressedGoBlack") {
          fill(0);
          rect(x1[selectedSquare], y1[selectedSquare], squareW, squareH);
      }
      else if (squareStatus[selectedSquare] == "mousePressedGoWhite") {
          fill(255);
          rect(x1[selectedSquare], y1[selectedSquare], squareW, squareH);
      }
      
      if (squareStatus[selectedSquare] == "mouseClickedGoBlack") {
        //mouseClickedGoBlack will always be the opposite of mouseClickedGoWhite
        if (mousePresses % 2 == 0) fill(0);
        else fill(255);
        rect(x1[selectedSquare], y1[selectedSquare], squareW, squareH);
      }
      
      else if (squareStatus[selectedSquare] == "mouseClickedGoWhite") {
        //mouseClickedGoWhite will always be the opposite of mouseClickedGoBlack
        if (mousePresses % 2 == 0) fill(255);
        else fill(0);
        rect(x1[selectedSquare], y1[selectedSquare], squareW, squareH);
      }
      
      if (squareStatus[selectedSquare] == "mouseClickedGoBlackStay") {
        fill(0);
        rect(x1[selectedSquare], y1[selectedSquare], squareW, squareH);
      }
      
      else if (squareStatus[selectedSquare] == "mouseClickedGoWhiteStay") {
        fill(255);
        rect(x1[selectedSquare], y1[selectedSquare], squareW, squareH);
      }
      if (squareStatus[selectedSquare] == "mouseReleasedGoBlack") {
        if (mouseReleases % 2 == 0) fill(0);
        else fill(255);
        rect(x1[selectedSquare], y1[selectedSquare], squareW, squareH);
      }
      else if (squareStatus[selectedSquare] == "mouseReleasedGoWhite") {
        if (mouseReleases % 2 == 0) fill(255);
        else fill(0);
        rect(x1[selectedSquare], y1[selectedSquare], squareW, squareH);
      }
   
      else if (squareStatus[selectedSquare] == "mouseReleasedGoBlackStay") {
        fill(0);
        rect(x1[selectedSquare], y1[selectedSquare], squareW, squareH);
      }
      else if (squareStatus[selectedSquare] == "mouseReleasedGoWhiteStay") {
        fill(255);
        rect(x1[selectedSquare], y1[selectedSquare], squareW, squareH);
      }
      //In the case of mouseClickedGoWhite and mouseClickedGoBlack, I use the event handler mouseClicked below
    }
  }
}    


void mousePressed() {
  mousePresses++;
  int xElement = mouseX/(width/elementsInX);
  int yElement = mouseY/(height/elementsInY);
  int selectedSquare = xElement+(yElement*elementsInX);
  if ((xElement <= 0 || xElement >= elementsInX-1 || yElement == 0 || yElement == elementsInY-1) &&
      (paintFlavor == "mousePressedGoBlack" || 
       paintFlavor == "mousePressedGoWhite" ||
       paintFlavor == "mouseClickedGoBlack" || 
       paintFlavor == "mouseClickedGoWhite" ||
       paintFlavor == "mouseClickedGoBlackStay" ||
       paintFlavor == "mouseClickedGoWhiteStay"))
          squareStatus[selectedSquare] = paintFlavor;
}

void mouseReleased() {
  mouseReleases++;
  int xElement = mouseX/(width/elementsInX);
  int yElement = mouseY/(height/elementsInY);
  int selectedSquare = xElement+(yElement*elementsInX);
  if ((xElement <= 0 || xElement >= elementsInX-1 || yElement == 0 || yElement == elementsInY-1) &&
      (paintFlavor == "mouseReleasedGoBlack" || 
       paintFlavor == "mouseReleasedGoWhite" ||
       paintFlavor == "mouseReleasedGoBlackStay" || 
       paintFlavor == "mouseReleasedGoWhiteStay"))
          squareStatus[selectedSquare] = paintFlavor;
   // Had to choose between returning to none or returning to opposite color. Chose none.
   else if (paintFlavor == "mousePressedGoBlack") {
     squareStatus[selectedSquare] = "none";
   }
   else if (paintFlavor == "mousePressedGoWhite") {
     squareStatus[selectedSquare] = "none";
   }
}

void mouseClicked() {
  int xElement = mouseX/(width/elementsInX);
  int yElement = mouseY/(height/elementsInY);
  int selectedSquare = xElement+(yElement*elementsInX);
  if (xElement > 0 && xElement < elementsInX-1 &&
    yElement > 0 && yElement < elementsInY-1) 
  {
    switch(selectedSquare) {
    case 13: 
      paintFlavor = "mousePressedGoBlack";
      break;
    case 14:
      paintFlavor = "mousePressedGoWhite";
      break;
    case 15:
      paintFlavor = "mouseClickedGoBlack";
      break;
    case 16:
      paintFlavor = "mouseClickedGoWhite";
      break;
    case 17:
      paintFlavor = "mouseReleasedGoBlack";
      break;
    case 18: 
      paintFlavor = "mouseReleasedGoWhite";
      break;
    case 19:
      paintFlavor = "mouseClickedGoBlackStay";
      break;
    case 20: 
      paintFlavor = "mouseClickedGoWhiteStay";
      break;
    case 21:
      paintFlavor = "mouseReleasedGoBlackStay";
      break;
    case 22: 
      paintFlavor = "mouseReleasedGoWhiteStay";
      break;
    }
  }
}          



