
//CREATED BY BRAVE DYLAN HAGER
//802 COMPUTERS ELECTIVE

//creation of variables
//float - decimal
//PImage - image
float vX = 0;
float posX = 240;
PImage pReg;
PImage pLeft;
PImage pRight;
PImage redLaser;
PImage eI;
PImage mouseC;
PImage gDisplay;
PImage bg1;
PImage sL;
PImage metI;
PImage player;
float laserY;
float laserX;
float enemyX;
float enemyY;
int enemyType;
int enemyH;
float enemyS;
int pointDis = 000;
PFont standrd;
int gameOver;
float sl1y;
float sl2y;
float sl3y;
float sl4y;
float sl5y;
float sl6y;
float sl1x;
float sl2x;
float sl3x;
float sl4x;
float sl5x;
float sl6x;
float slS = 40;
float mX;
float mY;
int pH;
int i;

//run once, at startup
void setup() {
  size (480,360);
  //note that the preset FPS is 60, considerably useless
  //most games run at 30 FPS
  frameRate(30);
  importImgs();
  gameOver = 0;
  enemyS = 3;
  pH = 3;
}

//imports all images needed
void importImgs() {
  pReg = loadImage ("player.png");
  pLeft = loadImage ("playerLeft.png");
  pRight = loadImage ("playerRight.png");
  redLaser = loadImage ("laserRed.png");
  eI = loadImage ("enemyShip.png");
  mouseC = loadImage ("redShot.png");
  standrd = loadFont("standrd.vlw");
  gDisplay = loadImage("endDisp.png");
  bg1 = loadImage("starBackground.png");
  sL = loadImage("speedLine.png");
  metI = loadImage("meteorSmall.png");
  player = loadImage("life.png");
}

//done every tick (30 FPS)
void draw() {
    drawBg();
    noCursor();
    checkDist();
    posX = posX + vX;
    vX = vX * 0.9;
    imageMode(CENTER);
    image(redLaser,laserX,laserY-40);
    laserY = laserY - 40;
    printPlayer();
    printEnemy();
    printMeteor();
    damageCheck();
    printScore();
    enemyS = pointDis * 0.002  + 1;
    genSL();
    imageMode(CENTER);
    image(mouseC,mouseX,mouseY);
    image(sL,sl1x,sl1y);
    image(sL,sl2x,sl2y);
    image(sL,sl3x,sl3y);
    printHealth();
    if (gameOver == 1) {
    image(gDisplay,240,180);
    textFont(standrd);
    textAlign(CENTER);
    text(pointDis,240,320);
    float slS = pointDis*0.04 + 10;
    }
}

//checking if x needs to be updated
void checkDist() {
  //if x is not close to mouse's x, increase velocity
  if (posX > mouseX + 8 || posX < mouseX - 8) {
    if (posX > mouseX) {
      vX = vX - 2.3;
    } else {
     vX = vX + 2.3;
    }
  } else {
    posX = mouseX;
  }
}

//drawing an image at the x position
void printPlayer() {
  imageMode(CENTER);
  if (abs(vX) < 2) {
    image(pReg,posX,300);
  } else {
    if (vX > 2) {
      image(pRight,posX,300);
} else {
  image(pLeft,posX,300);
}
  }
}

void mouseReleased() {
  if (laserY < 0) {
  laserY = 300;
  laserX = posX;
  }
}

void damageCheck() {
  if (laserX < enemyX + 30 && laserX > enemyX - 30 && laserY > enemyY - 70 && laserY < enemyY + 70) {
   enemyH = enemyH - 1;
   laserY = -10;
   pointDis = pointDis + 100;
  }
}

void printScore() {
  textFont(standrd);
  text(pointDis,10,40);
}

void printEnemy() {
  if (enemyH < 1) {
    enemyX = random(20,460);
    enemyY = -40;
    enemyH = 2;
  } else {
    enemyY = enemyY + enemyS;
    if (enemyY > 340) {
      gameOver = 1;
  }
  image(eI,enemyX,enemyY);
  }
}

void drawBg() {
  imageMode(CORNER);
  image(bg1,0,0);
  image(bg1,254,0);
  image(bg1,0,255);
  image(bg1,254,255);
}

void genSL() {
  if (sl1y > 360) {
    sl1x = random(0,480);
    sl1y = random(-40,0);
  }
  
  if (sl2y > 360) {
    sl2x = random(0,480);
    sl2y = random(-40,0);
  }
  
  if (sl3y > 360) {
    sl3x = random(0,480);
    sl3y = random(-40,0);
  }

  sl1y = sl1y + slS/2;
  sl2y = sl2y + slS/2;
  sl3y = sl3y + slS/2;
}

void printMeteor() {
  if (mY > 360) {
    mY = random(-100,-40);
    mX = random(0,480);
  } else {
    mY = mY + pointDis * 0.008 + 5;
  }
  image(metI,mX,mY);
  if (laserX < mX + 30 && laserX > mX - 30 && laserY > mY - 30 && laserY < mY + 30) {
    mY = 400;
  }
  if (posX < mX + 30 && posX > mX - 30 && 300 > mY - 30 && 300 < mY + 30) {
    pH = pH - 1;
    mY = 400;
    if (pH == 0) {
      gameOver = 1;
    }
  }
}

void printHealth() {
  imageMode(CENTER);
  if (pH == 3) {
    image(player,440,20);
    image(player,400,20);
    image(player,360,20);
  }
  
  if (pH == 2) {
    image(player,400,20);
    image(player,360,20);
  }
  
  if (pH == 1) {
    image(player,360,20);
  }
}


