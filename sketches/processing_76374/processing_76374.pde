
//Initialising the circle button class >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Button circle;
Button[] bubbles = new Button[30];


//Initialising the square button class >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
SquareButton bigsquare;
SquareButton carwindow;
SquareButton[] smallsquare = new SquareButton[10];

//Initialising the BG animation buttons class >>>>>>>>>>>>>>>>>>>>>>>>>
BG[] ani = new BG[5];


//Setting the various screens as variables >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
boolean[] level = new boolean[20];
boolean[] levelcomplete = new boolean[20];
boolean startscreen = true;
boolean gameend = false;


//Defining the images being used as backgrounds >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
PImage start;
PImage[] Level = new PImage[20];


//Defining the images being used as objects >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
PImage begin;

// Initialising a font class for use later >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
PFont scenefont;


//Defines the fill colours of the various shapes within the game >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
color trianglefill = color (120, 240, 90);
color correct = color (255, 0, 0);


//Square fills and stroke colours >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
color bigsquarefill = color (255, 90, 152);
color bigsquarestroke = color (255, 90, 152);
color carwindowfill = color (196, 233, 242);
color carwindowstroke = color (196, 233, 242);
color smallsquarefill = color (40, 70, 255);
color[] smallsquarestroke = new color[12];


//Circle fills and stroke colours>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
color circlefill = color(255, 212, 40);
color smallcirclefill = color (120, 45, 200);
color bigcirclestroke = color (255, 212, 40);
color smallcirclestroke = color (0);
color bubblesfill = color (0, 0, 255, 5);
color[] bubblesstroke = new color[10];
color shipwindowfill = color (95, 221, 243);
color[] shipwindowstroke = new color [4];

color bgcolor = color (0);


//Defining the variable ssqd as the small squares size and giving it value >>>>>>>>>>>>
int ssqd = 30;

//Defining the variables for the endgame background
int sx=0;
int sy=0;
int sangle=0;

int cx=0;
int cy=0;
int cangle=0;

//Setting the variables required for the moving text in scene1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>
float text1x = 150;
float text1y = 70;
float text1a = (0);


//Setting the variables required for the moving text in scene2   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
float textx=150;
float texty=70;
float texta=(0);


//Begin the setup function of the program ---------------------------------------------------------------------------
void setup() {

  //Defining the size of the program >>>>>>>>>>>>>>>
  size (1000, 600);
  //Defining the initial background colour of the program >>>>>>>>>>>>>>>>>>>>
  background(0);
  //Adds the smooth effect to the entire program >>>>>>>>>>>>>>>>>>>>>>>>>>
  smooth(); 

  //This sets the rate at which the game will refresh it's frames (in fps) >>>>>>>>>>>>>>>>
  frameRate(40);

  //Giving the font class a value and seeing the current font to the newly loaded font >>>>>>>>>>>>>>>
  scenefont = loadFont("AgencyFB-Reg-48.vlw");
  textFont(scenefont, 40);

  //This command will set all the level "variables" to false before the game begins >>>>>>>>>>>>>>>>
  for (int l=0; l<level.length; l++) {
    level[l] = false;
  }

  //This command sets the level complete variables to false before the game begins >>>>>>>>>>>>>>>>>>>
  for (int l=0; l<levelcomplete.length; l++) {
    levelcomplete[l] = false;
  }

  //Setting the colour of the small square strokes to the same colour >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  for (int ii=0; ii <smallsquarestroke.length;ii++) {
    smallsquarestroke[ii] = color (255, 0, 255);
  }

  //Giving values to the bubblestroke arrays
  for (int bsi=0; bsi < bubblesstroke.length; bsi++) {
    bubblesstroke[bsi] = color (10, 50, 255);
  }


  //Giving values to the shipwindowstroke
  for (int swsi=0; swsi < shipwindowstroke.length; swsi++) {
    shipwindowstroke[swsi] = color (244, 210, 94);
  }


  /*Initialising the circle class and sends it the required attributes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
   All attributes are passed in the format:- 
   (X Coordinate, Y Coordinate, Diameter/Size, Fill color of the object, Stroke colour of the object) */
  circle = new Button(560, 425, 150, circlefill, bigcirclestroke, 1);


  //Defining all the bubbles for scene 3 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  bubbles[1] = new Button(125, 144, 17, bubblesfill, bubblesstroke[1], 3);
  bubbles[2] = new Button(140, 170, 10, bubblesfill, bubblesstroke[2], 3);
  bubbles[3] = new Button(165, 179, 17, bubblesfill, bubblesstroke[3], 3);
  bubbles[4] = new Button(180, 210, 18, bubblesfill, bubblesstroke[4], 3);
  bubbles[5] = new Button(195, 150, 10, bubblesfill, bubblesstroke[5], 3);
  bubbles[6] = new Button(250, 182, 16, bubblesfill, bubblesstroke[6], 3);
  bubbles[7] = new Button(275, 100, 9, bubblesfill, bubblesstroke[7], 3);
  bubbles[8] = new Button(300, 75, 12, bubblesfill, bubblesstroke[8], 3);


  /* Defining the three ship windows for scene 3. The bubbles array was used because >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
   the class wouldn't accept a second array*/
  bubbles[21] = new Button(430, 450, 50, shipwindowfill, shipwindowstroke[1], 5);
  bubbles[22] = new Button(580, 450, 50, shipwindowfill, shipwindowstroke[2], 5);
  bubbles[23] = new Button(730, 450, 50, shipwindowfill, shipwindowstroke[3], 5);


  //Defining any squares required >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  bigsquare = new SquareButton(50, 350, 150, bigsquarefill, bigsquarestroke, 1);
  carwindow = new SquareButton(1, 390, 80, carwindowfill, carwindowstroke, 0);
  smallsquare[1] = new SquareButton(700, 420, ssqd, smallsquarefill, smallsquarestroke[1], 1);
  smallsquare[2] = new SquareButton(730, 420, ssqd, smallsquarefill, smallsquarestroke[2], 1);
  smallsquare[3] = new SquareButton(700, 450, ssqd, smallsquarefill, smallsquarestroke[3], 1);
  smallsquare[4] = new SquareButton(730, 450, ssqd, smallsquarefill, smallsquarestroke[4], 1);
  smallsquare[5] = new SquareButton(850, 420, ssqd, smallsquarefill, smallsquarestroke[5], 1);
  smallsquare[6] = new SquareButton(880, 420, ssqd, smallsquarefill, smallsquarestroke[6], 1);
  smallsquare[7] = new SquareButton(850, 450, ssqd, smallsquarefill, smallsquarestroke[7], 1);
  smallsquare[8] = new SquareButton(880, 450, ssqd, smallsquarefill, smallsquarestroke[8], 1);


  //Defining the midscreen animation objects
  // (x coord, y coord, size(d), a1(speed), a2 (the angle at which the xcoord changes, a3 multiplier)
  ani[1] = new BG(0, 0, 40, 0, 0.1, 1);
  ani[2] = new BG(0, 0, 40, 0, 0.1, -1);


  //loading the begin button and resizing it to fit >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  begin = loadImage("beginButton.jpeg");
  begin.resize(200, 80);

  //loading the start screen and resizing it to fit >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 
  start = loadImage("StartScreen.png");
  start.resize(width, height);

  //loading the level one screen and resizing it to fit >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Level[1] = loadImage("FindCircle.png");
  Level[1].resize(width, height);

  //loading the level 1.1 screen and resizing it to fit >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Level[11] = loadImage("FindSquare.png");
  Level[11].resize(width, height);

  //loading the level 1.2 screen and resizing it to fit >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Level[12] = loadImage("FindTriangle.png");
  Level[12].resize (width, height);

  //loading the level 2 background and resizing it to fit >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Level[2] = loadImage("Scene1.png");
  Level[2].resize (width, height);

  //loading the level 3 background and resizing it to fit >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Level[3] = loadImage("CircleScene.png");
  Level[3].resize (width, height);
}

//Beginning the draw function, the main body of the program -----------------------------------------------------------------------------
void draw() {

  //Loading up the start screen for the game >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  if (startscreen == true) {
    background(start);
    image(begin, 400, 400);
  }
  //Loading up level 1 screen and objects >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  if (level[1] == true) {
    background(Level[11]);
    bigsquare.rendersquare();
  }
  //Loading up level 1.1 screen and objects >>>>>>>>>>>>>>>>>>>>>>>>>>
  if (level[11] == true) {
    background(Level[1]);
    circle.rendercircle();
  }
  //Loading up level 1.2 screen and objects >>>>>>>>>>>>>>>>>>>>>>>>>>>>
  if (level[12] == true) {
    background(Level[12]);
    drawTriangle();
  }

  if (levelcomplete[1] == true) {
    background(bgcolor);
    ani[1].renderani();
    ani[2].renderani();
    displaylvl1text();
  }
  //Loading up level 2 screen and objects >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  if (level[2] == true) {
    background(Level[2]);   
    displayScene1text();    
    carwindow.rendersquare();
    for (int i=1; i< 9; i++) {
      smallsquare[i].rendersquare();
    }
  }
  //Loading up the level 2 completion screen
  if (levelcomplete[2] == true) {
    background(bgcolor);
    ani[1].renderani();
    ani[2].renderani();
    displaylvl2text();
  }

  //Loading up level 3 screen and objects >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  if (level[3] == true) {
    background(Level[3]);
    displayScene2text();

    for (int bc=1; bc < 9; bc++) {
      bubbles[bc].rendercircle();
    }

    for (int swi=21; swi<24; swi++) {
      bubbles[swi].rendercircle();
    }
  }

  //Loading up gameend screen and objects >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  if (gameend == true) {
    background(bgcolor, 4);
    gameendtext();
    renderendgamesq();
    renderendgamecirc();
  }
}

//Defining the class "Button" for use with the circle.----------------------------------------------------------------------------------------------------------------
class Button {
  int x=0;
  int y=0;
  int d=0;
  color circlefill = color (0);
  color circlestroke = color (0);
  int circstrokeweight =0;


  //Constructor for the Button class, defining the varibles included within >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  public Button(int circlex, int circley, int circled, color circlefill, color circlestroke, int circstrokeweight) {
    this.x = circlex;
    this.y = circley;
    this.d = circled;
    this.circlefill = circlefill;
    this.circlestroke = circlestroke;
    this.circstrokeweight = circstrokeweight;
  }

  //The render function. When called, this will draw the ellipse included. >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  public void rendercircle() {
    strokeWeight(circstrokeweight);
    stroke (circlestroke);
    fill (circlefill);
    ellipse(x, y, d, d);
  }
  // This public function within the square class is used to update the desired elements of the square objects when criteria are met outwith the class >>>>>>>>>>>>>>>>>>>>>
  public void circleupdate() {    
    circlestroke = color(255, 0, 0);
    circstrokeweight = 5;
  }
}

//Defining the square class        ##############################
class SquareButton {
  int x=0;
  int y=0;
  int d=0;
  color squarefill = color(0);
  color squarestroke = color (0);
  int sqstrokeweight = 0;

  //Constructor for the square class >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  public SquareButton(int squarex, int squarey, int squared, color squarefill, color squarestroke, int sqstrokeweight) {
    this.x = squarex;
    this.y = squarey;
    this.d = squared;
    this.squarefill = squarefill;
    this.squarestroke = squarestroke;
    this.sqstrokeweight = sqstrokeweight;
  }

  //Function which will render the squares >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  public void rendersquare() {
    strokeWeight(sqstrokeweight);
    stroke(squarestroke);
    fill (squarefill);
    rect(x, y, d, d);
  }

  // This public function within the square class is used to update the desired elements of the square objects when criteria are met outwith the class >>>>>>>>>>>>>>>>>>>>>
  public void squareupdate() {    
    squarestroke = color(255, 0, 0);
    sqstrokeweight = 5;
  }
}


//Class Animation objects
class BG {
  float x =0;
  float y=0;
  int d =0;
  float a1=0;
  float a2=0;
  float a3=0;

  //Constructor for the class BG
  public BG(float x, float y, int d, float a1, float a2, float a3) {
    this.x = x;
    this.y = y;
    this.d = d;
    this.a1 = a1;
    this.a2 = a2;
    this.a3 = a3;
  }
  // This is the function that is called to render the animated circles for the completed scenes
  public void renderani() {
    strokeWeight(2);
    stroke(255, 0, 150);
    fill(255,0,150,60);
    pushMatrix();
    translate(width/2, height/2);
    rotate(a1);
    ellipse(x, y, d, d);
    a1+=(map(mouseY, 0, height, 0, 0.5));
    x+= cos(radians(a2))*a3;
    a2+=(map(mouseX, 0, width, 0.2, 0.5));
    popMatrix();
  }
}

void keyPressed() {

  //Button detection to check if the user has pressed space to continue the level
  if ((keyPressed) && (keyCode == 32) && levelcomplete[1] == true) {
    levelcomplete[1] = false;
    level[2] = true;
  } 

  //Button detection to check if the user has pressed space to continue the level
  if ((keyPressed) && (keyCode == 32) && levelcomplete[2] == true) {
    levelcomplete[2] = false;
    level[3] = true;
  }

  if ((keyPressed) && (keyCode == 32) && gameend == true) {
    exit();
  }
}

//This is the mousepressed function. Whenever the mouse is pressed, the game will divert to this function to check if the critera matches any of the statements below ----------------------------------------
void mousePressed() {

  //Obtains the colour of the pixel which the mouse pointer is currently hovering over
  color cc = get(mouseX, mouseY);


  //Defines the "Begin" button to advance the user onto the next level
  if ( (mousePressed)&&(mouseY > 400) && (mouseY < 480) && (mouseX < 600) && (mouseX >400)) {
    level[1] = true;
    startscreen = false;
  }
  //Defines the circle button in the level for the user to click
  if ((mousePressed) && (level[11] == true) && (dist(560, 425, mouseX, mouseY) <75)) {
    level[11] = false;
    level[12] = true;
  }

  if ((mousePressed) && (level[1] ==true) && (cc == bigsquarefill)) {
    level[1] = false;
    level[11] = true;
  }

  if ((mousePressed) && (level[12] == true) && (cc == trianglefill)) {
    level[12] = false;
    levelcomplete[1] = true;
  }

  //#########################################################
  //Collision detection for level 2 squares - Start
  //#########################################################


  //Collision detection for square 1
  if ( (mousePressed) && 
    (mouseX >700) && (mouseX < 730) && 
    (mouseY >420) && (mouseY <450)&& (level[2] == true) ) {
    smallsquarestroke[1] = color (correct);
    smallsquare[1].squareupdate();
  }

  //Collision detection for square 2
  if ( (mousePressed) &&
    (mouseX > 730) && (mouseX < 760) &&
    (mouseY > 420) && (mouseY <450)&& (level[2] == true) ) {
    smallsquarestroke[2] = color (correct);
    smallsquare[2].squareupdate();
  }

  //Collision detection for square 3
  if ( (mousePressed) &&
    (mouseX > 700) && (mouseX < 730) &&
    (mouseY > 450) && (mouseY <480)&& (level[2] == true) ) {
    smallsquarestroke[3] = color (correct);
    smallsquare[3].squareupdate();
  }

  //Collision detection for square 4
  if ( (mousePressed) &&
    (mouseX > 730) && (mouseX < 760) &&
    (mouseY > 450) && (mouseY <480)&& (level[2] == true) ) {
    smallsquarestroke[4] = color (correct);
    smallsquare[4].squareupdate();
  }

  //Collision detection for square 5
  if ( (mousePressed) &&
    (mouseX > 850) && (mouseX < 880) &&
    (mouseY > 420) && (mouseY <450)&& (level[2] == true) ) {
    smallsquarestroke[5] = color (correct);
    smallsquare[5].squareupdate();
  }

  //Collision detection for square 6
  if ( (mousePressed) &&
    (mouseX > 880) && (mouseX < 910) &&
    (mouseY > 420) && (mouseY <450)&& (level[2] == true) ) {
    smallsquarestroke[6] = color (correct);
    smallsquare[6].squareupdate();
  }

  //Collision detection for square 7
  if ( (mousePressed) &&
    (mouseX > 850) && (mouseX < 880) &&
    (mouseY > 450) && (mouseY <480)&& (level[2] == true) ) {
    smallsquarestroke[7] = color (correct);
    smallsquare[7].squareupdate();
  }

  //Collision detection for square 8
  if ( (mousePressed) &&
    (mouseX > 880) && (mouseX < 910) &&
    (mouseY > 450) && (mouseY <480)&& (level[2] == true) ) {
    smallsquarestroke[8] = color (correct);
    smallsquare[8].squareupdate();
  }

  //Collision detection for Car Window 
  if ( (mousePressed) &&
    (mouseX > 1) && (mouseX < 81) &&
    (mouseY > 390) && (mouseY <470) && (level[2] == true)) {
    carwindowstroke = color (correct);
    carwindow.squareupdate();
  }

  //Collision detection for all squares
  if (smallsquarestroke[1] == color (correct) && smallsquarestroke[2] == color (correct)&&
    smallsquarestroke[3] == color (correct) && smallsquarestroke[4] == color (correct) &&
    smallsquarestroke[5] == color (correct) && smallsquarestroke[6] == color (correct) &&
    smallsquarestroke[7] == color (correct) && smallsquarestroke[8] == color (correct) &&
    carwindowstroke == color (correct)) {
    level[2] = false;
    levelcomplete[2] = true;
  }
  //#########################################################
  //Level 2 collision detection and level selection complete
  //#########################################################


  //###########################################
  //Level 3 circle collision detection - Start
  //###########################################


  //Collision detection for cicle 1
  if ( (mousePressed) && (dist(125, 144, mouseX, mouseY) <8)&& (level[3] == true) ) {
    bubblesstroke[1] = color (correct);
    bubbles[1].circleupdate();
  }
  //Collision detection for cicle 2
  if ( (mousePressed) &&
    (dist(140, 170, mouseX, mouseY) <5)&& (level[3] == true) ) {
    bubblesstroke[2] = color (correct);
    bubbles[2].circleupdate();
  } 
  //Collision detection for cicle 3
  if ( (mousePressed) &&
    (dist(165, 179, mouseX, mouseY) <8) && (level[3] == true) ) {
    bubblesstroke[3] = color (correct);
    bubbles[3].circleupdate();
  }
  //Collision detection for cicle 4
  if ( (mousePressed) &&
    (dist(180, 210, mouseX, mouseY) <9)&& (level[3] == true) ) {
    bubblesstroke[4]  = color (correct);
    bubbles[4].circleupdate();
  }
  //Collision detection for cicle 5
  if ( (dist(195, 150, mouseX, mouseY) <5)&& (level[3] == true) ) {
    bubblesstroke[5]  = color (correct);
    bubbles[5].circleupdate();
  }
  //Collision detection for cicle 6
  if ( (mousePressed) &&
    (dist(250, 182, mouseX, mouseY) <8)&& (level[3] == true) ) {
    bubblesstroke[6]  = color (correct);
    bubbles[6].circleupdate();
  }
  //Collision detection for cicle 7
  if ( (mousePressed) &&
    (dist(275, 100, mouseX, mouseY) <5)&& (level[3] == true) ) {
    bubblesstroke[7]  = color (correct);
    bubbles[7].circleupdate();
  }
  //Collision detection for cicle 8
  if ( (mousePressed) &&
    (dist(300, 75, mouseX, mouseY) <6)&& (level[3] == true) ) {
    bubblesstroke[8]  = color (correct);
    bubbles[8].circleupdate();
  }
  //Collision detection for Ship Window 1
  if ( (mousePressed) &&
    (dist(430, 450, mouseX, mouseY) <25)&& (level[3] == true) ) {
    shipwindowstroke[1]  = color (correct);
    bubbles[21].circleupdate();
  }
  //Collision detection for cicle 10
  if ( (mousePressed) &&
    (dist(580, 450, mouseX, mouseY) <25)&& (level[3] == true) ) {
    shipwindowstroke[2]  = color (correct);
    bubbles[22].circleupdate();
  }
  //Collision detection for cicle 11
  if ( (mousePressed) &&
    (dist(730, 450, mouseX, mouseY) <25)&& (level[3] == true) ) {
    shipwindowstroke[3]  = color (correct);
    bubbles[23].circleupdate();
  }


  if (bubblesstroke[1] == color (correct) && bubblesstroke[2] == color (correct)&&
    bubblesstroke[3] == color (correct) && bubblesstroke[4] == color (correct) &&
    bubblesstroke[5] == color (correct) && bubblesstroke[6] == color (correct) &&
    bubblesstroke[7] == color (correct) && bubblesstroke[8] == color (correct) &&
    shipwindowstroke[1] == color (correct)&& shipwindowstroke[2] == color (correct)&& shipwindowstroke[3] == color (correct)) {

    level[3] = false;
    gameend = true;
  }
  //###################################################
  //Level 3 circle collision detection end
  //###################################################
}



//Drawing the triangle required for level 1.2---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void drawTriangle() {
  noStroke();
  fill(trianglefill);
  triangle(400, 375, 475, 525, 325, 525);
}

//Text displayed upon completion of level 1
void displaylvl1text() {

  fill(255);
  text("Well done! You completed the training missions.", 200, 300);
  text("Press the Space bar to continue to level 1", 200, 400);
}

//Text displayed upon completion of level 2
void displaylvl2text() {
  fill(255);
  text("Well done! You completed level one!", 20, 250);
  text("Press the Space bar to continue to level 2", 200, 350);
}

//The function to display the text for scene1----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void displayScene1text() {

  fill(255, 150, 100);
  text("Can you find the 9 squares?", text1x, text1y);

  text1x += cos(radians(text1a));
  text1y += sin(radians(text1a));

  text1a +=2;
}


//The function to display the text for scene2 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void displayScene2text() {


  fill(255, 255, random(255));
  text("Can you find the 11 circles?", textx, texty);

  textx += cos(radians(texta));
  texty += sin(radians(texta));

  texta += 2;
}

void gameendtext() {
  fill(90, 255, random(250));
  text("Well done! You've completed the game!", 250, 250);
  text("Press space bar to exit the program", 300, 300);
}

void renderendgamesq() {
  if (sx < width) {
    if (sy < height) {
      translate(width/2, height/2);
      smooth();
      strokeWeight(3);
      stroke(random(255), random(255), random (255));
      noFill ();
      rotate(radians(sangle));
      rectMode(CENTER);
      rect (0, 0, sx, sy);
      sx = (sx+20);
      sy = (sy+20);
      sangle = sangle+15;
    }
  }

  if (sx == width || sy == height) {
    sy = 0;
    sx = 0;
    sangle+=1;
  }
}

void renderendgamecirc() {
  if (cx < width) {
    if (cy < height) {
      smooth();
      strokeWeight(3);
      stroke(random(255), random(255), random (255));
      noFill ();
      ellipse (0, 0, cx, cy);
      cx = (cx+15);
      cy = (cy+15);
    }
  }

  if (cx == width || cy == height) {
    cy = 0;
    cx = 0;
  }
}


