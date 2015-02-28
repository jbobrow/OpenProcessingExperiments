
/* @pjs preload="rageMan.jpg", "Lose.jpg", "Win.jpg", "Background.jpg"; */

// CONNECT THE NUMBERS
// Daniel Jovanov, 19 February 2013
PFont font; // declare font variable
PImage Lose;
PImage Background;
PImage Bomb;
PImage Win;
int numberOfCircles = 5;
int numberOfBombs = 9;
int i; // for loop
int score = 0;

int numberCircleX; // x-coordinate for creating ellipse/bomb
int numberCircleY; // y-coordinate for creating ellipse/bomb

int[] circleNumberX = new int[numberOfCircles]; // x-coordinate of 'i'th ellipse
int[] circleNumberY = new int[numberOfCircles]; // y-coordinate of 'i'th ellipse
int[] bombNumberX = new int[numberOfBombs]; // x-coordinate of 'i'th bomb
int[] bombNumberY = new int[numberOfBombs]; // y-coordinate of 'i'th bomb

void setup() {
  size(500, 500);
  Background = loadImage("Background.jpg");
  image(Background,0,0);
  Lose = loadImage("Lose.jpg");
  Bomb = loadImage("rageMan.jpg");
  Win = loadImage("Win.jpg");
  // five randomly-generated circles have numbers in them.
  // assign a text-generated number on them based on that (x,y)
  for (i = 1; i < numberOfCircles + 1; i++) {
    // 24 X 24 ellipse (circle)
    numberCircleX = int(random(24, width - 24));
    circleNumberX[i-1] = numberCircleX; // store the 'i'th coordinate
    numberCircleY = int(random(96, height - 48));
    circleNumberY[i-1] = numberCircleY; // store the 'i'th coordinate
    
    // 24 X 24 ellipse (circle)
    fill(255); // white
    ellipse(numberCircleX, numberCircleY, 24, 24); // radius of 12
    // load and use smaller font for the numbers
    font = loadFont("Arial-Black-24.vlw");
    textFont(font); 
    // write the corresponding number on that ellipse
    fill(0); // black
    // write corresponding number in circles
    // "center" those numbers
    text(i, numberCircleX - 8, numberCircleY + 9);
  } // for()
  
  // seven randomly-generated Rage men are bombs.
  for (i = 1; i < numberOfBombs + 1; i++) {
    // 48 X 48 squares
    // just reuse numberCircleX & numberCircleY, but
    // use arrays that are separate from the circles
    numberCircleX = int(random(48, width - 48));
    bombNumberX[i-1] = numberCircleX; // store the 'i'th coordinate
    numberCircleY = int(random(96, height - 48));
    bombNumberY[i-1] = numberCircleY; // store the 'i'th coordinate
    
    fill(0); // black
    image(Bomb, numberCircleX, numberCircleY, 48, 48); // touch this and you're FFFFFFFFFUUUUUUUU-!
  } // for()
} // setup()

void draw() {
  font = loadFont("Arial-Black-36.vlw"); // load font
  textFont(font); // The (only) font needed
  
  fill(0); // black
  text("CONNECT THE NUMBERS", 0, 48);
  
  // If dots are "connected", you win.
  if (score >= numberOfCircles) {
    image(Win, 0, 0);
    //fill(0,255,0); // green
    //text("GOOD JOB!", width / 2, height / 2); 
    score = 0; // reset score to avoid array overload
  } // if(score >= 5)
  
  // visualizing connecting the dots
  if ((mousePressed == true) && (mouseButton == LEFT)) 
    line(mouseX, mouseY, pmouseX, pmouseY);
  
  // Code to interact with the circles
  // Moved from the user-defined mousePressed() function into here.
  if (mouseX > (circleNumberX[score] - 12)
          && mouseX < (circleNumberX[score] + 12)
          && mouseY > (circleNumberY[score] - 12)
          && mouseY < (circleNumberY[score] + 12)) { // if hovering over "correct" circle
     if (mousePressed == true) { // the player HAS to draw lines
       // ...draw a differently colored ellipse over the "correct" circle
       fill(0,255,255);
       ellipse(circleNumberX[score], circleNumberY[score], 24, 24); // 'i'th circle
       score += 1; // update score and current circle AFTER drawing the correct one.
    } // if (mousePressed == true)
  } // if (mouseX...)
  
  // Code to interact with the bombs
  // Similar to circle interaction code, but
  // touching one bomb ends the game.
  // Might need a 'for' function for every
  // single array
  for (i = 0; i < numberOfBombs; i++) {
    if (mouseX > (bombNumberX[i])
          && mouseX < (bombNumberX[i] + 48)
          && mouseY > (bombNumberY[i])
          && mouseY < (bombNumberY[i] + 48)) { // if hovering over Rage Man,
      if (mousePressed == true) { // ...the player HAS to draw a line over it to lose
        image(Lose, 0, 0);
        score = 0;
      } // if (mousePressed == true)
    } // if (mouseX...)
  } // for()
} // draw()

// END OF FILE


/*
// The following code is glitchy:
  
// FIRST Array
if (mouseX > (bombNumberX[0] - 12)
      && mouseX < (bombNumberX[0] + 12)
      && mouseY > (bombNumberY[0] - 12)
      && mouseY < (bombNumberY[0] + 12)) {
  if (mousePressed == true) { // the player HAS to draw a line over it to lose
    image(Lose, 0, 0);
    score = 0;
  }
}
// SECOND Array
if (mouseX > (bombNumberX[1] - 12)
      && mouseX < (bombNumberX[1] + 12)
      && mouseY > (bombNumberY[1] - 12)
      && mouseY < (bombNumberY[1] + 12)) {
  if (mousePressed == true) { // the player HAS to draw a line over it to lose
    image(Lose, 0, 0);
    score = 0;
  }
}
// THIRD Array
if (mouseX > (bombNumberX[2] - 12)
    && mouseX < (bombNumberX[2] + 12)
    && mouseY > (bombNumberX[2] - 12)
    && mouseY < (bombNumberY[2] + 12)) {
  if (mousePressed == true) { // the player HAS to draw a line over it to lose
    image(Lose, 0, 0);
    score = 0;
  }
}
// FOURTH Array
if (mouseX > (bombNumberX[3] - 12)
    && mouseX < (bombNumberX[3] + 12)
    && mouseY > (bombNumberX[3] - 12)
    && mouseY < (bombNumberY[3] + 12)) {
  if (mousePressed == true) { // the player HAS to draw a line over it to lose
    image(Lose, 0, 0);
    score = 0;
  }
}
// FIFTH Array
if (mouseX > (bombNumberX[4] - 12)
    && mouseX < (bombNumberX[4] + 12)
    && mouseY > (bombNumberX[4] - 12)
    && mouseY < (bombNumberY[4] + 12)) {
  if (mousePressed == true) { // the player HAS to draw a line over it to lose
    image(Lose, 0, 0);
    score = 0;
  }
}
// SIXTH Array
if (mouseX > (bombNumberX[5] - 12)
    && mouseX < (bombNumberX[5] + 12)
    && mouseY > (bombNumberX[5] - 12)
    && mouseY < (bombNumberY[5] + 12)) {
  if (mousePressed == true) { // the player HAS to draw a line over it to lose
    image(Lose, 0, 0);
    score = 0;
  }
}
// FINAL Array
if (mouseX > (bombNumberX[6] - 12)
    && mouseX < (bombNumberX[6] + 12)
    && mouseY > (bombNumberX[6] - 12)
    && mouseY < (bombNumberY[6] + 12)) {
  if (mousePressed == true) { // the player HAS to draw a line over it to lose
    image(Lose, 0, 0);
    score = 0;
  }
}

//void mousePressed() {
    // if the mouse hovers over the "correct" circle,
//    if (mouseX > (circleNumberX[score] - 12)
//          && mouseX < (circleNumberX[score] + 12)
//          && mouseY > (circleNumberY[score] - 12)
//          && mouseY < (circleNumberY[score] + 12)) {
     // ...draw a differently colored ellipse over the "correct" circle
//     fill(0,255,255);
//     ellipse(circleNumberX[score], circleNumberY[score], 24, 24); // 'i'th circle
//     score += 1; // update score and current circle AFTER drawing the correct one.
//    } 
//} // mousePressed()
*/


