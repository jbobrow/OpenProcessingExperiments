
int shipX = 250;
int shotX = 250;
int shotY = 480;
int shot2X = 250;
int enemyX = 475;
int enemy2X = 425;
boolean enemyInvisible = false;
boolean enemy2Invisible = true;
boolean shotInvisible = true;
String enemyDir = "Left";
String enemy2Dir = "Left";
int enemyCount = 2;

void setup() {
  size(500,500);
  background(0);
}

void keyPressed() {
  if (keyCode == LEFT) {
    shipX-=100;
  }
  else if (keyCode == RIGHT) {
    shipX+=100;
  }
  else if (key == ' ') {
    shotInvisible = false;
    shotX = shipX;
    shotY = 450;
  }
}

void draw() {
  background(0);
  fill(255,0,100);
  triangle(shipX-20,490,shipX+20,490,shipX,460);
  if (shotInvisible) {
    fill(0,0,255,0);
    noStroke();
    if (shotY <= 20){
      shotInvisible = true;
    }
  }
  else {
    fill(0,0,255,255);
    noStroke();
  }
  ellipse(shotX, shotY, 25, 25);
  shotY -= 10;
  fill(255,0,0);
  triangle(enemyX-20, 55, enemyX+20, 55, enemyX, 35);
  triangle(enemy2X-20, 55, enemy2X+20, 55, enemy2X, 35);
  if (enemyDir == "Left") {
    enemyX -= 2;
    if (enemyX <= 25) {
      enemyDir = "Right";
    }
  }
  else if (enemyDir == "Right") {
    enemyX += 2;
    if (enemyX >= 475) {
      enemyDir = "Left";
    }
  }
  if (enemy2Dir == "Left") {
    enemy2X -= 2;
    if (enemy2X <= 25) {
      enemy2Dir = "Right";
    }
  }
  else if (enemy2Dir == "Right") {
    enemy2X += 2;
    if (enemy2X >= 475) {
      enemy2Dir = "Left";
    }
  }
  if (shotInvisible == false && shotY >= 45 && shotY <= 55 && shotX >= enemyX-20 && shotX <= enemyX+20) {
    enemyX = 100000000;
    enemyCount -= 1;
  }
  if (shotInvisible == false && shotY >= 45 && shotY <= 55 && shotX >= enemy2X-20 && shotX <= enemy2X+20) {
    enemy2X = 100000000;
    enemyCount -= 1;
  }
  if (enemyCount == 0) {
  fill(255,0,0);
    text("You Win!", 260,240);
    exit();
  }
}
