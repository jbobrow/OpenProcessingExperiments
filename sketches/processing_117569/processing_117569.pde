
void setup() {
  //background(255,255,255);
  size(200, 200);
  frameRate(60);
}

float prikX = random(0, 199);
float prikY = -1;
int prikXI = int(prikX);
int prikYI = int(prikX);

int playerX = 100;
int playerY = 199;/*
int playerXI = int(prikX);
 int playerYI = int(prikX);*/

void draw() {
  background(0, 0, 0);

  //Bomb
  bombMovement();

  //Player
  playerSpawn();

  //Controll
  if (keyPressed) {
    if (key == 'a' || key == 'A') {
      playerX = playerX - 1;
    }
  }

  if (keyPressed) {
    if (key == 'd' || key == 'D') {
      playerX = playerX + 1;
    }
  }

  if (playerX == prikXI) {
    if (playerY == prikYI) {
      exit();
    }
  }
}

void bombMovement() {
  stroke(255, 255, 255);
  point(prikXI, prikYI);
  prikYI = prikYI + 2;
  if (prikYI >=201) {
    repawnBomb();
  }
}

void repawnBomb() {
  prikYI = -1;
  prikX = random(0, 199);
  prikXI = int(prikX);
  point(prikXI, prikYI);
}

void playerSpawn() {
  //stroke(202,9,224); //Lilla farve
  stroke(24, 166, 240); //Blå farve
  point(playerX, playerY);
}



