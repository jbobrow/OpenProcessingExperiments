
int timer;
int shipY;
int[] enemyX;
int[] enemyY;
boolean[] enemyAlive;
int[] bulletX;
int[] bulletY;
int[] bulletEnemyX;
int[] bulletEnemyY;
boolean upPressed;
boolean downPressed;
boolean shotReleased;
boolean gameOver;
boolean enemyShot;
int thisBullet;
int thisEnemyBullet;

void setup() {
  size(500, 500);

  noStroke();

  enemyX = new int[10];
  enemyY = new int[10];
  enemyAlive = new boolean[10];
  bulletX = new int[6];
  bulletY = new int[6];
  bulletEnemyX = new int[6];
  bulletEnemyY = new int[6];
  thisBullet = 0;
  thisEnemyBullet = 0;
  shipY = 50; 
  gameOver = false;

  for (int i = 0; i<bulletX.length; i++ ) {
    bulletX[i] = -1000;
    bulletY[i] = -1000;
  }

  for (int i = 0; i<bulletEnemyX.length; i++ ) { // set the values of the bullets to off the screen
    bulletEnemyX[i] = 2000;
    bulletEnemyY[i] = 2000;
  }

  for (int i = 0; i<enemyX.length; i++) {
    enemyAlive[i] = true; // every enemy is alive in the very beginning
    enemyX[i] = (int)random(200, 500);
    enemyY[i] = (int)random(50, 500);
  }
}

void draw() {
  background(0, 85, 255);

  if (gameOver == false) {
    fill(0, 255, 0); // the ships will be green
    rect(50, shipY, 30, 30);

    fill(255); // the bullets will be a bright green
    for (int i= 0; i< bulletX.length; i++) {
      ellipse(bulletX[i], bulletY[i], 4, 4);
      bulletX[i] += 10;
    }

    for (int i= 0; i<bulletEnemyX.length; i++) {
      ellipse(bulletEnemyX[i], bulletEnemyY[i], 4, 4);
      println(bulletEnemyX);
      bulletEnemyX[i] -= 10;
    }



    fill(56, 60, 70);
    stroke(255);

    drawEnemy();

    hitEnemyLogic();

    if (upPressed == true) {
      shipY -= 5;
    }

    if (downPressed == true) {
      shipY += 5;
    }

    if (shotReleased == true) {
      createBullet();
    }

    
  }

  enemyShot = false;
  upPressed = false; // resetting so they don't keep drawing forever
  downPressed = false;
  shotReleased = false;
}

void keyPressed() {
  if (keyCode == UP) {
    upPressed = true;
  }

  if (keyCode == DOWN) {
    downPressed = true;
  }
}

void keyReleased() {
  if (keyCode == 32) {
    shotReleased = true;
    println("SHOT!");
  }

  if (keyCode == 65) { // press A to shoot enemy bullets
    enemyShot = true;
    println("!!!!");
  }
}

void createBullet() {
  bulletX[thisBullet] = 80;
  bulletY[thisBullet] = shipY + 15;

  if (thisBullet < 5) {
    thisBullet++;
  } 
  else { 
    thisBullet = 0; // once the bullet count hits 5, add 1 more to it so it goes to 0 (moving through the spots in the array)
  }
}

void createEnemyBullet() {
  for (int i= 0; i< enemyX.length; i++) {
    bulletEnemyX[thisBullet] = enemyX[i];
    bulletEnemyY[thisBullet] = enemyY[i];
    
  if (thisBullet < 5) {
    thisBullet++;
  } 
  else { 
    thisBullet = 0; // once the bullet count hits 5, add 1 more to it so it goes to 0 (moving through the spots in the array)
  }
  }
}





void drawEnemy () {
  for (int i= 0; i< enemyX.length; i++) {
    if (enemyAlive[i] == true) {
      enemyX[i] = enemyX[i]+(int)random(-4, 4);
      rect(enemyX[i], enemyY[i], 30, 30); // draw enemies
    }
  }
}


void hitEnemyLogic () { // collision detection
  // for each bullet {
  // for each enemy {
  // set enemy to dead (enemyAlive = false;)
  // remove bullet (bulletY = -1000;)
  //}
  // }
  for (int i=0; i<bulletX.length; i++) { // loop through all the bullet (each bullet will look for each enemy)
    for (int j = 0; j<enemyX.length; j++) {
      if (bulletX[i] > enemyX[j] && bulletX[i] < enemyX[j] + 30 && bulletY[i] > enemyY[j] && bulletY[i] < enemyY[j] + 30 && enemyAlive[j] == true) {
        enemyAlive[j] = false;
        bulletY[i] = -1000;
      }
    }
  if (enemyShot == true) {
      createEnemyBullet();
    } // if the enemy is still alive then let them shoot, if not, then don't  
}
}
