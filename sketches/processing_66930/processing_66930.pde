
PFont myFont;
String youLose, youWin;

int timer;
int shipY;
int [] enemyX;
int [] enemyY;
boolean[] enemyAlive;
int[] bulletX;
int[] bulletY;
int[] enemyBulletX;
int[] enemyBulletY;
int[] enemyYspeed;
int[] enemyXspeed;
boolean upPressed;
boolean downPressed;
boolean shotReleased;
boolean alive;
int thisBullet;
int thisEnemyBullet;
int shootingEnemy;
int shootingEnemyTimer;
int deadEnemyCount;


void setup () {
  
  size (600, 600);
  
  youLose = "YOU LOSE";
  youWin = "YOU WIN!!!";
  myFont = loadFont ("VisitorTT1BRK-48.vlw");
  textFont (myFont, 48);
  textAlign (CENTER);
  
  timer = 0;
  enemyX = new int [10];
  enemyY = new int [10];
  enemyYspeed = new int [10];
  enemyXspeed = new int [10];
  enemyAlive = new boolean [10];
  bulletX = new int [10];
  bulletY = new int [10];
  enemyBulletX = new int [20];
  enemyBulletY = new int [20];
  shipY = 50;
  frameRate (60);
  thisBullet = 0;
  thisEnemyBullet = 0;
  shootingEnemyTimer = 0;
  alive = true;
  deadEnemyCount = 0;
  
  for (int i = 0; i < bulletX.length; i++) {
    bulletX[i] = -1000;
    bulletY [i] = -1000;
  }
  
  for (int i = 0; i < enemyBulletX.length; i++) {
  enemyBulletX[i] = -1000;
  enemyBulletY[i] = -1000;
 }
  
  for (int i = 0; i < enemyX.length; i++) {
    enemyAlive[i] = true;
    enemyX[i] = (int) random (200, 500);
    enemyY[i] = (int) random (50, 500);
    enemyYspeed[i] = (int) random (-5, 5);
    enemyXspeed[i] = (int) random (-5, 5);
    
    while (enemyXspeed[i] == 0) { 
    enemyXspeed[i] = (int) random (-5, 5);
    }
    
    while (enemyYspeed[i] == 0) { 
    enemyYspeed[i] = (int) random (-5, 5);
    }

  }
}


void draw () { 
  
  if (alive == true && deadEnemyCount < 10) {
            
            background (0);
            fill ( 0, 255, 0 );
            rect ( 10, shipY, 30, 30);
            
            CreateEnemyBullet ();
            
            fill (0, 180, 0);
            for (int i = 0; i < bulletX.length; i++) {
            ellipse (bulletX[i], bulletY[i], 6, 6);
            bulletX[i] += 10;   
              
            }
            
            fill (180, 0, 0);
            for (int i = 0; i < enemyBulletX.length; i++) {
            ellipse (enemyBulletX[i], enemyBulletY[i], 6, 6);
            enemyBulletX[i] -= 5;   
              
            }
            
          enemy();
            
          HitEnemyLogic();
          
          HitMeLogic ();
            
            if (upPressed ==  true) {
             shipY -= 3;
              
            }
          
            if (downPressed ==  true) {
             shipY += 3;
            }
            
            if (shotReleased == true) {
              
             CreateBullet(); 
              
            }
          
           shotReleased = false;
           timer += 1;
 
            
     } else {
       
       if (alive == false){
       background (0);
       fill (255, 0, 0);
       text (youLose, width/2, height/2);
       
       }
       
       if (deadEnemyCount >= 10 ){
       background (0);
       fill (0, 255, 0);
       text (youWin, width/2, height/2);
       text (timer / 60, width/2, height/2 + 50);
       
       }
   
 }


}

void keyPressed () {
  
  if (keyCode == UP) {
  upPressed = true;  
  }
  
  if (keyCode == DOWN) {
  downPressed =  true;  
  }
  
}

void keyReleased () {
 if (keyCode == 32) {
   shotReleased = true;
   println ("SHOT");
 }
   
   if (keyCode == UP) {
  upPressed = false;  
  }
  
  if (keyCode == DOWN) {
  downPressed =  false;  
  }
  
  if (keyCode == 'R') {
  reset();  
  }


}

void CreateBullet () {
  
 bulletX [thisBullet] = 45;
 bulletY [thisBullet] = shipY;
 
 if ( thisBullet < 5 ) {
 thisBullet++; 
 
 } else {
  thisBullet = 0;
  
   
 }
  
}

void CreateEnemyBullet () {
 
 if (shootingEnemyTimer > 30) {
  
 shootingEnemy = (int) random (0, enemyX.length);
 
 while (enemyAlive[shootingEnemy] == false) {  

    shootingEnemy = (int) random (0, enemyX.length);
   
 }
 
  
 enemyBulletX [thisEnemyBullet] = enemyX[shootingEnemy] ;
 enemyBulletY [thisEnemyBullet] = enemyY[shootingEnemy] ;
 
 if ( thisEnemyBullet < 19 ) {
 thisEnemyBullet++; 
 
 } else {
  thisEnemyBullet = 0;
 }
 
 shootingEnemyTimer = 0;
 
 } else {
 
 shootingEnemyTimer += 1;
 }
}

void HitMeLogic () {
   for (int i = 0; i < enemyBulletX.length; i++) {
   if ( enemyBulletX[i] < 40 
       && enemyBulletX[i] > 10 
       && enemyBulletY[i] > shipY
       && enemyBulletY[i] < shipY + 30) {
        
        alive = false;
        enemyBulletY[i] = -1000;
         
       }
   }
 }

void HitEnemyLogic () {
 for (int i = 0; i < bulletX.length; i++) {
  for (int j = 0; j < enemyX.length; j++) {
   if ( bulletX[i] > enemyX[j] 
       && bulletX[i] < enemyX[j] + 30 
       && bulletY[i] > enemyY[j] 
       && bulletY[i] < enemyY[j] + 30
       && enemyAlive[j] == true){
        
        enemyAlive[j] = false;
        deadEnemyCount += 1;
        bulletY[i] = -1000;
         
       }
   }
 }
 
  
}

void enemy () {
  
    fill (255, 0, 0);
  
  for ( int i = 0; i < enemyX.length; i++) {
  
      if (enemyAlive[i] == true) {  
      rect (enemyX[i], enemyY[i], 30, 30);
      
          if (enemyY[i] > 570 || enemyY[i] < 0) {
          enemyYspeed[i] = enemyYspeed[i] * -1;} 
          
          if (enemyX[i] > 570 || enemyX[i] < 100) {
          enemyXspeed[i] = enemyXspeed[i] * -1;} 
          
      enemyY[i] += enemyYspeed[i];
      enemyX[i] += enemyXspeed[i];
      
      }
  }
}

void reset () {
  
  timer = 0;
  enemyX = new int [10];
  enemyY = new int [10];
  enemyYspeed = new int [10];
  enemyXspeed = new int [10];
  enemyAlive = new boolean [10];
  bulletX = new int [10];
  bulletY = new int [10];
  enemyBulletX = new int [20];
  enemyBulletY = new int [20];
  shipY = 50;
  frameRate (60);
  thisBullet = 0;
  thisEnemyBullet = 0;
  shootingEnemyTimer = 0;
  alive = true;
  deadEnemyCount = 0;
  
  for (int i = 0; i < bulletX.length; i++) {
    bulletX[i] = -1000;
    bulletY [i] = -1000;
  }
  
  for (int i = 0; i < enemyBulletX.length; i++) {
  enemyBulletX[i] = -1000;
  enemyBulletY[i] = -1000;
 }
  
  for (int i = 0; i < enemyX.length; i++) {
    enemyAlive[i] = true;
    enemyX[i] = (int) random (200, 500);
    enemyY[i] = (int) random (50, 500);
    enemyYspeed[i] = (int) random (-5, 5);
    enemyXspeed[i] = (int) random (-5, 5);
    
    while (enemyXspeed[i] == 0) { 
    enemyXspeed[i] = (int) random (-5, 5);
    }
    
    while (enemyYspeed[i] == 0) { 
    enemyYspeed[i] = (int) random (-5, 5);
    }

  }
  
}

