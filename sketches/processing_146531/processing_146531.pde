
int x = 240;
int y = 240;
String lose = "YOU LOSE Press H to exit";
int score = 0;
int enemyX = 1200;
int enemyY = 340;
float coinx = random (1280);
float coiny = random (680);
float r = random(255);
float g = random(255);
float b = random(255);
int rad = 20;
int check = 0;


void setup() {
  size(1280, 680);
}
void draw() {
  ellipse(mouseX, mouseY, 40, 40);
  r = random(255);
  g = random(255);
  b = random(255);
  background(0, 0, 0);


  float distance = dist(mouseX, mouseY, coinx, coiny);
  //print(distance);
  if ((distance < rad + 10) && (check <= 0)) {
    fill (246, 255, 0);
    coinx = random (1280);
    coiny = random (680);
    score +=100;
    //change coinx and coiny
  }

  if (score > 0) {
    fill (255, 0, 0);
    ellipse (enemyX, enemyY, 20, 20);
    if (enemyX < mouseX) {
      enemyX++;
    }
    else if  (enemyX > mouseX) {
      enemyX--;
    }
    if (enemyY < mouseY) {
      enemyY++;
    }
    else if  (enemyY > mouseY) {
      enemyY--;
    }
    if (score > 100) 
      fill (255, 0, 0);
    ellipse (enemyX, enemyY, 20, 20);
    if (enemyX < mouseX) {
      enemyX++;
    }
    else if  (enemyX > mouseX) {
      enemyX--;
    }
    if (enemyY < mouseY) {
      enemyY++;
    }
    else if  (enemyY > mouseY) {
      enemyY--;
    }
    if (score > 300)
      if (enemyX < mouseX) {
        enemyX++;
      }
      else if  (enemyX > mouseX) {
        enemyX--;
      }
    if (enemyY < mouseY) {
      enemyY++;
    }
    else if  (enemyY > mouseY) {
      enemyY--;
    };
  }
  float dister = dist (mouseX, mouseY, enemyX, enemyY);

  if (dister <= rad + 11) {//hit
    check =+1;
  }
  if (check >=1) {
    text(lose, 340, 640);
    fill (r, b, g);
  if (keyPressed) {
    if (key == 'h' || key == 'H') {
      exit();
      
  }
  }
  }

  fill (246, 255, 0);
  ellipse(coinx, coiny, 20, 20);

  text(score, 10, 30);
  noCursor();
  fill(r, g, b);
  ellipse(mouseX, mouseY, 40, 40);
  textSize(32);
  text(score, 10, 30);
}


