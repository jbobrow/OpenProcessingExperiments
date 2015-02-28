
//Kelvin Pan
//Computer Programming 1
//Simon 16/17
//TRON:
//Website: awxrus.webs.com OR openprocessing.org
//10.30.12

/*
CONTROLS: WASD
 BOOST: SPACE
 RESET: R
 */

//variables
int x = 100; //HUMAN COORDINATES
int y = 250;
int direction = RIGHT; //HUMAN DIRECTION
int compx = 400; //COMP COORDINATES
int compy = 250;
int compdir = LEFT; //COMP DIRECTION
boolean gameOver = false; //GAME OVER
int boost = 250;
int compBoost = 250;
float count1 = random(0, 1); //COMPUTER COUNTER

//setup
void setup() {
  size(500, 500);
  background(255);
  frameRate(24);
  fill(0);
}

//draw
void draw() {
  if (gameOver == false) {
    if (get (x, y) != color (255, 255, 255)) { //COLOR CHECK
      endgametext();
      gameOver = true;
    }
    else if (get (compx, compy) != color (255)) {
      gameOver = true;
      endgametext2();
    }
    else {
      human();
      computer();
    }
  }
}

//human
void human() {
  if (boost > 0) { //COLOR FOR BOOSTING
    stroke (0, 255, 0);
  }
  else {
    stroke (0, 0, 255);
  }
  point(x, y); //LINE AND MOVEMENT
  if (direction == RIGHT) {
    if (keyPressed == true && key == ' ' && boost > 0) {
      point (x + 1, y);
      point (x + 2, y);
      x = x + 3;
      boost--;
    }
    else {
      x++;
    }
  }
  if (direction == LEFT) {
    if (keyPressed == true && key == ' ' && boost > 0) {
      point (x - 1, y);
      point (x - 2, y);
      x = x - 3;
      boost--;
    }
    else {
      x--;
    }
  }
  if (direction == UP) {
    if (keyPressed == true && key == ' ' && boost > 0) {
      point (x, y - 1);
      point (x, y - 2);
      y = y - 3;
      boost--;
    }
    else {
      y--;
    }
  }
  if (direction == DOWN) {
    if (keyPressed == true && key == ' ' && boost > 0) {
      point (x, y + 1);
      point (x, y + 2);
      y = y + 3;
      boost--;
    }
    else {
      y++;
    }
  }
  fill(0); //USER INTERFACE
  noStroke();
  rect(0, 480, 500, 20);
  fill(255); //BOOST COUNTER
  textAlign(CENTER);
  textSize(20);
  text("Boost: " + boost, 445, 498);
}

//KEY INPUT
void keyPressed() {
  if (key == 'a') {
    direction = LEFT;
  }
  if (key == 'd') {
    direction = RIGHT;
  }
  if (key == 'w') {
    direction = UP;
  }
  if (key == 's') {
    direction = DOWN;
  }
  if (key == 'r') {
    gameOver = true;
  }
}

//COMPUTER
void computer() {
  if (compBoost > 0) { //COLOR FOR BOOSTING
    stroke (255, 0, 0);
  }
  else {
    stroke (0, 0, 0);
  }
  point(compx, compy); //LINE AND MOVEMENT
  if (compdir == RIGHT) {
    compx++;
    if (get(compx + 1, compy) != color (255)) {
      compdir = DOWN;
    }
  }
  if (compdir == LEFT) {
    compx--;
    if (get(compx - 1, compy) != color (255)) {
      compdir = UP;
    }
  }
  if (compdir == UP) {
    compy--;
    if (get(compx, compy - 1) != color (255)) {
      compdir = RIGHT;
    }
  }
  if (compdir == DOWN) {
    compy++;
    if (get(compx + 1, compy) != color (255)) {
      compdir = LEFT;
    }
  }
}

//Endgame Text
void endgametext() {
  fill(0);
  smooth();
  textAlign(CENTER);
  textSize(20);
  text("You have lost the game! 'Tis only a flesh wound.", 250, 250);
}
void endgametext2() {
  fill(0);
  smooth();
  textAlign(CENTER);
  textSize(20);
  text("You have beat the machine!", 250, 250);
}
