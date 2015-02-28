
//Global Varibles
Enemy myEnemy; //Enemey object Oriented varible
Enemy myEnemy1; //Second Enemy Object Variable
Enemy myEnemy2; //Second Enemy Object Variable
Enemy myEnemy3; //Second Enemy Object Variable
Enemy myEnemy4; //Second Enemy Object Variable
Enemy myEnemy5; //Second Enemy Object Variable
Enemy myEnemy6; //Second Enemy Object Variable
Enemy myEnemy7; //Second Enemy Object Variable
Enemy myEnemy8; //Second Enemy Object Variable
Enemy myEnemy9; //Second Enemy Object Variable
Enemy myEnemy10; //Second Enemy Object Variable
Enemy myEnemy11; //Second Enemy Object Variable
Enemy myEnemy12; //Second Enemy Object Variable
Player myPlayer; //Player Object Oriented varible
//================================================
//code turning project 10-10 in the book into bullets
Bullets[] bullets; // An array of drops object
int totalBullets = 0; //total drops
Timer timer; // one timer object
//==================================
//stars field to make it more like a space game
float y = 50; //vertical location of each star
float x = 10; //intial horizontal location of the first line
float y1 = 50; //vertical location of each star
float x1 = 50; //intial horizontal location of the first line
float Cid = 5; //width of the ellipse
float spacing = 45; //How far apart is each star
float spacing1 = 10; //How far apart is each star
float dia = 5; //height of each star
float endStars = 985;
float r;
float g;
float b;
float a;
//====================================
//rock field
int iLoop1; //intilasing loop for stars
int iNumStars = 100; // Numbers of stars in loop
int[][] iStars = new int[iNumStars][4];// The array for the stars
//Global variables listed above
//======================================
//player Bullets list
float lastPress;
ArrayList pbullets;
//============================Font On Screen=================
PFont f;
//--Global Variable end--

//================SETUP==============================
void setup(){ //basic setup for enemy 3 test
  imageMode(CENTER);
  size(1000,680); //skect size
  smooth(); //does something i forgot
  for (iLoop1 = 0; iLoop1<iNumStars; iLoop1++){
   iStars[iLoop1][0]=int(random(height)); // Array 0 is a int holding the value of a random width location
   iStars[iLoop1][1]=int(random(width)); // Array 1 is a int holding the value of a random height location
   iStars[iLoop1][2]=int(random(1, 4)); //Array 2 is holding a int value that random 1,4 not 100% sure what this means
   iStars[iLoop1][3]=int(128 + random(127));// Array holding a int for value 128 + a random number times 127? not sure what going on here
 }
  myEnemy = new Enemy(0,500,390,5);// initializin enemy varible
  myEnemy1 = new Enemy(1,200,120,2); //in3itializing second varible of enemy
  myEnemy2 = new Enemy(2,500,250,7); //initializing second varible of enemy
  myEnemy3 = new Enemy(3,250,390,5); //initializing second varible of enemy
  myEnemy4 = new Enemy(4,100,250,3); //initializing second varible of enemy
  myEnemy5 = new Enemy(5,50,66,4); //initializing second varible of enemy
  myEnemy6 = new Enemy(6,300,100,1); //initializing second varible of enemy
  myEnemy7 = new Enemy(7,0,300,6); //initializing second varible of enemy
  myEnemy8 = new Enemy(8,300,400,8); //initializing second varible of enemy
  myEnemy9 = new Enemy(9,0,230,9); //initializing second varible of enemy
  myEnemy10 = new Enemy(10,300,480,10); //initializing second varible of enemy
  myEnemy11 = new Enemy(11,300,200,12); //initializing second varible of enemy
  myEnemy12 = new Enemy(12,300,100,11); //initializing second varible of enemy
  myPlayer = new Player();
  bullets = new Bullets[50]; //crate 30 spots in the array
  timer = new Timer(500); //created a times goes off every 2 second
  timer.start(); //starting the timer
  pbullets = new ArrayList(); // bullet list 
  f = createFont("Arial",12,true); // A font to write text on the screen
}
//================SETUP==============================

//================MAIN================================
void draw(){ //our main program 
//==========================Display Text On Screen======================\\
 // Display number of lives left
   noTint();
   smooth();
   background(0);
   textSize(20);
   fill(255);
   text("Player Total Score:", 0, 20);
   text("Player Life:", 860, 20);
//===============================Stars Fields===========================\\  
  starField(10,15,1,1);
  starField(30,40,2,2);
  starField(10,80,1,1);
  starField(30,120,2,2);
  starField(10,160,1,1);
  starField(30,210,2,2);
  starField(10,280,1,1);
  starField(30,350,2,2);
  starField(10,420,1,1);
  starField(30,470,2,2);
  starField(10,520,1,1);
  starField(30,590,2,2);
  starField(10,640,1,1);
//===========================Star Field==========================\\

//===========================Moving Rocks=========================\\
  updatestars();
  for (iLoop1=0; iLoop1<iNumStars; iLoop1++) { //this is a for loop statement 
  fill(iStars[iLoop1][3]); //thes using array 3 to fill in the star but again I didnt understand what array 3 was doing to behing with
  ellipse(iStars[iLoop1][1], iStars[iLoop1][0], 2, 2); // this is the ellipse that makes up the stars array 0 and 1 make up the x and y location with explains how the stars appears in different location each loop, this also controls the movement of the field of stars
 }
//===========================Moving Rocks=========================\\

//=============================Enemy Bullet ========================\\
  if (timer.isFinished()){
    //deal with raindrops
    //intialize raindrops
    bullets[totalBullets] = new Bullets();
    //Increment totalDrops
    totalBullets++;
    //if we hit the end of the array
    if (totalBullets >= bullets.length){
    totalBullets = 0; //start over
    }
    timer.start();
  }
  for (int i = 0; i < totalBullets; i++){
    bullets[i].move();
    bullets[i].display();
    if(bullets[i].hitPlayer()){
     myPlayer.phit();
   }
    }
//=========================Enemy Bullet===================\\
//==========================Enemies=======================\\  
  myEnemy.drawEnemy();
  myEnemy.moveEnemy();
  myEnemy.wallCheck(); 
  myEnemy1.drawEnemy();
  myEnemy1.moveEnemy();
  myEnemy1.wallCheck();
  myEnemy2.drawEnemy();
  myEnemy2.moveEnemy();
  myEnemy2.wallCheck();
  myEnemy3.drawEnemy();
  myEnemy3.moveEnemy();
  myEnemy3.wallCheck();
  myEnemy4.drawEnemy();
  myEnemy4.moveEnemy();
  myEnemy4.wallCheck();
  myEnemy5.drawEnemy();
  myEnemy5.moveEnemy();
  myEnemy5.wallCheck();
  myEnemy6.drawEnemy();
  myEnemy6.moveEnemy();
  myEnemy6.wallCheck();
  myEnemy7.drawEnemy();
  myEnemy7.moveEnemy();
  myEnemy7.wallCheck();
  myEnemy8.drawEnemy();
  myEnemy8.moveEnemy();
  myEnemy8.wallCheck();
  myEnemy9.drawEnemy();
  myEnemy9.moveEnemy();
  myEnemy9.wallCheck();
  myEnemy10.drawEnemy();
  myEnemy10.moveEnemy();
  myEnemy10.wallCheck();
  myEnemy11.drawEnemy();
  myEnemy11.moveEnemy();
  myEnemy11.wallCheck();
  myEnemy12.drawEnemy();
  myEnemy12.moveEnemy();
  myEnemy12.wallCheck();
////////////////////////////ENEMIES/////////////////////////////

//========================Player===============================
  myPlayer.drawPlayer();
//========================Player===============================

/////////////////////////Player BULLETS/////////////////////////////
  //DISPLAY, FUNCTIONS for BULLETS
  for (int i = pbullets.size()-1; i>=0; i--)
  {
    pBullet pbullet =(pBullet) pbullets.get(i);
    pbullet.movement();
    pbullet.display();
  }
}
//================MAIN================================================

/////////////////////////Player BULLETS/////////////////////////////
 void keyPressed(){
     if (key == CODED) {
     if (keyCode == RIGHT && myPlayer.playerX < width - 50) {
       myPlayer.moveRight();
   }

     if (keyCode == LEFT && myPlayer.playerX > 0) {
        myPlayer.moveLeft();
}
     if ( myPlayer.playerX < 0){
      myPlayer.playerX = 0;
     }
     }
////////////////////// SHOTBUTTON//////////////////////////////////////// 
    if (keyPressed)
    {
       if (key == ' ' && millis() - lastPress > 500)
      {
        pbullets.add(new pBullet(myPlayer.playerX,myPlayer.playerY-25, 5, 5));
      }
  }
    }
    void starField(float x, float y,float cid,float dia){
    r = random(255);
    g = random(255);
    b = random(255);
    a = random(255);
    noStroke();
    while (x <= endStars){
       fill(r,g,b,a);
         ellipse(x,y,Cid,dia);
            x = x + spacing;
 }
}
void updatestars() {

float iPX=myPlayer.playerX;
float iPY=myPlayer.playerY;

for (iLoop1=0; iLoop1<iNumStars; iLoop1++) { //loop for speed of the stars

iStars[iLoop1][0] = iStars[iLoop1][0] + iStars[iLoop1][2]; //this controls the stars going left to right but once I change the - to a + they wont repeat how would i effect this to change it to go from bottom on sketch to the top
//I know this is very important in the control of flow of stars
//but have no idea what i have to change here to make it go up and down
//==========================================================
//be pushed by mouse
// if near in X
if (abs(iPX-iStars[iLoop1][1]) < 20){
//move faster ('near') stars more
//if near and above cursor
if ((iPY > iStars[iLoop1][0]) && (abs(iPY - iStars[iLoop1][0]) < 20)) iStars[iLoop1][1]= iStars[iLoop1][1] - 2 * iStars[iLoop1][2];
//if near and below cursor
if ((iPY < iStars[iLoop1][0]) && (abs(iPY - iStars[iLoop1][0]) < 20)) iStars[iLoop1][1]= iStars[iLoop1][1] + 2 * iStars[iLoop1][2];
}

//off-screen - reset
if (iStars[iLoop1][0] > 670) { //this is is istars the variable array 0 when its less than 0 do this loop

iStars[iLoop1][0] = int(random(height)); //sets the first array back to equal the width again
iStars[iLoop1][1] = int(random(width)); //sets array 1 to equal the height again
iStars[iLoop1][2] = int(random(1, 3)); //I know this is part of the speed but not a 100% sure
iStars[iLoop1][3] = int(128 + random(127));// this loop 3 is controling the fill of the star not sure how its chaging the colors
  }
 }
}

//algorithim chapter for bullets 10.5 part 2 
class Enemy{
  PImage [] imagesEnemy = new PImage [13];
  int enemyType;
  float enemyX;
  float enemyY;
  float speed;

  Enemy(int _enemyType, float tempXpos, float tempYpos, float tempXspeed) {
    enemyType = _enemyType;
    enemyX = tempXpos;
    enemyY = tempYpos;
    speed = tempXspeed;
    for(int i=0; i<imagesEnemy.length; i++){
      imagesEnemy[i] = loadImage("Enemy_" + i + ".png");
      //println(imagesEnemy[i]);
    }
  }
  void drawEnemy(){
    //println(imagesEnemy[0]);
    image(imagesEnemy[enemyType],enemyX,enemyY);
  }
  void moveEnemy(){
    // Change the x location by speed
    enemyX = enemyX + speed;
  }
  void wallCheck(){
    if ((enemyX > width - 100) || (enemyX < 0)){
      speed = speed * -1;
   }
  }
    //if the enemy is hit
     void hit(){
    speed = 0; //stop it from moving by setting it = 0
    //set the location off screen
    y = -1000;
    }
}
class Player{//Player Class with all the information for the player
   float playerX; //x postion of player 
   float playerY; //y postion of player 
   float pspeed; //players speed
   PImage Player_1; // space-ship-cointainer
   PImage damage; //player hit
   
   Player(){
   Player_1 = loadImage("Player_1.png");
   playerX = 500;
   playerY = 600;
   pspeed = 50;
   }
    void drawPlayer(){
    image(Player_1,playerX,playerY);
  }
    void moveRight(){
         playerX = playerX + pspeed;
     }
    void moveLeft(){
       playerX = playerX - pspeed;
     }
     //if the layer is hit
     void phit(){
       damage = loadImage("damage.png");
       //tint(0, 153, 204, 126);  // Tint blue and set transparency
       image(damage,500,600);
    }
}
class Bullets{
  float xBullet; //variable for x location of bullet
  float yBullet; //variable for y location of bullet
  float speed; //speed of raindrop
  color c; //color of raindrop
  float r; //radius of raindrop
  float iHPX; // player x value
  float iHPY; // player y value
  
  Bullets(){
    r = 8;  //All raindrop are the same zise
    xBullet = myEnemy.enemyX; // start with a random x location
    yBullet = myEnemy.enemyY; //start a little above the widnow
    speed = random(1,2); //pick a random speed
    c = color(50,100,150); //color
  }
  
  //Move the raindrop down
  void move(){
    yBullet += speed; // Increment by speed
  }
  //check if it hits the bottom
  boolean reachedBottom(){
    if (yBullet > height + r*4) { //if we goa little beyond the bottom
    return true;
    }
    else{
      return false;
    }
  }
  //display the raindrop
  void display(){
    fill(c);
    noStroke();
    for (int i = 2; i < r; i++){
      ellipse(xBullet,yBullet +i*2,i*1,i*1);
    }
  }
  boolean hitPlayer(){
    float iHPX=myPlayer.playerX; // check player x axis
    float iHPY=myPlayer.playerY; // check player y axis
    
   if (abs(iHPX - xBullet) < 20){
    //move faster ('near') stars more
    //if near and above cursor
    if ((iHPY > yBullet) && (abs(iHPY - yBullet) < 20)) 
       yBullet = yBullet - 10 * yBullet;
    //if near and below cursor
    if ((iHPY < yBullet) && (abs(iHPY - yBullet) < 20)) 
        yBullet = yBullet + 10 * yBullet;
      return true;
    }
    else {
      return false;
    }  
  }
}
class Timer{
  
  int savedTime; //when the timer started
  int totalTime; //how long timer should last
  
  Timer(int tempTotalTime){
    totalTime = tempTotalTime;
  }
  
  //starting the timer
  void start(){
    savedTime = millis();
  }
  
  boolean isFinished(){
    //check out much time has pass
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime){
      return true;
    }
    else{
      return false;
    }
  }
}
class pBullet{
 
     //variables
  float xPos;
  float yPos;
  float hPos;
  float wPos; 
  float speed = 5;
  boolean keys = false;

  //constructor
  pBullet(float _xPos, float _yPos, float _h, float _w)
  {
    xPos = _xPos;
    yPos = _yPos;
    hPos = _h;
    wPos = _w;
  }
 
   void movement() {
    // Add speed to y location
    yPos = yPos - speed;
  }
 
  void display() {
    fill(255);
    strokeWeight(2);
    rect(xPos,yPos,wPos,hPos);
  }
}  



