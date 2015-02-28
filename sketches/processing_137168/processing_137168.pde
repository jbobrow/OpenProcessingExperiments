
/* @pjs preload="image.jpg"; */

/* ARTISTIC DESCRIPTION: 
the app is a coloring book. user picks colors and assigns them to 
areas of the main image they want filled with that color. A nice way
to be creative but also follow some rules */
/* this value is set as user clicks palette, and assigned to clicked area of main image */
color currentColor = color(255);
/* this tells draw() it is time to show the image. set to true when user presses S on the keyboard */
boolean pictureSaved = false;
/* set to the screenshot in real time as the user takes it */
PImage savedImage;
/* 60 different colors for the user to choose from and click */
colorSquare[] colorPalette = new colorSquare[60];
/* these squares will make up the main image to be colored in */
colorSquare[] mainSquares = new colorSquare[51];

String filename = "image.jpg";
void setup() {
  size(800, 640);
  /* creates the squares that make up the robot. only 
  positions and dimensions are set now, it is drawn later */
  createRobot();
  /* again, only position and dimensions set, drawn later */
  setupPalette();
  
  //File f = new File(dataPath(filename));
  //if (f.exists()) {
    savedImage = loadImage(filename);
  //} 
  
}
void draw() {
  /* VERY IMPORTANT SETTING! without this, palette won't disappear when taking the picture */
  background(255);
  /* next few lines draw the scene, each method with 
  their own variables that decide their attributes */
  drawPalette();
  drawImage();
  stroke(0);
  drawRobot();
  saveImage();
}
/* if the image has been created (by draw method when user presses 'S'),
it draws it on the top right. it creates the frame after to "frame" the image.
it also resets the palette to be visible, and resets the pictureSaved value so 
that image is not redrawn until it becomes true again */
void drawImage() {
  if(savedImage != null) {
    image(savedImage, 450, 20, 400, 320);
    drawFrame();
    rebuildPalette();
    pictureSaved = false;
  }
}
/* simple lines and rectangles to make screenshot 
look like a picture framed on the wall behind the robot */
void drawFrame() {
  //golden color
  fill(218,165,32);
  noStroke();
  // rectangles that make up the frame
  rect(530, 20, 230, 20);
  rect(530, 330, 230, 20);
  rect(530, 20, 20, 320);
  rect(740, 20, 20, 320);
  stroke(0);
  strokeWeight(2);
  // lines that make up the outlines of the frame
  line(530, 20, 530, 350);
  line(760, 20, 760, 350);
  line(530, 350, 760, 350);
  line(530, 20, 760, 20);
  line(760, 20, 740, 40);
  line(530, 20, 550, 40);
  line(550, 40, 740, 40);
  line(530, 350, 550, 330);
  line(550, 330, 550, 40);
  line(760, 350, 740, 330);
  line(550, 330, 740, 330);
  line(740, 330, 740, 40);
  strokeWeight(1);
  fill(0);
}
/* draws by looping mainSquares and creates rectangle for each iteration*/
void drawRobot() {
  for (int k = 0; k < mainSquares.length; k++) {
    fill(mainSquares[k].fillColor);
    rect(mainSquares[k].x, mainSquares[k].y, mainSquares[k].squareWidth, mainSquares[k].squareHeight);
  }
}
/* checks if user wanted to save image, and if true, it creates it and sets it to the variable */
void saveImage() {
  if(pictureSaved) {
     saveFrame(filename);
     savedImage = loadImage(filename);
  }
}

void mousePressed() {
  setCurrentColor();
  fillShapeSquare();
}
/* it loops through palette, and if mouse is over any of them, 
sets current color to corresponding color. it then exits the loop */
void setCurrentColor() {
  for (int i = 0; i < colorPalette.length; i ++) {
    if(mouseInColorSquare(colorPalette[i]) ) {
      currentColor = colorPalette[i].fillColor;
      break;
    }
  }
}
/* loops through squares that compose the robot, and if mouse is over
any of them, it sets its fill color to the current color value */
void fillShapeSquare() {
  for (int k = 0; k < mainSquares.length; k++) {
    if(mouseInColorSquare(mainSquares[k]) ) {
      mainSquares[k].fillColor = currentColor;
    }
  }
}
/* checks if mouse coordinates are within the area the square fills. if it is, 
the next step is to check if the clicked square is on top of others, 
so it can apply it to the correct one*/
boolean mouseInColorSquare(colorSquare square) {
  if (checkMousePosition(square)) {
    for (int k = 0; k < mainSquares.length; k++) {
      /* basically, if there is a higher index square that the mouse is over, it's the correct one */
      if(square.index != k) {
        if(mainSquares[k].index > square.index) {
          if (checkMousePosition(mainSquares[k])) {
            return false;
          }
        }
      }
    }
    return true;
  } else {
    return false;
  }
}
/* checks bounds of mouse coordinates by checking against the square dimension values */
boolean checkMousePosition(colorSquare square) {
  return mouseX >= square.x && mouseX <= square.x + square.squareWidth 
    && mouseY >= square.y && mouseY <= square.y + square.squareHeight;
}
void keyReleased() {
  /* temporarily changes x values of color palette squares, and sets the variable 
  that tells draw() to draw the palette squares at their new position and save the image */
  if(key == 's'|| key == 'S') {
    savedImage = null;
    destroyPalette();
    pictureSaved = true;
  }
}
/* it sets initial x and y, which are increased and reset in the loop. this 
method doesn't draw, it just sets the array to be drawn later. */
void setupPalette() {
  int spacingBetweenSquares = 40;
  int y = 25;
  int x = 10;
  int xIncrease = 0;
  /* spacing between horizontal squares */
  for (int i = 0; i < colorPalette.length; i++) {
    xIncrease += spacingBetweenSquares;
    if((i+1)% 4 == 0)
          xIncrease = 0;
    color fillColor = color(random(0, 255), random(0, 255), random(0, 255));
    colorSquare square = new colorSquare(x + xIncrease, y, 30, 30, i);
    square.fillColor = fillColor;
    colorPalette[i] = square;
    if((i + 1) % 4 == 0) {
      y += spacingBetweenSquares;
    }
  }
}
/* it creates rectangles for each color square in the color palette array */
void drawPalette() {
  for (int i = 0; i < colorPalette.length; i++) {
    fill(colorPalette[i].fillColor);
    rect(colorPalette[i].x, colorPalette[i].y, colorPalette[i].squareWidth, colorPalette[i].squareHeight);
  }
}
/* it simply sets the x position to be outside so that 
it temporarily disappears from the frame at next draw() loop */
void destroyPalette() {
  for (int i = 0; i < colorPalette.length; i++) {
    colorPalette[i].x = colorPalette[i].outOfBoundsX;
  }
}
/* it resets current x value to the original so that it reappears in frame */
void rebuildPalette() {
  for (int i = 0; i < colorPalette.length; i++) {
    colorPalette[i].x = colorPalette[i].permanentX;
  }
}
void createRobot() {
  //left leg
  mainSquares[0] = new colorSquare(300, 550, 80, 50);
  mainSquares[1] = new colorSquare(320, 450, 60, 100);
  //body
  mainSquares[2] = new colorSquare(300, 230, 180, 220);
  //right leg
  mainSquares[3] = new colorSquare(400, 550, 80, 50);
  mainSquares[4] = new colorSquare(400, 450, 60, 100);
  //left leg bands
  mainSquares[5] = new colorSquare(320, 480, 60, 15, 1);
  mainSquares[6] = new colorSquare(320, 520, 60, 15, 1);
  //right leg bands
  mainSquares[7] = new colorSquare(400, 480, 60, 15, 1);
  mainSquares[8] = new colorSquare(400, 520, 60, 15, 1);
  //bottom belly
  mainSquares[9] = new colorSquare(320, 380, 140, 50, 1);
  mainSquares[10] = new colorSquare(330, 392, 25, 25, 2);
  mainSquares[11] = new colorSquare(361, 392, 25, 25, 2);
  mainSquares[12] = new colorSquare(392, 392, 25, 25, 2);
  mainSquares[13] = new colorSquare(423, 392, 25, 25, 2);
  // top chest
  mainSquares[14] = new colorSquare(320, 250, 140, 100, 1);
  mainSquares[15] = new colorSquare(330, 260, 30, 80, 2);
  mainSquares[16] = new colorSquare(420, 260, 30, 80, 2);
  // middle top chest
  mainSquares[17] = new colorSquare(375, 260, 30, 20, 2);
  mainSquares[18] = new colorSquare(375, 290, 30, 20, 2);
  mainSquares[19] = new colorSquare(375, 320, 30, 20, 2);
  //head
  mainSquares[20] = new colorSquare(330, 110, 120, 120);
  //left eye
  mainSquares[21] = new colorSquare(350, 130, 30, 30, 1);
  //right eye
  mainSquares[22] = new colorSquare(400, 130, 30, 30, 1);
  //nose
  mainSquares[23] = new colorSquare(385, 170, 10, 10, 1);
  //mouth
  mainSquares[24] = new colorSquare(355, 190, 8, 17, 1);
  mainSquares[25] = new colorSquare(363, 195, 8, 17, 1);
  mainSquares[26] = new colorSquare(371, 200, 8, 17, 1);
  mainSquares[27] = new colorSquare(379, 205, 8, 17, 1);
  mainSquares[28] = new colorSquare(387, 205, 8, 17, 1);
  mainSquares[29] = new colorSquare(394, 205, 8, 17, 1);
  mainSquares[30] = new colorSquare(418, 190, 8, 17, 1);
  mainSquares[31] = new colorSquare(410, 195, 8, 17, 1);
  mainSquares[32] = new colorSquare(402, 200, 8, 17, 1);
  //antenna
  mainSquares[33] = new colorSquare(350, 75, 10, 35);
  mainSquares[34] = new colorSquare(420, 75, 10, 35);
  mainSquares[35] = new colorSquare(325, 65, 35, 10);
  mainSquares[36] = new colorSquare(420, 65, 35, 10);
  //left ear
  mainSquares[37] = new colorSquare(295, 150, 35, 15);
  mainSquares[38] = new colorSquare(450, 150, 35, 15);
  //left arm
  mainSquares[39] = new colorSquare(240, 250, 60, 40);
  mainSquares[40] = new colorSquare(240, 290, 40, 80);
  //left hand
  mainSquares[41] = new colorSquare(250, 370, 20, 15);
  mainSquares[42] = new colorSquare(240, 385, 40, 10);
  mainSquares[43] = new colorSquare(230, 385, 10, 40);
  mainSquares[44] = new colorSquare(280, 385, 10, 40);
  // right arm
  mainSquares[45] = new colorSquare(480, 250, 60, 40);
  mainSquares[46] = new colorSquare(500, 290, 40, 80);
  //right hand
  mainSquares[47] = new colorSquare(510, 370, 20, 15);
  mainSquares[48] = new colorSquare(500, 385, 40, 10);
  mainSquares[49] = new colorSquare(490, 385, 10, 40);
  mainSquares[50] = new colorSquare(540, 385, 10, 40);
}
class colorSquare {
  int outOfBoundsX = -100;
  int permanentX;
  int x;
  int y;
  color fillColor;
  int squareWidth;
  int squareHeight;
  boolean onTop;
  int index;
  colorSquare(int X, int Y, int squareWidth, int squareHeight) {
    this.x = X;
    this.permanentX = this.x;
    this.y = Y;
    this.fillColor = color(255);
    this.squareWidth = squareWidth;
    this.squareHeight = squareHeight;
    this.index = 0;
  }
  colorSquare(int X, int Y, int squareWidth, int squareHeight, int index) {
    this.x = X;
    this.y = Y;
    this.fillColor = color(255);
    this.squareWidth = squareWidth;
    this.squareHeight = squareHeight;
    this.index = index;
    this.permanentX = this.x;
  }
}


