
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/94094*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/* Super Mario NOs: Featuring Yayson Wang and some Space Invaders*/
import java.lang.Math;
import java.util.ArrayList;

float scale=1;
boolean left = false;
boolean right = false;
boolean up = false;
boolean down = false;
boolean space = false;
float GPA = 4.0;
float gravity = .4;
float friction = .2;
int pX = 0;
int pY = 0;  
float velX;
float velY;
float velAcc = .4;
int jumpSpeed= -11;
int velMax = 4;
int ground = 48;
int pWidth = 18;
int pHeight = 64;
int inWidth = 44;
int inHeight = 32;
boolean airborne = false;
boolean stomp = false;
boolean leveledUp = false;
boolean hitLeft=false;
boolean hitRight=false;
boolean hitTop=false;
boolean hitBottom=false;
int NOtime = 0;
int MITtime = 0;
int pInvincible = 0;
int pRecoveryTime = 120;
int score = 0;
int combo = 0;
int numInvaders = 0;
int maxInvaders = 5;
int enemyRespawn = 600;
int enemyTimer = 0;
ArrayList<Invader> inList;
PImage yStand;
PImage yStandB;
PImage yWalk;
PImage yaySprite;
PImage bg;
Player yay;
Obstacles obs;
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
void setup() {
  size(640, 480);
  background(0);
  frameRate(60);
  yay = new Player();
  obs = new Obstacles();
  inList = new ArrayList<Invader>();
  yStand = loadImage("yStand.png");
  yStandB = loadImage("yStandB.png");
  yWalk = loadImage("yWalk.png");
  yaySprite = yStand;
  bg = loadImage("mario-1-1.png");
  image(yStand, pX, pY);
}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
void draw() {
  noSmooth();
  //scale(scale);
  background(0);
  image(bg, 0, 0);
  //System.out.println(pInvincible);
  manageThings();
  yay.drawPlayer();
  printHUD();
}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
void keyPressed() {
  if (key == 'w' || key == 'W') {
    if (!airborne && velY<=1) {
      up = true;
      velY = jumpSpeed;
      airborne=true;
    }
  }
  if (key == 's' || key == 'S') {
    down = true;
    velY-=jumpSpeed;
    stomp = true;
  }
  if (key == 'a' || key == 'A') {
    left = true;
    right = false;
    yaySprite = yStand;
  }
  if (key == 'd' || key == 'D') {
    right = true;
    left = false;
    yaySprite = yStandB;
  }
  if (key == ' ')
    space = true;
}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
void keyReleased() {
  if (key == 'w' || key == 'W')
    up = false;
  if (key == 's' || key == 'S')
    down = false;
  if (key == 'a' || key == 'A')
    left = false;
  if (key == 'd' || key == 'D')
    right = false;
  if (key == CODED && keyCode == DOWN)
    restartGame();
}
int collision(int left, int right, int top, int bottom, int objVelX, int objVelY) {
  if (pX+pWidth+velX-objVelX>left && pX+velX-objVelX<right && pY+pHeight+velY>top && pY+velY<bottom) {
    if ((velX>0 && objVelX==0) && pX+pWidth-velX<left) {
      pX=left-pWidth;
      velX = 0;
      //System.out.println("BouncefromLeft");
      return 1;
    }
    if ((velX<0 && objVelX==0) && pX-velX>right) {
      pX=right;
      velX = 0;
      //System.out.println("BouncefromRight");
      return 2;
    }
    if (velY>0 && pY+pHeight-velY<top) {
      pY=top-pHeight;
      //velY /= -5;
      velY = objVelX;
      airborne = false;
      //System.out.println("BouncefromTop");
      return 3;
    }
    if ((velY<0 && objVelX==0) && pY-velY>bottom) {
      pY=bottom;
      velY = objVelX;
      //System.out.println("BouncefromBottom");
      return 4;
    }
    //System.out.println("BAD YAYSON");
    return 0;
  }
  //System.out.println("YAYSON CHECKS COLLISIONS");
  return -1;
}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
void manageThings(){
  enemyTimer++;
  //System.out.println("Time: " + enemyTimer);
  if(enemyTimer%120==0 && numInvaders<maxInvaders-1){
    Invader inv = new Invader();
    inList.add(inv);
    numInvaders++;
    //System.out.println(numInvaders +" , "+ maxInvaders);
  }
  for(Invader inv : inList){
    inv.drawInvader();
  }
  if (!leveledUp){
    leveledUp = true;
    if(score%(maxInvaders*2)==0){
      maxInvaders++;
      for(Invader inv : inList)
        inv.inVelX +=.5;
      //GPA+=0.01;
    }/* else if (score%(maxInvaders/2)==0){
      GPA += 0.01;
    }*/
  }
  if(GPA>4.0) GPA=4.0;
  /*if(GPA<3.90)
    System.out.println("YAYSON SAYS NOOOOOOOOOOOOOOOOOOOOOOOO");
  System.out.println(score +" , "+ GPA);*/
}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
void printHUD() {
  if(score>=80 && GPA>3.8){
    text("Yayson got into MIT!", 220, 260);
    score=80;
  }
  if(GPA<3.9 && score<80 || GPA<3.8 && score >= 80){
    text("Yayson got rejected from MIT :(", 180, 260);
    pInvincible=999999;
  }
  textSize(24);
  text("SAT: " + (score*10+1600), 10, 30);
  text("GPA: " + GPA, 510, 30);
}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
void restartGame(){
    score = 0;
    GPA = 4.0;
    pX=150;
    pY=480-ground-pHeight;
    inList = new ArrayList<Invader>();
    numInvaders = 0;
    maxInvaders = 5;
    enemyTimer=0;
    pInvincible=0;
    manageThings();
}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
public class Player {
  Player() {
    pX=150;
    pY=480-ground-pHeight;
    velX=0;
    velY=0;
  }
  void drawPlayer() {
    if (left && velX > -velMax) {
      if (velX>0)
        velX=0;
      else
        velX-=velAcc;
    }
    if (right && velX < velMax) {
      if (velX<0)
        velX=0;
      else
        velX+=velAcc;
    }
    if (!left && velX<-friction)
      velX+=friction;
    if (!right && velX>friction)
      velX-=friction;
    obs.checkCol();
    pX+=(int)velX;
    pY+=(int)velY;
    if (pX < 0) {
      pX = 0;
      velX = 0;
    }
    if (pX > 640-pWidth) {
      pX = 640-pWidth;
      velX = 0;
    }
    velY += gravity;
    //System.out.println(pX + " , " + pY + " , " + velX + " , " + velY + " , " + airborne);
    if(pInvincible>0){
      if(pInvincible%10>5)
        tint(255,200);
      else
        tint(255,120);
      pInvincible--;
    }else{
      noTint();
    }
    image(yaySprite, pX, pY);
    if (pY+pHeight<0) {
      noStroke();
      fill(255);
      rect(pX, 0, pWidth, 4);
    }
    noTint();
  }
}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
public class Invader {

  private int inYNormal = (int)(Math.random()*4)*100+90;
  private int inYStart = 500; 
  private int inX = (int)(Math.random()*(640-inWidth));
  private int inY = inYStart;
  private int inVelX = (int) (Math.random()*2)+3;
  private int inVelY = -10;
  private int red = (int)(Math.random()*2)*240+15;
  private int green = (int)(Math.random()*2)*240+15;
  private int blue = (int)(Math.random()*2)*240+15;
  PImage inSprite;
  PImage inSpriteB;
  int colType = -1;
  private boolean alive = true;

  Invader() {
    inSprite = loadImage("invader.png");
    inSpriteB = loadImage("invaderB.png");
  }

  void drawInvader() {
    if (pInvincible<=0)
      colType = collision(inX, inX+inWidth, inY, inY+inHeight, inVelX, inVelY);
    if (colType == 3) {
      //System.out.println("Yayson stepped on a bug.");
      inVelY = 10;
      inY+=inVelY;
      if(stomp == true){
        velY = -jumpSpeed;
        inVelY = -jumpSpeed;
      } else {
        velY = jumpSpeed;
        pY += velY;
        combo++;
      }
      image(yaySprite, pX, inY-pHeight);
      airborne = true;
      score++;
      leveledUp = false;
      alive = false;
    } else if (pInvincible<=0 && combo<1 && colType>=0 && inY <= inYNormal){
      GPA-=.01;
      pInvincible=pRecoveryTime;
        //System.out.println("Yayson was NOwned");
    }
    if (inY > inYNormal && inY <= inYStart)
      inY += inVelY;
    else if (inY <= inYNormal){
      inVelY = 0;
      inY = inYNormal;
    }else if (inY > inYStart){
      inY = inYStart;
      inVelY=0;
    }
    if (inY <= inYNormal+inWidth || inY >= inYStart-inWidth) {
      inX += inVelX;
      //System.out.println("ITS ALIVE");
    }
    if (inX < 0) {
      inX=0;
      inVelX *= -1;
    }
    if (inX > 640-inWidth) {
      inX = 640-inWidth;
      inVelX *= -1;
    }
    if(!alive && inY>=inYStart && enemyTimer%enemyRespawn==Math.min(enemyRespawn-1, inYNormal)){
      inVelY = -10;
      inYNormal = (int)(Math.random()*4)*100+90;
      inVelX = (int) (Math.random()*2)+3;
      red = (int)(Math.random()*2)*240+15;
      green = (int)(Math.random()*2)*240+15;
      blue = (int)(Math.random()*2)*240+15;
    }
    //System.out.println(inX + " , " + inY + " , " + inVelX + " , " + inVelY);
    //System.out.println(combo);
    tint(red, green, blue);
    if((inX+100)%200>100)
      image(inSprite, inX, inY);
    else
      image(inSpriteB, inX, inY);
    tint(255);
  }
}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
public class Obstacles {
  int pipeLeft = 336;
  int pipeRight = 336+64;
  int pipeTop = 368;
  int pipeBottom = 368+64;
  int platLeft = 80;
  int platRight = 80+160;
  int platTop = 304;
  int platBottom = 304+32;
  int blockLeft = 144;
  int blockRight = 144+32;
  int blockTop = 176;
  int blockBottom = 176+32;
  int groundLeft = 0;
  int groundRight = 640;
  int groundTop = 480-48;
  int groundBottom = 480;  
  Obstacles() {
  }
  void checkCol() {
    int checkCombo = 0;
    checkCombo += collision(pipeLeft, pipeRight, pipeTop, pipeBottom, 0, 0);
    checkCombo += collision(platLeft, platRight, platTop, platBottom, 0, 0);
    checkCombo += collision(blockLeft, blockRight, blockTop, blockBottom, 0, 0);
    checkCombo += collision(groundLeft, groundRight, groundTop, groundBottom, 0, 0);
    if (combo>=0 && checkCombo > -4) {
      if (combo>=3)
        score += combo;
      combo = 0;
      //System.out.println("COMBO ENDED");
      stomp = false;
    }
  }
}


