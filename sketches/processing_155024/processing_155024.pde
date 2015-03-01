
/* 
Authors: Bryshawn Whigham, Mekhi Jones, Ben Webb
Published: July 17, 2014
Song Credits: 
        Youtube Channel - OverClocked ReMix
        https://www.youtube.com/watch?v=o-cwL5Q71yI
*/

PImage img;
PImage img1;
PImage battleImg;                   //  0 = titlescreen
Sprite p1Choice;                     //  1 = menu
Sprite p2Choice;                     //  2 = character select
Sprite pChoice;
float p1Health = 75;                //  3 = battle screen
float p2Health = 75;               // 4 = instructions
int state = 0;
float x;
float y;
float z;
int mekhi=0;      //screens in order
int turnPhase =0;       //selection turns
int stopOne=0;
int restart = 0;

//import ddf.minim.*;
//Minim minim;
//AudioPlayer groove;



void setup() {
  size(800, 600);
  p1Choice = new Sprite(50, height, 3);
  p1Choice.fillColor(255, 0, 0);
  p2Choice = new Sprite(width-50, height, 3);
  p2Choice.fillColor(0, 0, 255);
  battleImg = loadImage("fightbg.jpg");
  img = loadImage("bg.jpg");
  img1 = loadImage("titletext.png");
  
//  minim = new Minim(this);
//  groove = minim.loadFile("Sprite Fighters.mp3", 1024);
//  groove.loop();
}

void Structure(float x, float y, float w, float h) {  //function for making platforms
  rectMode(CENTER);
  rect(x, y, w, h);
  p1Choice.repel(x, y, w, h);
  p2Choice.repel(x, y, w, h);
}

void draw() {

  if (state == 0) {                  //-------------------------------------TITLESCREEN--------------------------------------------------
    image(img, 0, 0, width, height);
    image(img1, 200, 150, width/2, height/2);
    rectMode(CENTER);
    fill(100, 100, 100, 200);
    rect(width/2, (height/2) + 150, (width/5) + 100, height/7);
    textSize(50);
    textAlign(CENTER);
    fill(0, 0, 0);
    text("START", width/2, (height/2) + 170);

    fill(random(255)*sin(x/20), random(255)*sin(y/20), random(255)*sin(z/20), 100);
    rect(width/2, height/2, width, height);

    x++;
    y++;
    z++;
  }

  if (state == 1) {                  //---------------------------------------MENU-----------------------------------------------------
    image(img, 0, 0, width, height);
    image(img1, 200, 30, width/2, height-400);

    //play button
    rectMode(CENTER);
    fill(255, 255, 255);
    rect(width/2, height/3 + 50, 250, 80);
    textAlign(CENTER);
    textSize(30);
    fill(0, 0, 0);
    text("PLAY GAME", width/2, height/3 + 60);

    //instructions button
    rectMode(CENTER);
    fill(255, 255, 255);
    rect(width/2, height/3 + 200, 250, 80);
    textAlign(CENTER);
    textSize(30);
    fill(0, 0, 0);
    text("INSTRUCTIONS", width/2, height/3 + 210);
  }

  if (state == 4) {                  //---------------------------------------INSTRUCTIONS-----------------------------------------------------
    rectMode(CENTER);
    fill(255, 255, 255);
    rect(width/2, height/2, width - 80, height - 80);

    textAlign(CENTER);
    textSize(35);
    fill(0, 0, 0);
    text("How to Play", width/2, height - 500);

    textSize(20);
    text("* Choose the color of player you want to use", width/2, height - 450);
    text("* Player 1 uses WASD keys to move", width/2, height - 400);
    text("* Player 2 uses the arrow keys to move", width/2, height - 350);
    text("* Player 1 uses the E key to attack", width/2, height - 300);
    text("* Player 2 uses the M key to attack", width/2, height - 250);

    fill(200, 200, 200);
    rect(width/2, height - 150, width/3.5, height/8);
    textSize(30);
    fill(0, 0, 0);
    text("Back to Menu", width/2, height - 140);
  }

  if (state == 2) {                  //--------------------------------CHARACTER SELECT-----------------------------------------------
    if (mekhi == 0) {

      homeScreen();
    }

    if (mekhi == 1) {            //the actual game
      state = 3;
    }
  }

  if (state == 3) {  //---------------------------------------------------BATTLE SCREEN------------------------------------------------

    image(battleImg, 0, 0, width, height); //background image for battle screen
    p1Choice.update();
    p2Choice.update();
    p1Choice.display();
    p2Choice.display();

    textAlign(CENTER);
    fill(255, 0, 0);
    textSize(35);
    text(round((p1Health / 75)*100) + "%", 80, 70);

    fill(0, 0, 255);
    textSize(35);
    text(round((p2Health / 75)*100) + "%", width - 80, 70);


    //battle stage---can be changed or add more stages

    fill(0, 0, 0);
    Structure(width/2, height - 200, 250, 10);
    Structure(width/2, height - 100, 500, 10);
    Structure(width/2, height, 1000, 10);
    Structure(width/2, height-350, 300, 10);
    Structure(width/2, height-500, 300, 10);
    Structure(width/2, height-650, 300, 10);
    Structure(width/2, height-800, 300, 10);
    Structure(width/2, height-950, 300, 10);
    Structure(width-100, height-875, 300, 10);
    Structure(width-900, height-875, 300, 10);
    Structure(width-100, height-425, 300, 10);
    Structure(width-900, height-425, 300, 10);
    Structure(width-100, height-575, 300, 10);
    Structure(width-900, height-575, 300, 10);
    Structure(width-100, height-275, 300, 10);
    Structure(width-900, height-275, 300, 10); 
    Structure(width-100, height-725, 300, 10); 
    Structure(width-900, height-725, 300, 10);

    //---

    if (p1Health > 0) {
      p1Choice.repel(p2Choice);
    }
    if (p2Health > 0) {
      p2Choice.repel(p1Choice);
    }

    if (p1Health <= 0) {  //       DETECT IF PLAYER WINS
      p1Health = 0;
      p1Choice.die();
      if (restart == 0) {
        p1Choice.crouch();
      }
      textAlign(CENTER);
      fill(255, 0, 0);
      textSize(60);
      text("PLAYER 2 WINS!", width/2, height/2);
      restart++;
      if (restart >= 240) {
        state = 1;
        Reset();
      }
    }

    if (p2Health <= 0) {
      p2Health = 0;
      p2Choice.die();
      if (restart == 0) {
        p2Choice.crouch();
      }
      textAlign(CENTER);
      fill(255, 0, 0);
      textSize(60);
      text("PLAYER 1 WINS!", width/2, height/2);
      restart++;
      if (restart >= 240) {
        state = 1;
        Reset();
      }
    }
  } //------------------------------------------------------------------------------------------------------------------------
}


void Reset() {
  restart = 0;
  p1Health = 75;
  p2Health = 75;
  mekhi = 0;
  turnPhase = 0;
  stopOne = 0;
}


void keyPressed() {
  if (state ==3) {
    //--------------------------------------PLAYER 2 MOVEMENT----------------------------------
    if (p2Health > 0) {  //only allows movement if alive
      if (keyCode == 37) {         //LEFT
        p2Choice.moveLeft();
      }

      if (keyCode == 39) {         //RIGHT
        p2Choice.moveRight();
      }

      if (keyCode == 38) {         //UP
        p2Choice.jump();
      }

      if (keyCode == 40) {         //DOWN
        p2Choice.crouch();
      }
    }
    //--------------------------------------PLAYER 1 MOVEMENT----------------------------------
    if (p1Health > 0) {  //only allows movement if alive
      if (keyCode == 65) {         //LEFT
        p1Choice.moveLeft();
      }

      if (keyCode == 68) {         //RIGHT
        p1Choice.moveRight();
      }

      if (keyCode == 87) {         //UP
        p1Choice.jump();
      }

      if (keyCode == 83) {         //DOWN
        p1Choice.crouch();
      }
    }
    //--------------------------------------FIGHTING CONTROLS----------------------------------------
    if (keyCode == 77) {         //damage
      if (dist(p1Choice.getX(), p1Choice.getY(), p2Choice.getX(), p2Choice.getY()) < 50) {
        p1Choice.damaged();
        p1Health -= 5;
      }
    }
    if (keyCode == 69) {         //damage
      if (dist(p1Choice.getX(), p1Choice.getY(), p2Choice.getX(), p2Choice.getY()) < 50) {
        p2Choice.damaged();
        p2Health -= 5;
      }
    }
  }
}

void mousePressed() {
  if (state == 0) {

    if (mouseX>=270 && mouseX <=530 && mouseY >=407 && mouseY <=490) {
      state = 1;  //goes to menu screen
    }
  }
  if (state == 1) {
    if (mouseX >= 276 && mouseX <= 523 && mouseY >= 210 && mouseY <= 290) {
      state = 2; //goes to character select page
    }
    if (mouseX >= 276 && mouseX <= 523 && mouseY >= 360 && mouseY <= 440) {
      state = 4; //goes to instructions page
    }
  }
  if (state == 4) {
    if (mouseX >= 285 && mouseX <= 516 && mouseY >= 413 && mouseY <= 486) {
      state = 1;
    }
  }
}



public void homeScreen() {  //-------------------------------------------------------character select loop-------------------------------------
  p1Choice.setX(50);
  p1Choice.setY(height);
  p2Choice.setX(width - 50);
  p2Choice.setY(height);
  if (mekhi==0) {            //choosing a character screen 
    background(0);
    textAlign(CENTER);
    fill(255);
    textSize(20);
    if (turnPhase ==0) {
      text("Player 1 choose a character! By the C,V,and B keys", width/2, height/2);
      text ("C= red, V = green , B = blue", width/2, height/2+50);
    } else if (turnPhase ==1) {
      text("PLAYER 2 choose a character! By using the F,G,or H keys", width/2, height/2);
      text ("F= red, G = green , H = blue", width/2, height/2+50);
    } else if (turnPhase == 2) {
      textAlign(CENTER);
      fill(255);
      text("Press the Spacebar to continue to the game", width/2, height/2);
      if (keyCode == 32) {
        mekhi =1;
      }
    }
    p1Choice.update();
    p1Choice.display();
    p2Choice.update();
    p2Choice.display();
    ;

    if (key == 'c' && stopOne==0) {           //p1Choice selection turn
      textAlign(CENTER);
      p1Choice.fillColor(255, 0, 0);
      turnPhase =1;
      stopOne=1;
    }
    if (key == 'v' && stopOne==0) {                                       //c,v, and b are the character selection tools
      textAlign(CENTER);
      p1Choice.fillColor(0, 255, 0);
      fill(255);
      turnPhase=1;
      stopOne=1;
    }
    if (key == 'b' && stopOne==0) {           //p1Choice selection turn
      textAlign(CENTER);
      p1Choice.fillColor(0, 0, 255);
      fill(255);
      turnPhase =1;
      stopOne=1;
    }


    if (turnPhase==1 && stopOne==1) {              //p2Choice selection turn
      if (key == 'f') {           //p1Choice selection turn
        p2Choice.fillColor(255, 0, 0);
        turnPhase=2;
      }
      if (key == 'g'&& stopOne==1) {
        p2Choice.fillColor(0, 255, 0);
        turnPhase=2;
      }
      if (key == 'h'&& stopOne==1) {
        p2Choice.fillColor(0, 0, 255);
        turnPhase=2;
      }
    }
  }
}

//-------Known Bugs--------
// 1. instructions button doesn't sense lower half. issue with coordinate restrictions?

/*
/ A Sprite class created by Brandon Sonoda.
 / Don't make changes to this file.
 / This file allows you to put Sprite objects in your own
 / programs.
 */

public class Sprite {
  private String name; //Name of the Character
  private boolean crouched; //True if the sprite is crouched
  private boolean rightFace; //True if the sprite is facing to the right
  private float speed; //How fast the sprite moves when a move command is called
  private float velocityX; //The current velocity of the x coordinate
  private float velocityY; //The current Velocity of the y coordinate
  private int jumpStatus;  //How many times the user can jump w/o touching the ground (default 1)
  private float posX; //The x coordinate of the center of the sprite
  private float posY; //The y coordinate of the center of the sprite
  private float radX; //The x radius of the active zone (used for contact with enemies)
  private float radY; //The y radius of the active zone (used for enemies)
  private float borderX; //The x radius of the inactive zone(used for environment)
  private float borderY;  //The y radius of the inactive zone(used for environment)
  private color c;

  public final int MAX_JUMP_STATUS;

  public Sprite(String name, float posX, float posY, int MAX_JUMP_STATUS) {
    this.posX = posX;
    this.posY = posY;
    this.radX = .82*20;
    this.radY = 35;
    this.borderX = 20;
    this.borderY = 35;
    this.speed = 3;
    this.MAX_JUMP_STATUS = max(1, MAX_JUMP_STATUS);
    c = color(255, 120, 20);
    velocityX = 0;
    velocityY = 0;
    jumpStatus = 0;
    this.name = new String(name);
    crouched = false;
    rightFace = true;
  }

  public Sprite() {
    this(1);
  }
  public Sprite(int maxJump) {
  this("Jack", width/2, height/2, maxJump);
  }
  public Sprite(String name, float posX, float posY) {
    this(name, posX, posY, 1);
  }
  public Sprite(float posX, float posY) {
    this("Brandon", posX, posY);
  }
  public Sprite(float posX, float posY, int MAX_JUMP_STATUS) {
    this("Brandon", posX, posY, MAX_JUMP_STATUS);
  }
  public Sprite(Sprite old) {
     this(old.name, old.posX, old.posY, old.MAX_JUMP_STATUS);
  }

  public void moveRight() {
    rightFace = true;
    if (crouched)
      this.changeVelocityX(2);
    else
      this.changeVelocityX(5);
  }
  public void moveLeft() {
    rightFace = false;
    if (crouched)
      this.changeVelocityX(-2);
    else
      this.changeVelocityX(-5);
  }
  
  //-------------------------------MY EDITS--------------------------------------------
  public void damaged() {
    if (rightFace) {
      this.changeVelocityX(-4);
      this.changeVelocityY(-4);
    }
    else {
      this.changeVelocityX(4);
      this.changeVelocityY(-4);
    }
  }
  public void die() {
    this.changeVelocityY(-30);
  }
  //-----------------------------------------------------------------------------------
  
  public void jump() {
    if (crouched)
      this.changeVelocityY(-4.5);
    else
      this.changeVelocityY(-6.5);
  }

  public void crouch() {
    crouched = !crouched;
    this.setBorderY(55-this.getBorderY());
    this.setRadY(55-this.getRadY());
    if (crouched)
      this.changeY(17);
    else
      this.changeY(-(55-this.getBorderY()));
  }

  public void update() {
    this.changeX(velocityX);
    this.changeY(velocityY);
    contain(0, 0, width, height);
  }

  public void display() {
    float radX = this.getBorderX();
    float radY = this.getBorderY();

    rectMode(RADIUS);
    stroke(0);

    int signum = -1;
    if (rightFace)
      signum = 1;
    float crouchDiff = 0;
    if (crouched)
      crouchDiff = 15;

    stroke(0);
    strokeWeight(2);
    fill(c);
    //Feet
    rect(posX-7, posY+3*radY/4, 5, radY/4);
    rect(posX+7, posY+3*radY/4, 5, radY/4);

    //Body
    if (!this.isCrouched())
      rect(posX+signum*(radX-3), posY+11, 3, 9);
    rect(posX, posY, .8*radX, .7*radY);
    if (!this.isCrouched())
      rect(posX-signum*15, posY+11, 4.5, 9);

    //TopHat
    fill(0);
    if (this.isCrouched()) {
      rect(posX, posY+6, .95*radX, 2);
      rect(posX, posY-radY/2+2, .82*radX, radY/2+1);
    }
    else {
      rect(posX, posY-radY+12, .95*radX, 2);
      rect(posX, posY-radY+5, .8*radX, 5);
      //Mouth
      line(posX+signum*7, posY+10, posX+.8*radX*signum, posY+10);
    }

    //Eyes
    strokeWeight(1.5);
    fill(255);
    ellipse(posX+signum*12, posY-12, 14, 14);
    ellipse(posX+signum*2, posY-12, 13, 13);

    //Pupils
    fill(0);
    ellipse(posX+signum*3, posY-12, 3, 3);
    ellipse(posX+signum*13, posY-12, 3, 3);
  }

  private void contain(float x1, float y1, float x2, float y2) {
    float posY = this.getY();
    float radY = this.getRadY();
    float posX = this.getX();
    float radX = this.getRadX();

    if (posY-radY < y1) {
      this.setY(y1+radY+2); 
      velocityY = 0;
    }
    else {
      if (posY+radY > y2) {
        this.setY(y2-radY);
        velocityY = 0;
        jumpStatus =  MAX_JUMP_STATUS;
      }
      else {
        velocityY+=.2;
      }
    }


    if (velocityX !=0) {
      if (velocityY != 0) {
        if (posX-radX < x1) {
          this.setX(x1+radX);
          velocityX*=-.15;
        }
        else {
          if (posX+radX > x2) {
            this.setX(x2-radX);
            velocityX*=-.15;
          }
        }
      }
      else {
        velocityX *=.8;
      }
    }
  }

  public void fillColor(int r, int g, int b) {
    c = color(r, g, b);
  }

  //Getters
  public float getX() {
    return posX;
  }

  public float getY() {
    return posY;
  }

  public float getRadX() {
    return radX;
  }

  public float getRadY() {
    return radY;
  }

  public float getBorderX() {
    return borderX;
  }

  public float getBorderY() {
    return borderY;
  }

  public float getVelocityX() {
    return velocityX;
  }

  public float getVelocityY() {
    return velocityY;
  }

  public boolean isCrouched() {
    return crouched;
  }

  public boolean facingRight() {
    return rightFace;
  }

  public float getSpeed() {
    return speed;
  }

  public String toString() {
    String facing = (facingRight())? "Right":"Left";
    return new String("Name: "+name+
      "\nLocation: ("+round(posX)+", "+round(posY)+")\nCrouch: "+isCrouched()+
      "\nFacing Direction: "+facing+"\nVelocity X: "+round(velocityX)+
      "\nVelocity Y: "+round(velocityY));
  }

  public int getJumpStatus() {
    return jumpStatus;
  }

  //Mutators:
  private void changeDirection() {
    speed*=-1;
  }

  private void changeVelocityY(float newVelocity) {
    if (jumpStatus != 0 ) {
      velocityY = newVelocity;
      jumpStatus--;
    }
  }

  private void changeVelocityX(float newVelocity) {
    if (abs(getVelocityY()) >.2) {
      if (velocityX*newVelocity < 0)
        velocityX*=-.15;
      else
        velocityX = .5*newVelocity;
    }
    else
      velocityX = newVelocity;
  }
  private void setX(float newX) {
    posX = newX;
  }

  private void setY(float newY) {
    posY = newY;
  }

  private void changeX(float deltaX) {
    posX+=deltaX;
  }

  private void changeY(float deltaY) {
    posY+=deltaY;
  }

  private void setRadY(float newRadY) {
    radY = newRadY;
  }

  private void setBorderY(float newBorderY) {
    borderY = newBorderY;
  }

  public void repel(Sprite other) {
   repel(other.getX(), other.getY(), 2*other.getRadX(), 2*other.getRadY());     
  }


  public void repel(float x, float y, float w, float h) {
    float x1, y1, x2, y2;
    x1 = x- w/2;
    y1 = y- h/2;
    x2 = x+ w/2;
    y2 = y+ h/2;

    if (abs(this.getX() - x) <= this.getRadX()+w/2 &&
      abs(this.getY() - y) <= this.getRadY()+h/2) {
      float posY = this.getY();
      float radY = this.getRadY();
      float posX = this.getX();
      float radX = this.getRadX();
      float bufferY = abs(velocityY)+2;
      float bufferX = abs(velocityX)+2;
      

      if (velocityX != 0) {
        velocityX *= (velocityY > .3)? .95:.9;
      }

      //If left side hits the right end of the object
      if (abs(posY-y)<radY+h/2) {
        if (abs((posX-radX)-(x+w/2))<bufferX) {
          this.setX(x2+radX+1);
          velocityX*=-.15;
        }
        //if the right side hits the right side of the object
        if (abs((posX+radX)-(x-w/2))<bufferX) {
          this.setX(x1-radX-.1);
          velocityX*=-.15;
        }

        if (abs(posX-x)<=radX+w/2) {
          //if top side hits the bottom of an object
          if (abs((posY-radY)-(y+h/2))<bufferY) {
            this.setY(y2+radY+2); 
            velocityY = 0;
          } 
          else {
            //if the bottom hits the top of an object
            if (abs((posY+radY)-(y-h/2))<bufferY) {
              this.setY(y1-radY);
              jumpStatus = MAX_JUMP_STATUS;
              velocityY = 0;
            }
          }
        }
      }
    }
  }
}




