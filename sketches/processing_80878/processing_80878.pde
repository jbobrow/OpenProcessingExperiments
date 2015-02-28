
/*
Wyrm (P2)
 Aaron May, October, 2012
 yodazhalo@gmail.com
 
 This simple game is a more draconic version of "Snake",
 a TI-83 program that got me through pre-calc.
 */
 

/* General setup calls an 3-argument instance of the ResetFirst class.
 It will set canvas size, initialize variables and arrays, set 
 the starting position of the wyrm and the meat, and set the font
 */
void setup() {
  ResetFirst r = new ResetFirst(200, 100, 400);
  r.initialize();
  size(400,400);
}  //end setup function


/* declaring variables for the font, position integers for the wyrm and meat 
 positions, boolean conditions for failure and wyrm growth, float for 
 the speed increase, and the arrays for the wyrm's tail
 */
PFont font1;
int wyrmX, wyrmY, moveX, moveY, wyrmSize, meatX, meatY;
boolean fail, nom;
int []wyrmSegX;
int []wyrmSegY;
float s;


/* Run the draw function.  Set frame rate to s, clear the background, and
 run the gameOn function. 
 */
void draw() {
  frameRate(s);
  background(0);
  gameOn();
}  //end draw function


/* Begin checking for key press. Program accepts wasd and direction arrows
 if statements check to make sure you aren't already moving in that direction
 */
void keyPressed() {

  //When w or UP are pressed, the wyrm moves straight up
  if (key=='w' || keyCode==UP) {
    if (wyrmSegY[1] != wyrmSegY[0]-10) {
      moveY= -5;
      moveX= 0;
    }
  }

  //When a or LEFT are presed, the wyrm moves left
  if (key=='a' || keyCode==LEFT) {
    if (wyrmSegX[1] != wyrmSegX[0]-10) {
      moveY= 0;
      moveX= -5;
    }
  }

  //When s or DOWN are pressed, the wyrm moves down
  if (key=='s' || keyCode==DOWN) {
    if (wyrmSegY[1] != wyrmSegY[0]+10) {
      moveY= 5;
      moveX= 0;
    }
  }

  //When d or RIGHT are pressed, the wyrm moves right
  if (key=='d' || keyCode==RIGHT) {
    if (wyrmSegX[1] != wyrmSegX[0]+10) {
      moveY= 0;
      moveX= 5;
    }
  }
}  //end checking for key press


/* Begin gameOn function. As long as we haven't failed, we run functions to 
 draw and move the wyrm, draw and eat meat, and detect when the wyrm collides
 with itself or the walls
 */
void gameOn() {
  if (fail==false) {
    drawWyrm();
    wyrmMove();
    drawMeat();
    eatMeat();
    biteSelf();
    hitWall();
  }

  /*When the player has failed, type the GAME OVER message, and make buttons
  that allow the player to reset or quit
   */
  else {
    fill(255);
    text("GAME OVER", width/2, height/2);
    stroke(255);
    noFill();
    rectMode(CORNERS);
    
    //button to reset. If clicked, calls a 2-argument insance of the Reset class
    rect(width*0.3, height*0.15, width*0.7, height*0.3);
    text("reset", width/2, height*0.25);
    if (mouseX>width*0.3 && mouseX<width*0.7 && mouseY>height*0.15 && mouseY<height*0.3 && mousePressed) {
      Reset r = new Reset(width/2, round(height*0.8));
      r.initialize();
    }
    
    //button to quit. If clicked, calls a 0-argument instance of the Reset class
//    rect(width*0.3, height*0.7, width*0.7, height*0.85);
//    text("quit", width/2, height*0.8);
//    if (mouseX>width*0.3 && mouseX<width*0.7 && mouseY>height*0.7 && mouseY<height*0.85 && mousePressed) {
//      Reset r = new Reset();
//      r.fin();
//    }
  }
}  //end gameOn function


/* Begin drawWyrm function. draws green ellipses at positions using values
  in the wyrmSegX and wyrmSegY arrays
*/
void drawWyrm() {
  noStroke();
  fill(0, 128, 0);
  for (int i=0; i<wyrmSize; i++) {
    ellipse(wyrmSegX[i], wyrmSegY[i], 10, 10);
  }
  
  //shifts values up the array
  for (int i=wyrmSize; i>0; i--) {
    wyrmSegX[i] = wyrmSegX[i-1];
    wyrmSegY[i] = wyrmSegY[i-1];
  }
}  //end drawWyrm function


/* Begin wyrmMove function. Moves the wyrm based on values in the moveX and
  moveY variable
*/
void wyrmMove() {
  wyrmX += moveX;
  wyrmY += moveY;
  
  //stores the new values in the first array spots
  wyrmSegX[0] = wyrmX;
  wyrmSegY[0] = wyrmY;
}  //end wyrmMove function


/* Begin drawMeat function.  Draws meat as a brown square.  When nom is true, 
  assigns random value to meatX and meat Y so it spawns in a random spot.
*/
void drawMeat() {
  fill(222, 184, 135);
  if (nom==true) {
    meatX = (int)random(10, width-10);
    meatY = (int)random(10, height-10);
    
    //check to make sure the meat didn't spawn in a spot occupied by the wyrm
    for (int i=0; i<wyrmSize; i++) {
      if (meatX==wyrmSegX[i] && meatY==wyrmSegY[i]) {
        nom = true;
        i = wyrmSize;
      }
      
      //switch nom to false
      else {
        nom = false;
      }
    }
  }
  rectMode(CENTER);
  rect(meatX, meatY, 10, 10);
}  //end drawMeat function


/* Begin eatMeat function.  If the wyrm's x and y positions overlap the meat's
  postion, turn nom to true, increase the wyrmSize by 2, and increase framerate
  */
void eatMeat() {
  if (wyrmX+3 >= meatX-5 && wyrmX-3 <= meatX+5 && wyrmY+3 >= meatY-5 && wyrmY-3 <= meatY+5) {
    nom = true;
    wyrmSize++;
    wyrmSize++;
    s+=0.4;
  }
}   //end eatMeat function


/* Begin biteSelf function.  If the wyrm's x and y positions are the same as any
  part of the wyrm's tail, turn fail to true
*/
void biteSelf() {
  for (int i =1; i<wyrmSize; i++) {
    if (wyrmX == wyrmSegX[i] && wyrmY == wyrmSegY[i]) {
      fail = true;
    }
  }
}  //end biteSelf function


/*Begin hitWall fucntion. If the wyrm goes outside the boundaries of the frame,
  turn fail to true.
  */
void hitWall() {
  if (wyrmX<=-2 || wyrmX>=width+2 || wyrmY<=-2 || wyrmY>=height+2) {
    fail=true;
  }
}   //end hitWall function






/*
Wyrm (P2)
 Aaron May, October, 2012
 yodazhalo@gmail.com
 
Class for the game Wyrm
 */


/* Declare abstract class Constants. set booleans fail and nom to false
*/
abstract class Constants {
  Constants() {
    fail = false;
    nom = false;
  }
}  //end class Constants

/*
Wyrm (P2)
 Aaron May, October, 2012
 yodazhalo@gmail.com
 
Class for the game Wyrm
 */


/* Declare subclass Reset that extends abstract class Constants.  
*/
class Reset extends Constants {
  
  //declare properties
  int startMeatX;
  int startMeatY;
  
  //0-argument constructor for Reset
  Reset() {
  }

  //Thanks the player for playing if they click quit
  void fin() {
    stop();
    background(0);
    text("Thank You!", width/2, height/2);
  }
  
  //2-argument constructor for Reset
  Reset(int startMeatX, int startMeatY) {
    this.startMeatX = startMeatX;
    this.startMeatY = startMeatY;
  }

  /*Resets the game if the player clicks reset. Wyrm position, movement, speed, 
  and meat position all get reset.  Meat position will be defined when the
  object is created
  */
  void initialize() {
    noStroke();
    wyrmX = width/2;
    wyrmY = height/2;
    moveX = 0;
    moveY = 0;
    s = 10;
    wyrmSize = 1;
    meatX = this.startMeatX;
    meatY = this.startMeatY;
  }
}  //end subclass Reset

/*
Wyrm (P2)
 Aaron May, October, 2012
 yodazhalo@gmail.com
 
Class for the game Wyrm
 */
 
 
 /* Declare subclass ResetFirst that extends abstract class Reset
*/
class ResetFirst extends Reset {
  
  //declare properties
  int canvasSize;

  //3-argument constructor for ResetFirst
  ResetFirst(int startMeatX, int startMeatY, int canvasSize) {
    super(startMeatX, startMeatY);
    this.canvasSize = canvasSize;
  }

  /*Sets the game up.  This is used at program launch.  Wyrm postion,
  wyrm movement, speed, wyrm size, and font are set.  Animation smooth enabled
  Meat postion and canvas size will be defined when the object is created.
  */
  void initialize() {
    size(canvasSize, canvasSize);
    smooth();
    font1 = createFont("OCRAStd", height/10);
    textAlign(CENTER);
    textFont(font1);
    wyrmSegX = new int [300];
    wyrmSegY = new int [300];
    noStroke();
    wyrmX = width/2;
    wyrmY = height/2;
    moveY = 0;
    s = 10;
    wyrmSize = 1;
    meatX = this.startMeatX;
    meatY = this.startMeatY;
  }
}  //end subclass ResetFirst



