
PFont myFont;
int shipY;
int[] enemyX;
int[] enemyY;
boolean[] enemyAlive;
int[] bulletX;
int[] bulletY;
int[] enemyBulletX;
int[] enemyBulletY;
boolean upPressed;
boolean downPressed;
boolean shotReleased;
boolean gameOver;
int thisBullet;
int thisEnemyBullet;
//int[] fire;
boolean test;
boolean youWin;
boolean timerCreated;
int seconds;
int frameCounter;


void setup() {

  myFont = loadFont("Futura-CondensedExtraBold-48.vlw");
  textFont(myFont, 48);
  size(600, 600);
  gameOver=false;
  //fire = new int[50];
  enemyX = new int[10];
  enemyY = new int[10];
  enemyAlive = new boolean[10];
  bulletX = new int[6];
  bulletY = new int[6];
  enemyBulletX = new int[101];
  enemyBulletY = new int[101];
  shipY = 50;
  frameRate(60);
  thisBullet = 0;
  thisEnemyBullet = 0;
  test=true;
  youWin=false;
  timerCreated=false;
  seconds=0;
  frameCounter=0;

  /*
  for(int i=0;i<fire.length;i++){
   fire[i]=(int)random(fire.length);
   }
   */
  for (int i=0; i< bulletX.length; i++) {
    bulletX[i] = -1000;
    bulletY[i] = -1000;
  }
  for (int i=0; i< enemyBulletX.length; i++) {
    enemyBulletX[i] = -1000;
    enemyBulletY[i] = -1000;
  }

  for (int i=0; i < enemyX.length; i++) {
    enemyAlive[i] = true;
    enemyX[i] = (int)random(200, 500);
    enemyY[i] = (int)random(50, 500);
  }
}

void draw() {
  fill(0);
  frameCounter++;
  if (gameOver==false) {
    background(0);
    fill(0, 255, 0);
    rect(10, shipY, 30, 30);

    for (int i=0; i< bulletX.length; i++) {
      fill(0, 180, 0);
      ellipse(bulletX[i], bulletY[i], 18, 5);
      bulletX[i]+=10;
    }

    for (int i=0; i< enemyBulletX.length; i++) {
      fill(180, 0, 0);
      ellipse(enemyBulletX[i], enemyBulletY[i], 18, 5);
      enemyBulletX[i]-=30;
    }

    fill(255, 0, 0);
    for (int i = 0; i < enemyX.length; i++) {

      if (enemyAlive[i] ==true) {  
        rect(enemyX[i], enemyY[i], 30, 30);
      }
    }
    MoveEnemies();
    HitEnemyLogic();
    DeathLogic();


    /*for(int i=0;i<fire.length;i++){
     if(fire[i]==0){ */
    //  CreateEnemyBullet();
    /*  }
     else {
     }
     }*/
    if (upPressed) {
      if (shipY>0) {  
        shipY-=15;
      }
    }
    if (downPressed) {
      if (shipY< 570) {
        shipY+=15;
      }
    }

    if (shotReleased) {
      CreateBullet();
    }

    upPressed = false;
    downPressed = false;
    shotReleased = false;

    test=false;
    for (int i = 0; test==false && (i<enemyAlive.length);i++) {
      test=(enemyAlive[i]==true);
    }

    if (test==false) {
      background(0);
      fill(255);
      textFont(myFont, 48);
      if (!timerCreated) {
        seconds=frameCounter/60;
        timerCreated=true;
      }
      text("YOU WIN!!!",172, 240);
      textFont(myFont, 35); 
      text( "It took you "+(seconds)+" seconds. ", 130, 300);
      textFont(myFont, 30); 
      text("Press the R key to reset.", 137, 360);
    }
    fill(255);
  }
  else if (gameOver) {
    background(0);
    fill(255);
    textFont(myFont, 48); 
    text("GAME OVER", 165, 300);
    textFont(myFont, 30); 
    text("Press the R key to reset.", 130, 350);
  }
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
  //change to clicked?
  if (keyCode == 32) {
    shotReleased=true;
  }
  if (keyCode == 'R') {
    setup();
  }
}

void CreateBullet() {
  bulletX[thisBullet] = 45;
  bulletY[thisBullet] = shipY+15;

  if (thisBullet < 5) { 
    thisBullet++;
  }
  else {
    thisBullet=0;
  }
}

void CreateEnemyBullet() {
  for (int i=0;i<enemyAlive.length;i++) {
    if (enemyAlive[i]==true) {
      int index= int(random(enemyX.length));
      enemyBulletX[thisEnemyBullet] = enemyX[index];
      enemyBulletY[thisEnemyBullet] = enemyY[index]+15;

      if (thisEnemyBullet < 100) { 
        thisEnemyBullet++;
      }
      else {
        thisEnemyBullet=0;
      }
    }
  }
}

void HitEnemyLogic() {
  for (int i=0; i<bulletX.length; i++) {
    for (int j= 0; j< enemyX.length; j++) {
      if (bulletX[i]>enemyX[j]  
        && bulletX[i] < enemyX[j] + 30
        && bulletY[i] > enemyY[j] 
        && bulletY[i] <enemyY[j]+30
        && enemyAlive[j]==true) {
        enemyAlive[j]=false;
        bulletY[i] = -1000;
      }
    }
  }
}


void DeathLogic() {
  for (int i=0; i<enemyX.length; i++) {
    if (enemyX[i]>10 
      && enemyX[i] < 40
      && enemyY[i] > shipY
      && enemyY[i] < shipY+30
      && enemyAlive[i]==true
      || enemyX[i]>10 
      && enemyX[i] < 40
      && enemyY[i]+30 > shipY
      && enemyY[i]+30 < shipY+30
      && enemyAlive[i]==true)
    {
      //   enemyAlive[i]=false;
      gameOver=true;
    }
  }
  for (int i=0; i<enemyBulletX.length; i++) {
    if (enemyBulletX[i]>10
      && enemyBulletX[i] < 40
      && enemyBulletY[i] > shipY
      && enemyBulletY[i] < shipY+30) {
      gameOver=true;
      enemyBulletY[i] = -1000;
    }
  }
}

void MoveEnemies() {
  for (int i=0; i<enemyX.length; i++) {
    enemyX[i]-=4;
    if (enemyX[i]<10) {
      enemyX[i] = (int)random(500, 600);
      enemyY[i] = (int)random(50, 500);
    }
  }
}



/*
collision detection 
 ____________________
 for each bullet
 
 for each enemy
 
 does bulet hit enemy 
 
 if the bullet hits any enemy
 {
 set enemy to dead (this enemyAlive = false
 remove bullet
 }
 
 
 
 
 
 What we need
 _________
 ship
 enemies 
 -x position
 -y position
 -am I alive?
 fullets
 timer
 
 DRAW()
 check if bulllet hits enemies
 check if timer ran out
 move ship
 
 SETUP()
 place enemies
 
 */

