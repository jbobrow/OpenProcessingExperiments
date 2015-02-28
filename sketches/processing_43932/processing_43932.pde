
import netscape.javascript.*;

/*      Title    :  Whack a Mac
 Synopsis :  Small 2d shooter game
 Author   :  michael hawthorne, forbes ramsay, adam cottis
 Date     :  16/10/2011
 Version  :  1.0
 ChangLog :  Ui,Object and player classes made. added main game loop and end game.
 difficulty implemented. menu added, end screen. code cleaned up
 
 
 todo: more comments, 
 
 */

//Object declaration 
uI process;
play player;
oB[] game = new oB[20];
clouds[] cloud = new clouds[3];
PImage [] backG = new PImage[4];
menu m;
end e;

////////////////////////////////////
//Player Globals
int tempScore_ = 0;
boolean randMapselect = false;

////////////////////////////////////
//Splash screen
PFont splashfont;
int splashtimer = 0;

////////////////////////////////////
//Difficulty settings, itercycle
int iterationCycle = 0;
int level = 20;
int med = 15;
int hard = 10;
int extreme = 3;
boolean extrememode = false;
int v;

///////////////////////////////////
//timer, gamestate
int gameTimer = 0;
int fTimer = 0;
boolean splash = true;  //change to enable splash
boolean menu = false;
boolean gameOver = false;
boolean gameOn = false;
boolean scoreScreen = false;


void setup()
{
  size(700, 600);
  splashfont = loadFont("Aharoni-Bold-48.vlw");
  process = new uI();
  player = new play();
  for (int i = 0; i < 20; i++)
  {
    game[i] = new oB();
  }
  m = new menu();
  
  cloud[0] = new clouds(-50, 25);
  cloud[1] = new clouds(200, 50);
  cloud[2] = new clouds(500, 75);
  //frameRate(60);
  backG[0] = loadImage("background0.png");
  backG[1] = loadImage("background1vo.jpg");
  backG[2] = loadImage("background1.png");
  backG[3] = loadImage("background2.png");
}

void draw()
{
  fill(0, 250);
  rect(0, 0, width, height);
  //background(0);
  
  //Splash screen
  if (splash == true)
  {
    dosplash();
  }
  //Menu
  if (menu == true)
  {
    m.showMenu();
  }
 

  //Main Game Loop
  cursor(CROSS);
  if (gameOn == true)
  {
    int l = 0;
    int t =(int)random(0, iterationCycle); 
    if (randMapselect == false)
    {
      v = (int)random(0, 4);
      randMapselect = true;
    }
    image(backG[v], 0, 0);
    if (extrememode == true)
    {
      l =(int)random(0, iterationCycle);
    }
    //Select which object to set off based on gameTimer
    if (gameTimer % level == 0 && game[t].getVis() == false)
    {
      game[t].updateVis(true);
      if (extrememode == true && game[l].getVis() == false)
      {
        game[l].updateVis(true);
      }
    }

    //loop through array of objects, update location and check for hit if mouse is pressed.
    for (int i = 0; i < iterationCycle; i++)
    {
      if (process.checkShot(player, iterationCycle) && game[i].getVis() == true)
      {
        game[i].checkHit(mouseX, mouseY, player);
        process.setShoot();
      } 
      game[i].updateLocation(player);
    }

    // if mousepressed subtract bullets 
    if (mousePressed) player.subBullets(0.128);

    // Difficulty Level. 
    if (gameTimer <= 500)
    {
      iterationCycle = 5;
    }
    if (gameTimer > 500 && gameTimer <= 1000)
    {
      level = med;
      iterationCycle = 10;
    }
    if (gameTimer > 1000 && gameTimer <= 1500)
    {
      level = hard;
      iterationCycle = 15;
    }
    if (gameTimer > 1500)
    {
      level = extreme;
      iterationCycle = 20;
      if (gameTimer > 2000)
      {
        extrememode = true;
      }
    }

    //show clouds
    for (int i = 0; i < 3; i++)
    {
      cloud[i].showclouds();
    }

    //Player score on screen
    textFont(splashfont, 20);
    textAlign(CENTER);
    fill(235, 252, 20);
    text("Score : " + player.getScore(), width/10, 18); 
    text("Bullets : " + (int)player.getBullets(), width/3.5, 18); 
    noFill();
    strokeWeight(1);
    stroke(0, 0, 10);
    ellipse(mouseX, mouseY, 10, 10);
  }//End of main game loop but not end of draw.


  //End game situation
  if (player.getBullets() <= 0 || gameOver == true)
  {
    fTimer++;
    gameOn = false;
    if (gameOver != true)
    {
      for (int i = 0; i < 20; i++)
      {
        game[i].reset();
      }
      e = new end(player.getScore());
      gameOver = true;
    }
    if (fTimer <= 500) {
      e.showEndscreen();
    }
    if (fTimer > 500)
    {
      background(0);
      fTimer = 0;
      gameOver = false;
      menu = true;
      for (int i = 0; i < 20; i++)
      {
        game[i].reset();
      }
      player.resetS();
      gameTimer = 0;
      randMapselect = false;
    }
    //println(fTimer);
  }

  /////////////////////////////////////////////////////



  /////////////////////////////////////////////////////
  // Debug Output, Timer increment
  if (gameOn == true)
  {
    gameTimer++;
    //println("Timer  : " + gameTimer);
  }
}///////////////////////////////////////////////////////End of draw



/////////////////////////////////////////////////////
//Splash screen just for fun :)
void dosplash()
{
  fill(0, 10);
  rect(0, 0, width, height);

  if (splashtimer > 50 && splashtimer < 250)
  {
    fill(255, 255, 255);
    textFont(splashfont, 50);
    text("Group T3n", 208, 250);
    textFont(splashfont, 25);
    text("Productions Presents", 208, 275);
  }
  if (splashtimer > 249 && splashtimer < 400)
  {
    fill(255, 255, 255);
    textFont(splashfont, 50);
    text("Whack a Mac", 180, 260);
  }
  if (splashtimer > 399)
  {
    splash = false;
    menu = true;
  }
  splashtimer++;
}


//-----------------------------------------------------------------------------------------------------------------------------
/*    Title    : Object class
 Synopsis : oB class, handles object properties and collisions
 also displays the image on the screen.
 
 Author   : Michael Hawthorne 
 Date     : 13/10/2011
 */

class oB
{
  private PImage target_;
  private float x_;
  private float y_;
  private int xImage_;
  private int yImage_;
  private float iter_;
  private int timer_;
  private int raddev_;
  private boolean hit_;
  private boolean dead_;
  private boolean vis_;
  private float xspeed;
  private int randtarget_;
  private boolean isReward;

  public oB()
  {
    randtarget_ = (int)random(0, 6);
    if (randtarget_ == 0) target_ = loadImage("co.png");
    if (randtarget_ == 1) target_ = loadImage("co1.png");
    if (randtarget_ == 2) target_ = loadImage("co2.png");
    if (randtarget_ == 3) target_ = loadImage("co3.png");
    if (randtarget_ == 4) target_ = loadImage("co4.png");
    if (randtarget_ == 5) target_ = loadImage("reward.png");
    iter_ = 40;
    timer_ = 0;
    xspeed = random(0.10, 0.70);
    raddev_ = (int)random(150, 450);
    x_ = 300 - 600 * cos(radians(iter_ / xspeed));
    y_ = 500 - raddev_ * sin(radians(iter_ / xspeed));
    hit_ = false;
    dead_ = false;
    vis_ = false;
    xImage_ = (int)x_;
    yImage_ = (int)y_;
    if (randtarget_ == 5)
    {
      isReward = true;
    }
    else
    {
      isReward = false;
    }
  }

  public void reset()
  {
    randtarget_ = (int)random(0, 6);
    if (randtarget_ == 0) target_ = loadImage("co.png");
    if (randtarget_ == 1) target_ = loadImage("co1.png");
    if (randtarget_ == 2) target_ = loadImage("co2.png");
    if (randtarget_ == 3) target_ = loadImage("co3.png");
    if (randtarget_ == 4) target_ = loadImage("co4.png");
    if (randtarget_ == 5) target_ = loadImage("reward.png");
    iter_ = 40;
    timer_ = 0;
    xspeed = random(0.10, 0.70);
    raddev_ = (int)random(150, 450);
    x_ = 300 - 600 * cos(radians(iter_ / xspeed));
    y_ = 500 - raddev_ * sin(radians(iter_ / xspeed));
    hit_ = false;
    dead_ = false;
    vis_ = false;
    xImage_ = (int)x_;
    yImage_ = (int)y_;
    if (randtarget_ == 5)
    {
      isReward = true;
    }
    else
    {
      isReward = false;
    }
  }

  public void checkHit(float x, float y, play playeradjust)
  {

    xImage_ = (int)x_;
    yImage_ = (int)y_;
    if (x > xImage_-4 && x < xImage_ + 46 && y > yImage_ && y < yImage_ + 50 && hit_ == false)
    {
      target_ = loadImage("explo.png");
      playeradjust.addScore(1);
      timer_ = 1;
      if (isReward == true && hit_ == false)
      {
        isReward = false;
        playeradjust.addBullets(4);
      }
      hit_ = true;
    }
  }

  private void checkDead()
  {
    if (timer_ == 20)
    {
      reset();
    }
  }


  public boolean getVis()
  {
    return vis_;
  }
  public int updateVis(boolean t)
  {
    if (t == true)
      vis_ = true;

    if (t == false)
      vis_ = false;

    return 0;
  }

  private void checkDimensions(play P)
  {
    if (iter_ > 140 && hit_ != true)
    {
      P.subScore();
      reset();
    }
    else if (iter_ > 140 && hit_ == true)
    {
      reset();
    }
  }

  public void updateLocation(play m)
  {
    if (vis_ == true && hit_ != true)
    {
      x_ = 300 - 600 * cos(radians(iter_));
      y_ = 500 - raddev_ * sin(radians(iter_));
      iter_+=xspeed;
    }
    if (hit_ == true)
    {
      raddev_ -= 0.30;
      x_ = 300 - 600 * cos(radians(iter_));
      y_ = 500 - raddev_ * sin(radians(iter_));
      iter_ += xspeed / 2;
      timer_++;
    }
    if (iter_ > 140)
    {
      checkDimensions(m);
    }
    if (hit_ == true)
    {
      checkDead();
    }
    displayImage();
  }

  private int displayImage()
  {
    if (dead_ != true && vis_ == true)
    {
      image(target_, x_, y_);
    }
    return 0;
  }
}
//----------------------------------------------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------------------------------------------
/*    Title    : play class
 Synopsis : play class, handles player properties.
 
 Author   : Michael Hawthorne 
 Date     : 13/10/2011
 */

class play
{
  private int score;
  private float bullets;

  play()
  {
    score = 0;
    bullets = 50;
  }
  public float getBullets()
  {
    return (int)bullets;
  }

  public void addBullets(int i)
  {
    bullets += i;
  }

  public void subBullets(float i)
  {
    bullets -= i;
  }
  public void addScore(int i)
  {
    score+=i;
  }

  public void subScore()
  {
    score-=1;
  }

  public int getScore()
  {
    return score;
  }

  public void resetS()
  {
    score = 0;
    bullets = 50;
  }
}
//----------------------------------------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------------------------------------
/*    Title    : User interaction class
 Synopsis : uI class, handles user interaction with 
 the mouse and the forwarding of mouse xy to the 
 object class to check for collisions.
 Author   : Michael Hawthorne 
 Date     : 13/10/2011
 Changelog:
 */

class uI
{
  private float mX_;
  private float mY_;
  private boolean shoot_;


  public boolean checkShot(play s, int iter)
  {
    if (mousePressed)
    {
      shoot_ = true;
    }
    else
    {
      shoot_ = false;
    }
    return shoot_;
  }

  public void setShoot()
  {
    shoot_ = false;
  }
}
//--------------------------------------------------------------------------------------------------------------

//----------------------------------------------------------------------------------------------------------------------
/*    Title    : cloud class
 Synopsis : Handles clouds, random speed after x = 750
 Author   : Adam cottis 
 Date     : 17/10/2011
 Changelog:
 */

class clouds
{
  private float x_;
  private float y_;
  PImage cloud;
  private boolean vis_;
  private float randmove;

  public clouds(float x, float y)
  {
    x_ = random(x - 50, x + 50);
    y_ = random(5, y - random(0, 75));
    randmove = random(0.2, 0.9);
    cloud = loadImage("cloud.png");
  }

  public void showclouds()
  {
    image(cloud, x_, y_);
    moveclouds();
  }

  private void moveclouds()
  {
    x_ += randmove;
    if (x_ > 790)
    {
      x_ = -200;
      randmove = random(0.2, 0.9);
      y_ = random(5, 100);
    }
  }
}

//----------------------------------------------------------------------------------------------------------------------
/*    Title    : Menu
 Synopsis : small class to handle menu
 Author   : Adam Cottis, Michael Hawthorne 
 Date     : 20/10/2011
 Changelog:
 */
class menu
{
  PFont Font;
  ImageButtons Play;
  PImage playBase;
  PImage playOver;
  PImage playPressed;
  PImage backpic;
  String menu;

  menu()
  {
    PImage playBase = loadImage("playBase.png");
    PImage playOver = loadImage("playOver.png");
    PImage playPressed = loadImage("playClicked.png");
    Play = new ImageButtons(300, 230, 100, 50, playBase, playOver, playPressed);
    Font = loadFont("Aharoni-Bold-48.vlw");
  }

  int showMenu()
  {
   //background(0);
    /*for (int x = 0, y = 0; x < 701; x+=3) {
      for (int yi = 0; yi < 601; yi+=3) {
        fill(random(5, 10), random(5, 10), random(45, 60));
        rect(x, yi, 3, 3);
      }
    }*/

    textFont(Font, 80);
    fill(36, 153, 252);
    textAlign(CENTER);
    text("Whack a Mac", width/2, 200);
    textFont(Font, 13);
    textAlign(LEFT);
    fill(255, 255, 255);
    text("Credits:", width / 2, 500);
    text("Forbes Ramsay", width / 2, 515);
    text("Adam Cottis", width / 2, 530);
    text("Michael Hawthorne", width / 2, 545);
    text("Extra Background by", width / 2, 560);
    text("Marc Volkers HNC 3D animation Dundee College", width / 2, 575);
    Play.update();
    Play.display();
    return 0;
  }
}

//----------------------------------------------------------------------------------------------------------------------
/*    Title    : score screen class
 Synopsis : Handles end of game scenario
 Author   : Forbes Ramsay 
 Date     : 21/10/2011
 Changelog:
 */

class end
{
  private int score_;

  end(int S)
  {
    score_ = S;
  }

  int showEndscreen()
  {
    /*for (int x = 0, y = 0; x < 701; x+=3) {
      for (int yi = 0; yi < 601; yi+=3) {
        fill(random(5, 10), random(5, 10), random(45, 60));
        rect(x, yi, 3, 3);
      }
    }*/
    textFont(splashfont, 50);
    textAlign(LEFT);
    fill(255, 255, 255);
    text("Score  : ", width/2.8, 275);
    text(score_, width/1.6, 275);
    
    return 0;
  }
}


/////////////// button class from processing website, ripped off but its such a good little button class for quickly getting your buttons up and working.
/////////////////
class Button 
{
  int x, y;    
  int w, h;

  boolean over = false;
  boolean pressed = false; 

  void pressed() {
    if (over && mousePressed) {
      pressed = true;
      gameOn = true;
      menu = false;
    } 
    else {
      pressed = false;
    }
  }    

  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } 
    else {
      return false;
    }
  }
}

class ImageButtons extends Button 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    roll = iroll;
    down = idown;
    currentimage = base;
  }

  public void update() 
  {
    over();
    pressed();
    if (pressed) {
      currentimage = down;
    } 
    else if (over) {
      currentimage = roll;
    } 
    else {
      currentimage = base;
    }
  }

  void over() 
  {
    if ( overRect(x, y, w, h) ) {
      over = true;
    } 
    else {
      over = false;
    }
  }

  void display() 
  {
    image(currentimage, x, y);
  }
};


