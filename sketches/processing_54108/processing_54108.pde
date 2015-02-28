
color cGreen = color(150, 255, 0);
color cBlue = color(0, 200, 255);
color cDarkblue = color(0, 100, 175);
color cWhite = color(255, 255, 255);
color cYellow = color(255, 255, 100);
color cWater = color(0, 200, 255, 10);

float resolution = 0.04;
float boxSize = 50;
float playerX = 10000;
float playerY = 10000;
int distance = 25;
int viewHeight = 30;
PVector vel = new PVector(0, 0);

void setup() {
  size(600, 250, P3D);
  frameRate(60);
  noStroke();
}

void draw() {
  background(171, 225, 255);

  vel.mult(0.90);
  playerY += vel.y;
  playerX += vel.x;

  //rendering
  int minX = round(playerX) - distance;
  int maxX = round(playerX) + distance;
  int minY = round(playerY) - distance;
  int maxY = round(playerY) + distance;

  float playerHeight = (noise(playerX * resolution, playerY * resolution) - 0.5) * 15 * boxSize;
  translate(width / 2, height / 2 - playerHeight + viewHeight + boxSize * 2, (distance / 8) *  boxSize);
  rotateX(80);
  rotateX(-radians((mouseY - height / 2) / 3));
  rotateZ(radians((mouseX - width / 2) / 3));
  translate(-playerX * boxSize, -playerY * boxSize, 0); 
  directionalLight(255, 255, 255, 0.2, 0.6, -0.6);

  for (int x = minX; x < maxX; x++) {
    for (int y = minY; y < maxY; y++) {
      float blockHeight = (noise(x * resolution, y * resolution) - 0.5) * 15 * boxSize;
      blockHeight = round(blockHeight / boxSize) * boxSize;
      boolean water = false;

      if (blockHeight < -4 * boxSize) {
        fill(cWhite);
      }
      else if (blockHeight < 0 * boxSize) {
        fill(cGreen);
      }
      else if (blockHeight < 1 * boxSize) {
        fill(cYellow);
      }
      else if (blockHeight < 2 * boxSize) {
        fill(cBlue);
        water = true;
      }
      else {
        fill(cDarkblue);
        water = true;
      }

      pushMatrix();
      translate(x * boxSize, y * boxSize, blockHeight);
      box(boxSize);
      popMatrix();

      /* transparent boxes are UGLY
      if (water ) {
       pushMatrix();
       translate(x * boxSize, y * boxSize, 0);
       fill(cWater);
       box(boxSize);
       popMatrix();
       } */
    }
  }
}

void keyPressed() {
  if (keyCode == UP) {
    vel.y = 0.5;
  }
  else if (keyCode == DOWN) {
    vel.y = -0.5;
  }
  if (keyCode == LEFT) {
    vel.x = -0.5;
  }
  else if (keyCode == RIGHT) {
    vel.x = 0.5;
  }
}


