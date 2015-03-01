
float playerx, playery, playervx, playervy, playeray;

class Player {
  //float playerx, playery, playervx, playervy, playeray;
  
Player() {
  playerx = 200;
  playery = 200;
  playervx = 5;
  playervy = 5;
  playeray = 0.5;
}
void updatePlayer() {
    playerx += playervx;
    playery += playervy;
    playervy += playeray;
  }
  
  void drawPlayer() {
    //float angle = atan2(playervy, playervx);
    rect(playerx, playery, 50, 50);
    updatePlayer();
    //playerimg = 
  }
}
//---END OF PLAYER CLASS---\\

void setup() {
 size(1280, 700);
  background(0); 
}

void update() {
  background(0);
  
}

void keyPressed() {
  if (key == CODED) {
    }
    if (keyCode == UP) {
      playery -= 10;
    }
    if (keyCode == DOWN) {
      playery += 10;
    }
    if (keyCode == LEFT) {
      playerx -= 10;
    }
    if (keyCode == RIGHT) {
      playerx += 10;
  }
  update();
}

void draw() {
  //float angle = atan2(playervy, playervx);
  rect(playerx, playery, 50, 50);
  //update();
}
