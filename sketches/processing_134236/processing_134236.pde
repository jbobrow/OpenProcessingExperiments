
/*
Press r, g, b to change the player color.
*/
int playerXPos = 0;
int playerYPos = 0;
int enemyXPos = 200;
int enemyYPos = 200;
int playerHue = 40;
int enemyHue = 0;
int playerXSize = 50;
int playerYSize = 50;
int enemyXSize = 50;
int enemyYSize = 50;
void setup() {
  size(400, 400);
  colorMode(HSB, 100);
}
void draw() {
  background(100);
  playerAvatar();
  enemyAvatar();
  collisionTest();
}
void keyPressed() {
  if (key==114) {
    playerHue = 0;
  }
  else if (key==103) {
    playerHue = 40;
  } else if (key==98){
   playerHue = 55; 
  }
}
void playerAvatar() {
  playerXPos = mouseX;
  playerYPos = mouseY;
  fill(playerHue, 100, 100);
  rect(playerXPos, playerYPos, playerXSize, playerYSize);
}

void enemyAvatar() {
  enemyXPos = enemyXPos-1+random(2);
  enemyYPos = enemyYPos-1+random(2);
  fill(enemyHue, 100, 100);
  rect(enemyXPos, enemyYPos, 50, 50);
}
void collisionTest() {
  if (playerXPos+playerXSize/2 >=enemyXPos-enemyXSize/2 &&
    playerXPos-playerXSize/2 <=enemyXPos+enemyXSize/2 &&
    playerYPos+playerYSize/2 >=enemyYPos-enemyYSize/2 &&
    playerYPos-playerYSize/2 <=enemyYPos+enemyYSize/2)
    {
      enemyHue = playerHue;
  }
}



