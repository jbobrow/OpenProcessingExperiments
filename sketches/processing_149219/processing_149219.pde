
/*Death Ball v1.0 by Nathan Hawkins
*This is my first sketch, will work on making it more user friendly and more difficult
*I'm trying to add in a collision factor where the balls still travel towards the mouse, yet they bounce off one another
*I apologize in advance for my obsessive comments. It helps me at least, hopefully it doesn't get too obtstructive
*/
int time = 330;
int deathBallSize = 10;
float flag = -1; //sort of a "screen tracker." used to define which level the program runs
int level; //this is only used to display what level the player got to at the end of the game, doesn't actually track the level
DeathBall DB1 = new DeathBall(color (255, 100, 200), 0, 0);
DeathBall DB2 = new DeathBall(color (255, 128, 0), width, 0);
DeathBall DB3 = new DeathBall(color (255, 0, 0), 0, height);
DeathBall DB4 = new DeathBall(color (255, 100, 0), width, height); //maybe try to find a more efficient way to declare the balls, maybe a "for" loop? 

void setup() { 
  size(750, 500); //maybe add in different difficulties? could be nice to find out how to make buttons
  frameRate(30); // frame rate. 1 second = time/30.
} 

void draw() {
  if (flag == -1) { //main menu
    mainMenu();
  }
  if (flag == 0) { //game over
    gameOver();
  }
  if (flag == 1.5 || flag == 2.5 || flag == 3.5) { //in between screen
    levelStart();
  }
  if (flag == 1) { //level 1, top left corner
    level1();
  }
  if (flag == 2) { //level 2 +top right corner
    level2();
  }
  if (flag == 3) { //level 3 +bottom left corner
    level3();
  }
  if (flag == 4) { //level 4 +bottom right corner
    level4();
  }
  if (flag > 4) { //player wins
    win();
  }
} 

//user's mouse. unneeded to make it a void, but it saves having to re-write the two lines over and over agian
void userBall() { 
  fill(255); //
  ellipse(mouseX, mouseY, 10, 10); //if you change this, change the .drawDB() void as well
} 

//main menu
void mainMenu() {
  background(0);
  textAlign(CENTER, CENTER);
  fill(255, 128, 0);
  textSize(50);
  text("Death Ball v1.0", width/2, height/2 - 20);
  textSize(15);
  text("Click to start", width/2, height/2 + 20);
}

//you lose!
void gameOver() {
  background(255);
  fill(0);
  textSize(50);
  text("You lost", width/2, 30);
  textSize(15);
  text("You made it to level " + level, width/2, height/3);
  text("Click to restart", width/2, height/3 + 40);
}

//used at the start of a new level
void levelStart() { //in between levels, allows the player to pause, catch their breath, get some panch, etc.
  background(255);
  textSize(50); 
  fill(0);
  level = floor(flag); //set the level equal to the counter
  text("You made it past level " + level, width/2, height/3);
  textSize(15);
  text("Click to continue", width/2, height/3 + 40);
}

void win() {
  background(255, 128, 0);
  textSize(50);
  fill(0);
  text("You win!", width/2, height/3);
  textSize(15);
  text("Click to restart", width/2, height/3 + 40);
  DB1.xpos = 0;
  DB1.ypos = 0;
  DB2.xpos = width;
  DB2.ypos = 0;
  DB3.xpos = 0;
  DB3.ypos = height;
  DB4.xpos = width;
  DB4.ypos = height; //resets all positions after the player wins
}

//level 1
void level1() {
  background(0);
  fill(255);
  DB1.drawDB(); //draw DB
  DB1.move(); //move DB
  userBall(); //move user
  text("Time left: " + floor(time/30), width/2, 10); 
  time --; //when time == 30, new level
  deathBallSize++;
  if (time == 30) { //changes to the levelStart
    flag += .5;
    level = floor(flag);
  }
}

//level 2
void level2() {
  background(0);
  fill(255);
  DB1.drawDB(); //draw DB
  DB1.move(); //move DB
  DB2.drawDB(); //draw DB
  DB2.move(); //move DB
  userBall(); //move user
  text("Time left: " + floor(time/30), width/2, 10); 
  time --; //when time == 30, new level
  deathBallSize++;
  if (time == 30) { //changes to the levelStart
    flag += .5;
    level = floor(flag);
  }
}

void level3() {
  background(0);
  fill(255);
  DB1.drawDB(); //draw DB
  DB1.move(); //move DB
  DB2.drawDB(); //draw DB
  DB2.move(); //move DB
  DB3.drawDB(); //draw DB
  DB3.move(); //move DB
  userBall(); //move user
  text("Time left: " + floor(time/30), width/2, 10); 
  time --; //when time == 30, new level
  deathBallSize++;
  if (time == 30) { //changes to the levelStart
    flag += .5;
    level = floor(flag);
  }
}

//level 4
void level4() {
  background(0);
  fill(255);
  DB1.drawDB(); //draw DB
  DB1.move(); //move DB
  DB2.drawDB(); //draw DB
  DB2.move(); //move DB
  DB3.drawDB(); //draw DB
  DB3.move(); //move DB
  DB4.drawDB(); //draw DB
  DB4.move(); //move DB
  userBall(); //move user
  text("Time left: " + floor(time/30), width/2, 10); 
  time --; //when time == 30, new level
  deathBallSize++;
  if (time == 30) { //changes to the levelStart
    flag += .5;
    level = floor(flag);
  }
}

//restart and continue
void mousePressed() {
  if (flag == -1 || flag == 0 || flag > 4) { //mainMenu, gameOver, win
    flag = 1;
    time = 330;
    deathBallSize = 10;
  }
  if (flag == 1.5 || flag == 2.5 || flag == 3.5) { //levelStart
    flag += .5;
    time = 330;
    deathBallSize = 10;
    DB1.xpos = 0;
    DB1.ypos = 0;
    DB2.xpos = width;
    DB2.ypos = 0;
    DB3.xpos = 0; 
    DB3.ypos = height;
    DB4.xpos = width;
    DB4.ypos = height; //resets all the positions when the levelStart changes
  }
}

//death ball class
class DeathBall {
  int xpos; //x position of death ball --- might turn these two into PVectors,
  int ypos; //y position of death ball --- depending on what direction I go
  color c; //color of death ball           with the game
  DeathBall(color c_, int xpos_, int ypos_) {
  c = c_;
  xpos = xpos_;
  ypos = ypos_; //defining local variables
  }
  
  void move() { //moves death ball
    if (mouseX > xpos) {
      xpos += (mouseX - xpos)/10; //this whole section makes the ball move
    } 
    if (mouseX < xpos) {
      xpos -= (xpos - mouseX)/10; //towards the mouse. it speeds up when the 
    }
    if (mouseY > ypos) {
      ypos += (mouseY - ypos)/10; //mouse is away from the ball, then slows as
    } 
    if (mouseY < ypos) {
      ypos -= (ypos - mouseY)/10; //it approaches. maybe try different speeds
    }                             //for each ball?
  }
  
  void drawDB() { //draws death ball
    fill(c);
    ellipse(xpos, ypos, deathBallSize, deathBallSize); //draw
    if (dist(mouseX, mouseY, xpos, ypos) <= (deathBallSize + 10)/2) { //user collides with the death ball
      level = round(flag);
      flag = 0;
      DB1.xpos = 0;
      DB1.ypos = 0;
      DB2.xpos = width;
      DB2.ypos = 0;
      DB3.xpos = 0;
      DB3.ypos = height;
      DB4.xpos = width;
      DB4.ypos = height; //resets all the positions after the user collides
    }
  }
}
