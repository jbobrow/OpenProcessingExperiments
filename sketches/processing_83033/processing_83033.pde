
/* Joshua Saunders ... Assignment 03 ... Basic Game ... Last Updated 9/17/2012
 In this game, you are the Captain of a spaceship commanded by the Galactic Alliance. It's
 your job to distract the enemy for as long as possible while the Galactic Alliance prepares
 their strike
 */
//import ddf.minim.*;

//Minim minim;
//AudioPlayer reasonToBelieve;
//AudioPlayer superMassive;
//boolean reasonToBelievePlay = true;
//boolean superMassivePlay = false;

public int lives = 3;
long score;
long T;
int mode = 0; // Create a variable for different Modes of the game (begin screen, play game)
MainCharacter Player;
MainCharacter FaShow;  //Not for playing, just to show in beginning screen
Enemy1 FaShow1;        //Just for beginning screen
Enemy2 FaShow2;        //Just for beginning screen
Enemy1 EnemyLeft;
Enemy2 EnemyDown;
Enemy3 EnemyFast;
Enemy1 EnemyLeft2;
Enemy2 EnemyDown2;
Enemy1 EnemyLeft3;
Enemy2 EnemyDown3;
Enemy3 EnemyFast2;
Boss FirstBoss;

void setup() {
 // minim = new Minim(this);
  //superMassive = minim.loadFile("Supermassive.mp3", 2048);
  //reasonToBelieve = minim.loadFile("ReasonToBelieve.mp3", 2048);
 // superMassive.play();
 // superMassive.loop();
  size(800, 500);
  smooth();
  noStroke();
  FaShow = new MainCharacter(395, 400);            
  FaShow1 = new Enemy1(30, 60, 0);                    
  FaShow2 = new Enemy2(740, 60, 0);
  Player = new MainCharacter(420, 240);          // Calling the Main Character
  EnemyLeft = new Enemy1(800, int(random(30, 480)), int(random(4, 6)));  //Calling the Enemies
  EnemyDown = new Enemy2(int(random(30, 760)), 0, int(random(4, 6)));
  EnemyDown2 = new Enemy2(int(random(30, 760)), 0, int(random(4, 6)));
  EnemyDown3 = new Enemy2(int(random(30, 760)), 0, int(random(4, 6)));
  EnemyFast = new Enemy3(800, int(random(30, 480)), int(random(9, 11)));
  EnemyFast2 = new Enemy3(800, int(random(30, 480)), int(random(9, 11)));
  EnemyLeft2 = new Enemy1(800, int(random(30, 480)), int(random(4, 6)));
  EnemyLeft3 = new Enemy1(800, int(random(30, 480)), int(random(4, 6)));
  FirstBoss = new Boss(1500, int(random(80, 400)), int(random(3, 4)));
}

void draw() {

  //if (reasonToBelievePlay == true)
 // {
 // reasonToBelieve.loop();
 // }
  



  if (mode == 0) {    // Opening Begin Screen
    background(0);
    fill(81, 245, 32);
    textSize(85);
    text("GALACTIC", 220, 200);    // Game Title
    textSize(60);
    text("DEFENDER", 285, 260);
    fill(101, 112, 232);
    textSize(20);
    text("     CLICK HERE TO BEGIN     ", 300, 290);  // Instructions On How To Play
    textSize(12);
    text("The Galactic Alliance has almost defeated the Starship Empire. In order to ensure victory, you must distract the enemy while we launch", 10, 330);
    text("an attack. You may not survive, but avoid them for awhile and the better our chances of winning are. Use the arrow keys to move your", 10, 344);
    text("ship. Since your ship is equipped with such a powerful blaster shield, the enemy will surely attempt to collide with your ship which will", 10, 358);
    text("mean the destruction of your ship after only a few hits. Please, the fate of the Galactic Alliance depends on your success!", 50, 372);
    FaShow.display();
    FaShow1.display();      // Shows game characters in Opening Screen
    FaShow2.display();
    T = millis();    // count milliseconds from when the program first begins
  }

  else if (mode == 1) {    // After clicking in opening screen, begin the playGame class
    //reasonToBelievePlay = false;
    //superMassivePlay = false;
    noCursor();
    playGame();
    if (lives <= 0) {
      if (keyPressed) {
        if (key=='r') {
          setup();      // goes back to beginning screen
          mode = 0;      // resets major variables
          lives = 3;
          //superMassive.close();
        }                
        if (key=='q') {
          exit();        // exit the program
        }
      }
    }
  }
}

void mousePressed() {      // Press the mouse to begin the game

  if (mode == 0) {
    mode = 1;
  }
}

//void stop ()
//{
 //reasonToBelieve.close();
//  superMassive.close();
//  minim.stop();
//  super.stop();
//}

public class Boss
{
  int xpos, ypos, enemySpeed;

  Boss(int xpos2, int ypos2, int xspeed)
  {
    xpos = xpos2;
    ypos = ypos2;
    enemySpeed=xspeed;
  }

  void setX(int xpos2) {
    xpos = xpos2;
  }

  void setY(int ypos2) {
    ypos = ypos2;
  }

  void display() {
    fill(255, 0, 0);
    triangle(xpos, ypos, xpos - 120, ypos, xpos, ypos - 75);
  }

  void attack() {
    xpos = xpos - enemySpeed;
    if (xpos <= -150) {
      xpos = width + 150;
      ypos = int(random(80, 400));
      enemySpeed = int(random(3, 4));
    }
  }
  int getX() {
    return xpos;
  }

  int getY() {
    return ypos;
  }
}

public class Enemy1
{
  int xpos, ypos, xspeed;

  Enemy1(int xpos2, int ypos2, int xspeed2)  // Parameters are x and y coordinates
  {
    xpos=xpos2;
    ypos=ypos2;
    xspeed=xspeed2;
  }

  void setX(int xpos2) {    // setters for the positioning of Enemy
    xpos = xpos2;
  }
  void setY(int ypos2) {
    ypos = ypos2;
  }

  void display() {
    fill(0);
    rect(xpos, ypos, 20, 20);
    fill(235, 0, 0);
    triangle(xpos, ypos, xpos+10, ypos-15, xpos+20, ypos);
    triangle(xpos, ypos, xpos-15, ypos+10, xpos, ypos+20);
    triangle(xpos, ypos+20, xpos+10, ypos+35, xpos+20, ypos+20);
    triangle(xpos+20, ypos, xpos+35, ypos+10, xpos+20, ypos+20);
  }

  void attack() {
    xpos = xpos - xspeed;    // This enemy moves left, he's a little faster 
    if (xpos <= -20) {            // than the main character
      xpos = width + 20;
      ypos = int(random(30, 480));
      xspeed = int(random(4, 6));
    }
  }
  int getX() {        //getters for enemy position
    return xpos;
  }

  int getY() {
    return ypos;
  }
}

public class Enemy2
{
  int xpos, ypos, enemySpeed;

  Enemy2(int xpos2, int ypos2, int xspeed)    // Parameters are x and y coordinates
  {
    xpos=xpos2;
    ypos=ypos2;
    enemySpeed=xspeed;
  }

  void setX(int xpos2) {    // setters for the positioning of Enemy
    xpos = xpos2;
  }
  void setY(int ypos2) {
    ypos = ypos2;
  }

  void display() {
    fill(0);
    rect(xpos, ypos, 20, 20);
    fill(235, 0, 0);
    triangle(xpos, ypos, xpos+10, ypos-15, xpos+20, ypos);
    triangle(xpos, ypos, xpos-15, ypos+10, xpos, ypos+20);
    triangle(xpos, ypos+20, xpos+10, ypos+35, xpos+20, ypos+20);
    triangle(xpos+20, ypos, xpos+35, ypos+10, xpos+20, ypos+20);
  }

  void attack() {
    ypos = ypos + enemySpeed;
    if (ypos >= height + 20) {    // This enemy moves down, he moves a little
      ypos = -20;                  // faster than the main character
      xpos = int(random(50, 800));
      enemySpeed = int(random(4, 6));
    }
  }
  int getX() {        //getters for enemy position
    return xpos;
  }

  int getY() {
    return ypos;
  }
}

public class Enemy3
{
  int xpos, ypos, enemySpeed;

  Enemy3(int xpos2, int ypos2, int xspeed)      // Parameters are x and y coordinates
  {
    xpos=xpos2;
    ypos=ypos2;
    enemySpeed=xspeed;
  }

  void setX(int xpos2) {      // setters for the positioning of Enemy
    xpos = xpos2;
  }
  void setY(int ypos2) {
    ypos = ypos2;
  }

  void display() {
    fill(0);
    rect(xpos, ypos, 40, 20);
    fill(235, 0, 0);
    triangle(xpos, ypos, xpos-20, ypos+20, xpos, ypos+20);
    triangle(xpos+25, ypos, xpos+40, ypos-15, xpos+40, ypos);
  }

  void attack() {
    xpos = xpos - enemySpeed;        //this enemy moves left, he moves a lot faster
    if (xpos <= -40) {                  // than the main character
      xpos = width + 40;
      ypos = int(random(30, 480));
      enemySpeed = int(random(9, 11));
    }
  }
  int getX() {        //getters for enemy position
    return xpos;
  }

  int getY() {
    return ypos;
  }
}

public class MainCharacter
{

  int xpos, ypos;
  byte speed = 3;
  float shield = 55;


  MainCharacter(int xpos2, int ypos2)  // Parameters are the Main Character's starting point
  {
    xpos=xpos2;
    ypos=ypos2;
  }

  void setX(int xpos2) {    //setters for the main character's position
    xpos = xpos2;
  }

  void setY(int ypos2) {
    ypos = ypos2;
  }

  void display()                // The Main Character's physical appearance
  {
    stroke(33, 145, 134);
    fill(81, 245, 32);
    line(xpos, ypos, xpos, ypos+25);
    line(xpos, ypos+12, xpos+17, ypos+12);
    line(xpos+17, ypos, xpos+17, ypos+25);
    ellipse(xpos, ypos, 10, 10);
    ellipse(xpos+17, ypos, 10, 10);
    ellipse(xpos+17, ypos+25, 10, 10);
    ellipse(xpos, ypos+25, 10, 10);
    tint(255, 0);
    noFill();
    stroke(10, 17, 198);
    ellipse(xpos+9, ypos+12, shield, shield);      // shield (just for show)
    shield = shield - 1.7 * sin(frameCount / 5);
  }




  void drive()      // Use the arrow keys to move the Main Character
  {
    if (keyPressed) {
      if (key==CODED) {
        if (keyCode==UP) {
          ypos -= speed;
        }
        if (keyCode==DOWN) {
          ypos += speed;
        }
        if (keyCode==RIGHT) {
          xpos += speed;
        }
        if (keyCode==LEFT) {
          xpos -= speed;
        }
      }
    }
    if (xpos <= -5) {          //If main character leaves the screen, it will
      xpos = -5;        //appear on the other side
    }
    if (xpos >= width - 15) {
      xpos = width - 15;
    }
    if (ypos >= height - 25) {
      ypos = height - 25;
    }
    if (ypos <= -5) {
      ypos = -5;
    }
  }
  int getX() {
    return xpos;          // getters for main character's position
  }

  int getY() {
    return ypos;
  }
}

void playGame() {
  background(0);
  long M = millis() - T;  // Reset time when gameplay begins  
  long S = M / 1000;   // Keep track of seconds
  final int collisionDetection = 35;
  if (lives > 0) {
    score = 50 * S;    // Keep track of the score while game is going
  }
  fill(81, 245, 32);  
  textSize(25);
  text("SCORE ", 650, 450);  // Read Score
  text("LIVES ", 650, 50);  // Read # of Lives
  textSize(65);
  text("PREPARE YOURSELF", 100, 300);

  if (S >=5) {

    background(0);
    textSize(25);
    text("SCORE " + score, 600, 450);  // Read Score
    text("LIVES " + lives, 600, 50);  // Read # of Lives
    Player.drive();
    Player.display();
    EnemyLeft.attack();
    EnemyDown.attack();
    EnemyFast.attack();
    EnemyFast.display();
    EnemyLeft.display();
    EnemyDown.display();
  }

  if (S >= 15) {              // New Enemy after 15 seconds!!!
    EnemyLeft2.display();
    EnemyLeft2.attack();
  }

  if (S >= 30) {              // New Enemy after 30 seconds!!!
    EnemyDown2.display();
    EnemyDown2.attack();
  }

  if (S >= 40) {              // New Enemy after 40 seconds
    EnemyFast2.display();
    EnemyFast2.attack();
  }

  if (S >= 50) {              // New Enemy after 50 seconds
    EnemyLeft3.display();
    EnemyLeft3.attack();
  }

  if (S >= 60) {              // New Enemy after 60 seconds
    EnemyDown3.display();
    EnemyDown3.attack();
  }

  if (S >= 75 && S <= 78)
  {
    text("The Boss Is Approaching!", 250, 400);
  }

  if (S >= 82)
  {
    FirstBoss.display();
    FirstBoss.attack();
  }

  int xposPlay = Player.getX();      // all getters for enemy and main character positions
  int yposPlay = Player.getY();
  int xposEn1 = EnemyLeft.getX();
  int yposEn1 = EnemyLeft.getY();
  int xposEn4 = EnemyLeft2.getX();
  int yposEn4 = EnemyLeft2.getY();
  int xposEn2 = EnemyDown.getX();
  int yposEn2 = EnemyDown.getY();
  int xposEn5 = EnemyDown2.getX();
  int yposEn5 = EnemyDown2.getY();
  int xposEn3 = EnemyFast.getX();
  int yposEn3 = EnemyFast.getY();
  int xposEn6 = EnemyFast2.getX();
  int yposEn6 = EnemyFast2.getY();
  int xposEn7 = EnemyLeft3.getX();
  int yposEn7 = EnemyLeft3.getY();
  int xposEn8 = EnemyDown3.getX();
  int yposEn8 = EnemyDown3.getY();
  int xposBoss = FirstBoss.getX();
  int yposBoss = FirstBoss.getY();

  if ((dist(xposPlay, yposPlay, xposEn1, yposEn1) < collisionDetection) || (dist(xposPlay, yposPlay, xposEn2, yposEn2) < collisionDetection) || (dist(xposPlay, yposPlay, xposEn3, yposEn3) < collisionDetection) || (dist(xposPlay, yposPlay, xposEn4, yposEn4) < collisionDetection) || (dist(xposPlay, yposPlay, xposEn5, yposEn5) < collisionDetection) || (dist(xposPlay, yposPlay, xposEn6, yposEn6) < collisionDetection) || (dist(xposPlay, yposPlay, xposEn7, yposEn7) < collisionDetection) || (dist(xposPlay, yposPlay, xposEn8, yposEn8) < collisionDetection)) {  //Collisions with EnemyLeft
    lives = lives - 1;
    Player.setX(420);
    Player.setY(240);
    EnemyLeft.setX(1000);
    EnemyLeft.setY(int(random(30, 480)));
    EnemyDown.setX(int(random(30, 760)));
    EnemyDown.setY(-45);
    EnemyDown2.setX(int(random(30, 760)));
    EnemyDown2.setY(-75);
    EnemyDown3.setX(int(random(30, 760)));
    EnemyDown3.setY(-85);
    EnemyFast.setX(900);
    EnemyFast.setY(int(random(30, 480)));
    EnemyLeft2.setX(1200);
    EnemyLeft2.setY(int(random(30, 480)));
    EnemyFast2.setX(1400);
    EnemyFast2.setY(int(random(30, 480)));
    EnemyLeft3.setX(1300);
    EnemyLeft3.setY(int(random(30, 480)));
    FirstBoss.setX(1700);
    FirstBoss.setY(int(random(80, 400)));
  }

  if (((xposPlay < xposBoss) && (xposPlay > xposBoss-130) && (yposPlay < yposBoss+10) && (yposPlay > yposBoss-15)) || ((xposPlay < xposBoss) && (xposPlay > xposBoss-110) && (yposPlay < yposBoss-15) && (yposPlay > yposBoss-30)) || ((xposPlay < xposBoss) && (xposPlay > xposBoss-90) && (yposPlay < yposBoss-30) && (yposPlay > yposBoss-45)) || ((xposPlay < xposBoss) && (xposPlay > xposBoss-70) && (yposPlay < yposBoss-45) && (yposPlay > yposBoss-60)) || ((xposPlay < xposBoss) && (xposPlay > xposBoss-50) && (yposPlay < yposBoss-60) && (yposPlay > yposBoss-85))) {
    lives = lives - 1;
    Player.setX(420);
    Player.setY(240);
    EnemyLeft.setX(1000);
    EnemyLeft.setY(int(random(30, 480)));
    EnemyDown.setX(int(random(30, 760)));
    EnemyDown.setY(-45);
    EnemyDown2.setX(int(random(30, 760)));
    EnemyDown2.setY(-75);
    EnemyDown3.setX(int(random(30, 760)));
    EnemyDown3.setY(-85);
    EnemyFast.setX(900);
    EnemyFast.setY(int(random(30, 480)));
    EnemyLeft2.setX(1200);
    EnemyLeft2.setY(int(random(30, 480)));
    EnemyFast2.setX(1400);
    EnemyFast2.setY(int(random(30, 480)));
    EnemyLeft3.setX(1300);
    EnemyLeft3.setY(int(random(30, 480)));
    FirstBoss.setX(1700);
    FirstBoss.setY(int(random(80, 400)));
  }


  if (lives <= 0) {     // GAME OVER Screen, show final score, press r to replay
    background(0);              // or press q to quit
    textSize(45);
    text("GAME OVER", 300, 150); 
    final long finalscore = score;  //Get the final score
    text("FINAL SCORE " + finalscore, 250, 210);
    textSize(35);
    text("PRESS 'R' TO REPLAY", 272, 300);
    text("PRESS 'Q' TO QUIT", 282, 350);
  }
}



