
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/75373*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

Platforms platform;  //  Platform Class Setup


PImage sky;
PImage playerR;
PImage playerL;
int  playerX = 100;
int playerY = 470;
int g = 2;
boolean stop = false;



class Platforms {  //  Start of Class Platforms
  int x = 0;       //  Start of Class Attributes
  int y = 0;
  int sx = 0;
  int sy = 0;      //  End of Class Attributes

  public Platforms(int x, int y, int s1, int s2) {  //  Start of each object 
    this.x = x;    //  Start of object variable of Class Attribute
    this.y = y;
    this.sx = s1;
    this.sy = s2;  //  End of object variable of class Attribute
  }
  void plat() {    //  Drawing of object
    rect(x, y, sx, sy);
  }
}

/*#########
 # Setup Method runs once at the start of the program.
 # It initalises the program.
 #*/

void setup () {    //  Start of setup
  size(1200, 600);
  sky = loadImage("start.jpg");  //  Loads Images into memory
  playerR = loadImage("player_right.png");
  playerL = loadImage("player_left.png");
  platform = new Platforms(100, height/2, 200, 20);  //  Define new object
}

//------------------------------------------------- End of setup

/*#########
 # Draw method loops the program 
 # running each of the methods included in order.
 #*/

void draw() {     
  callBG();
  playerMovement();
  playerDirection();
  platform.plat();
}                  

//------------------------------------------------- End of draw

/*#########
 # Method to move the players sprite 
 # depending on input.
 #*/

void playerMovement() { 
  if (playerY<470) {
    playerY+=g;
  }
  if (keyPressed) {
    if (keyCode == RIGHT && playerX<1160 ) {
      playerR(playerX+3, playerY);
      playerX+=3;
    }
    if (keyCode == LEFT && playerX>0) {
      playerL(playerX-3, playerY);
      playerX-=3;
    }
    if (key == ' ' && playerY > 170) {
      if ((playerX>60 && playerX<300 || playerY>320 && playerY<300)) {
        playerX+=3;
        playerY=320;
      }
      else {
        playerY-=50;
      }
    }
  }
}  

//------------------------------------------------- End of playerMovement

/*#########
 # Methods to set direction of
 # player's sprite.
 #*/

void playerDirection() {
  if (stop == true) {
    playerL(playerX, playerY);
  }
  else if (stop == false) {
    playerR(playerX, playerY);
  }
}        

void playerR(int playerX, int playerY) {    // Set player direction
  noStroke();
  image(playerR, playerX, playerY);
}
void playerL(int playerX, int playerY) {    //  Set player direction
  image(playerL, playerX, playerY);
}

//------------------------------------------------- End of playerDirection

/*#########
 # Method to overlay background
 # on loop.
 #*/

void callBG() {      //  Draw Background
  background(sky);
  fill(102, 102, 102);
  rect (0, 500, 1200, 100);
}

//------------------------------------------------- End of callBG

/*#########
 # Method checks which direction to
 # face player's sprite on key released
 #*/

void keyReleased() {   //  Sets TRUE/FALSE variable for direction facing.
  if (keyCode == LEFT) {
    stop = true;
  }
  else {
    stop = false;
  }
}

//------------------------------------------------- End of keyReleased


