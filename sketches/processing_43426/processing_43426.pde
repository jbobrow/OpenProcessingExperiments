
userWorm player;                   //the player
boolean gameOver;                  //wether or not you've lost
PImage bgImg;                      //the background image that will get drawn
PImage loser;                      //shows up if you lose

color bgColor;                     //background color for the board

int wins;                          //how many levels the player has beaten
float moveTimer;                   //This timer will determine wether or not the snake can move
int tileCountdown;                 //how many tiles still need to be drawn to beat the level
int arrayW, arrayH, tileSize;      //arrayW and arrayH are the number of tiles along the x and y axis, respectively.
//tileSize is the size of a tile
PImage[][] tiles;                  //this will contain the background image as an array of tiles
boolean[][] storedTiles;           //when toggled to true, the image at the given location will be drawn when the screen refreshes

void setup(){

  size(400, 400);

  rectMode(CORNER);
  noStroke();

  bgColor = color(0, 0, 255);                    //Declare the variables.
  bgImg = loadImage("bg.jpg");
  loser = loadImage("winners.gif");
  player = new userWorm(200, 200);
  wins = 0;
  moveTimer = 500;

  tileSize = player.segSize;
  arrayW = (int)(width/tileSize);
  arrayH = (int)(height/tileSize);
  tileCountdown = arrayW * arrayH;

  storedTiles = new boolean[arrayW][arrayH];
  tiles = new PImage[arrayW][arrayH];

  for (int i = 0; i < arrayW; i++){            //Populate storedTiles with booleans that are set to false
    for (int j = 0; j < arrayH; j++){          //and populates tiles with squares of the image that will be drawn
      storedTiles[i][j] = false;
      tiles[i][j] = createImage(tileSize, tileSize, RGB);
      tiles[i][j] = bgImg.get( i * tileSize, j * tileSize, tileSize, tileSize);
    }
  }

  gameOver = false;

}

void draw(){

  if(gameOver){                                  //if the player has collided with something, it will trigger the lose
    player.lose();                               //sequence
    return;
  }

  if (tileCountdown == 0){                        //checks to see if a new level needs to be drawn
    newLevel();
  }

  background(bgColor);                            //refresh the background color

  drawTiles();                                    //draw all eligible tiles

  if ( (millis()- moveTimer) > 115){
    player.move();                                  //see methods in the Worm class
    player.collision();
    player.drawWorm();
  } else {
    player.drawWorm();
  }

  if (keyPressed){
    player.keyInput(key);
  }
}

void keyPressed(){

  int checkAgainst = (char)(key);

  switch(checkAgainst){

    /////////////////////    restart the program
    case (' '):
    setup();
    break;

    /////////////////////    jump to level 0
    case ('`'):
    setup();
    break;

    /////////////////////   jump to level 1
    case ('1'):
    moveTimer = 500;
    wins = 0;
    tileCountdown = 0;
    break;

    /////////////////////   jump to level 2
    case ('2'):
    moveTimer = 500;
    wins = 1;
    tileCountdown = 0;
    break;

    /////////////////////   jump to level 3
    case ('3'):
    moveTimer = 500;
    wins = 2;
    tileCountdown = 0;
    break;
  }
}

//-----------------------------------

void drawTiles(){
  for (int i = 0; i < arrayW; i++){                        //draws tiles based on the boolean in storedTiles
    for (int j = 0; j < arrayH; j++){
      if (storedTiles[i][j] == true){
        image(tiles[i][j], i * tileSize, j * tileSize);
      }
    }
  }
}

//------------------------------------

void newLevel(){
  player = new userWorm(200, 200);         //recreates the worm in the center of the level
  wins++;

  for (int i = 0; i < arrayW; i++){        //refreshes the storedTiles array so that it is all blank
    for (int j = 0; j < arrayH; j++){
      storedTiles[i][j] = false;
    }
  }

  levelTiles(wins);                       //according to the number of wins, will set up the board appropriately
}

//------------------------------------

void levelTiles(int level){

  switch(wins){
    //////////////  Level 0: Blank
    case(0):
    break;

    //////////////  Level 1: Two Horizontal lines
    case(1):
    for (int i = (int)(arrayW * .25); i < (int)(arrayW * .75); i++){
      storedTiles[i][5] = true;
      storedTiles[i][arrayH - 5] = true;
    }
    break;

    //////////////  Level 2: Box
    case(2):
    for (int i = (int)(arrayW * .25); i < (int)(arrayW * .75); i++){
      storedTiles[i][5] = true;
      storedTiles[i][arrayH - 5] = true;
    }

    for (int i = (int)(arrayH * .25); i < (int)(arrayH * .75); i++){
      storedTiles[5][i] = true;
      storedTiles[arrayW - 5][i] = true;
    }
    break;

    //////////////  Level 3: Staggered lines
    case(3):
    for (int i = 0; i < 27; i++){
      storedTiles[8][arrayH - i - 1] = true;
      storedTiles[24][arrayH - i - 1] = true;

      storedTiles[16][i] = true;
      storedTiles[32][i] = true;

    }
  }
}

//===================================================================================
//          WORM CLASS
//===================================================================================

class Worm{

  int dir;                        //direction of the worm
  final int wormLength = 6;               //length of the worm
  int[] wormX = new int[wormLength];      //stores x,y coords for each segment
  int[] wormY = new int[wormLength];
  final int segSize = 10;                    //width and height for the rectangular segments

  //----------------------------------------
  void move(){

    for(int i = wormLength - 1; i > 0; i--){            //populate new coordinates for each section of the worm

      wormX[i] = wormX[i - 1];
      wormY[i] = wormY[i - 1];
    }

    int tmpX = (int)(wormX[wormLength -2] / tileSize);
    int tmpY = (int)(wormY[wormLength -2] / tileSize);
    storedTiles[tmpX][tmpY] = true;                 //changes the storedTiles array so that the worm will leave a trail of the image

    switch(dir){                                    //this will increment the head of the worm according to its direction
      case 37: wormX[0] = wormX[0] - 10; break;                   //left
      case 38: wormY[0] = wormY[0] - 10; break;                   //up
      case 39: wormX[0] = wormX[0] + 10; break;                   //right
      case 40: wormY[0] = wormY[0] + 10; break;                   //down
    }

    moveTimer = millis();
    tileCountdown--;
  }

  //----------------------------------------
  void drawWorm(){

    fill(0, 255, 255);

    for(int j = 0; j < wormLength - 1; j++){          //this for loop does the actual drawing.
      rect(wormX[j], wormY[j], segSize, segSize);
    }

  }

  //----------------------------------------
  void collision(){

    float r = red(get(wormX[0], wormY[0]));
    float g = green(get(wormX[0], wormY[0]));
    float b = blue(get(wormX[0], wormY[0]));

    color checkAgainst = color(r, g, b);

    if( checkAgainst != bgColor){  //detects collision with the wall
      gameOver = true;
      return;
    }
  }

  //----------------------------------------
  void lose(){                                                           //losing is a lot like taking acid.

    //which is appropriate since winners don't use drugs!
    image(loser, 0, 0);
  }
}

//=============================================================================
//          CLASS USERWORM
//=============================================================================

class userWorm extends Worm {

  userWorm(int x, int y){                      //create a new worm at position x,y that is facing up.

    dir = 38;

    wormX[0] = x;
    wormY[0] = y;

    for(int i = 1; i < wormLength; i++){
      wormX[i] = wormX[i-1];
      wormY[i] = wormY[i-1] + 10;
    }
  }

  //-----------------------------------------------

  //This function determines the direction that the worm travels in.
  //The worm may not change its trajectory by 180 degrees.
  //If you press the spacebar, it  ill restart the program.
  void keyInput(int pressed){
    println(pressed);

    if (pressed == 37 && dir != 39){
      dir = 37;                                        //left
    } else if (pressed == 38 && dir !=40 ){
      dir = 38;                                        //up
    } else if (pressed == 39 && dir != 37){
      dir = 39;                                        //right
    } else if (pressed == 40 && dir != 38){
      dir = 40;                                        //down
    }
  }
}

