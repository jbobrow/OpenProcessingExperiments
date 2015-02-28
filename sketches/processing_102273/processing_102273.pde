
Maxim maxim;

int brickH = 20;
int brickW = 30;
int totalBricks = 100;
int brickRows = 10;
int brickColumns = 10;
Brick[] bricks = new Brick[totalBricks];
Ball myBall;
Paddle pad;
PFont arial;
Dog pup;
PImage dogWin;
boolean anybricks;
boolean youWon;

void setup()
{
  size(300, 400);
  maxim = new Maxim(this);
  PImage img = loadImage("Brick.jpg");
  PImage img1 = loadImage("lbrick.jpg");
  PImage img2 = loadImage("rbrick.jpg");
  PImage cMan = loadImage("man.jpg");
  dogWin = loadImage("cdog4.jpg");
  myBall = new Ball(0, 0, 0);
  pad = new Paddle(cMan, 0, 0, 0, myBall);
  anybricks = true;
  youWon = false;
  pup = new Dog(0, 0, 0);
  arial = loadFont("ArialMT-48.vlw");
//  ball.setPosition(width/2, height-50); 

  for ( int bCount=0; bCount<totalBricks; bCount++)
  {
    float rand = random(-1, 2);
    if ( rand > 1 )
      bricks[bCount] = new Brick(img, brickW, brickH, myBall); 
    else if ( rand > 0 )
      bricks[bCount] = new Brick(img1, brickW, brickH, myBall); 
    else
      bricks[bCount] = new Brick(img2, brickW, brickH, myBall);
  }
  mouseY = height/2;
  pad.display();
  myBall.setPosition(mouseX, height - 108); 
  pup.display();
}

void draw()
{
  // code that happens every frame
  background(255);
  int bCount=0;
  int row=0;

  anybricks = false;
  for ( int r=0; r<brickRows; r++)
  {
    int column=0;
    for (int c=0; c<brickColumns; c++)
    {
      Brick b = bricks[bCount++];
      if ( row == 0 ) {
        b.setVisible(false);
      }

      if ( b.visible() == true) {
        anybricks = true;
      }

      pushMatrix();
      translate(column, row); 
      b.setPosition(column, row);
      b.display();
      popMatrix();
      column += brickW;
    }
    row += brickH;
  }

  if ( anybricks == true)
  {
    myBall.update();
    myBall.display();
    myBall.checkBoundaryCollision();
    pad.display();
  } 
  else {
    if ( pup.getPositionY() == height-50 ) {
      pad.display();
      textFont(arial);
      textSize(32);
      fill(100);
      text("You Saved Me!!", width/2-120, height/2);
      youWon = true;
    } 
    else
    {
      pup.setImage(dogWin);
      pup.setPosition(pup.getPositionX(), pup.getPositionY()+1);
      pup.update();
      pad.display();
    }
  }
  pup.display();
}

void mouseDragged()
{
  // code that happens when the mouse moves
  // with the button down
}

void mousePressed()
{
  // code that happens when the mouse button
  // is pressed
  if ( youWon == true ){
      setup();
      myBall.setVelocity(3, 3);
  } else if (myBall.getPositionY() > height)
  { 
    myBall.setPosition(mouseX, height-108); 
    myBall.setVelocity(-3, -3);
  } 
  else
  {
    if ( myBall.getVelocityY() < 0 )
      myBall.setVelocity(myBall.getVelocityX(), myBall.getVelocityY()-1);
    else
      myBall.setVelocity(myBall.getVelocityX(), myBall.getVelocityY()+1);
  }
}

void mouseReleased()
{
  // code that happens when the mouse button
  // is released
}


class Ball {
  PVector position;
  PVector velocity;
  boolean collision;
  float r, m;
  AudioPlayer brickCollisionPlayer;
  AudioPlayer padPlayer;
  
  Ball(float x, float y, float r_) {
    position = new PVector(x, y);
    velocity = new PVector(1,1);//.random2D();
    velocity.mult(3);
    r = r_;
    m = r*.1;
    collision = false;
    brickCollisionPlayer = maxim.loadFile("boom3.wav");
    brickCollisionPlayer.setLooping(false);
    brickCollisionPlayer.volume(1.0);

    padPlayer = maxim.loadFile("boing1.wav");
    padPlayer.setLooping(false);
    padPlayer.volume(1.0);
  }
    
  void update() {
    position.add(velocity);
  }

  void setPosition(float x, float y) {
    position.x = x;
    position.y = y;
  }
  void setVelocity(float x, float y) {
    velocity.x = x;
    velocity.y = y;
  }
  
  float getPositionX() {
    return position.x;
  }
  float getPositionY() {
    return position.y;
  }

  float getVelocityX() {
    return velocity.x;
  }
  float getVelocityY() {
    return velocity.y;
  }

  void checkBoundaryCollision() {
    if (position.x > width-r) {
      position.x = width-r;
      velocity.x *= -1;
    } 
    else if (position.x < r) {
      position.x = r;
      velocity.x *= -1;
    } 
    else if (position.y < r) {
      position.y = r;
      velocity.y *= -1;
    }
  }

  void brickCollision() {
      velocity.y *= -1;
      collision = true;
      brickCollisionPlayer.stop();
      brickCollisionPlayer.play();
  }

  void paddleCollisionLeft() {
      velocity.y *= -1;
      if ( velocity.x > 0 )
         velocity.x *= -1;
      padPlayer.stop();
      padPlayer.play();
  }
  void paddleCollisionRight() {
      velocity.y *= -1;
      if ( velocity.x < 0 )
          velocity.x *= -1;
      padPlayer.stop();
      padPlayer.play();
  }
  
  void display() {
    if (collision)
    {
      collision = false;
      pushMatrix();
      translate(position.x, position.y);
      noStroke();
      fill(255,0,0);
      ellipse(0, 0, 50,50);
      popMatrix();
    } else
    {
      pushMatrix();
      translate(position.x, position.y);
      noStroke();
      fill(200,0,100);
      ellipse(0, 0, 10,10);
      popMatrix();
    }
 }
}

class Brick {
  int lenght;
  int ht;
  int bx;
  int by;
  float ballX;
  float ballY;
  boolean isVisible;
  PImage img; 
  Ball theBall;
  
  Brick(PImage image,int l, int h, Ball b)
  {
    lenght = l;
    ht = h;
    float rand = random(-1,1);
    isVisible = false;
    if ( rand > 0 )
        isVisible = true;
    img = image;
    theBall = b;
  }
  
  void setPosition(int x,int y)
  {
    bx = x;
    by=y;
  }
  
  boolean visible() {
    return isVisible;
  }
  
  void setVisible(boolean vis) {
    isVisible = vis;
  }
  
  void display() {
    stroke(255,255,255);
    if ( isVisible )
    {
       if ( (theBall.getPositionY() > by) && (theBall.getPositionY() < by+ht) &&
            (theBall.getPositionX() > bx) && (theBall.getPositionX() < bx+lenght) )
       {
          isVisible = false;
          theBall.brickCollision();
       }
    }
    
    if ( isVisible )
    {
      fill(by+100);
//      rect(0,0,lenght, ht);
      image(img, 0,0,lenght, ht);
    } else
    {
      noStroke();
      fill(255);
      rect(0,0,lenght, ht);      
    }
  }
}
int dogW = 40;
int dogH = 20;
int dogLine = 0;
int imageIdx;
PImage dogImage;
PImage dogR1;
PImage dogR2;
PImage dogR3;
PImage dogL1;
PImage dogL2;
PImage dogL3;
PImage dogT;

class Dog {
  PVector position;
  PVector velocity;
  float r, m;
  AudioPlayer dogPlayer;
  
  Dog(float x, float y, float r_) {
    position = new PVector(x, y);
    velocity = new PVector(0.1,0,1);//PVector.random2D();
    velocity.mult(3);
    r = r_;
    m = r*.1;
   
    dogR1 = loadImage("cdog2r.jpg");
    dogR2 = loadImage("cdog3r.jpg");
    dogR3 = loadImage("cdog1r.jpg");
    dogL1 = loadImage("cdog2.jpg");
    dogL2 = loadImage("cdog3.jpg");
    dogL3 = loadImage("cdog1.jpg");
    dogT =  loadImage("cdog4.jpg");
    dogImage = dogR1;
    imageIdx = 0;
    dogPlayer = maxim.loadFile("dogbark.wav");
    dogPlayer.setLooping(false);
  }
  
  void update() {
    position.add(velocity);
  }

  void setPosition(float x, float y) {
    position.x = x;
    position.y = y;
  }
  
  void setImage(PImage img) {
    dogImage = img;
  }
  
  float getPositionX() {
    return position.x;
  }
  float getPositionY() {
    return position.y;
  }

  void checkBoundaryCollision() {
    if ( imageIdx > 12 )
    {
      imageIdx = 0;
    }
    if (position.x+dogW > width) {
      position.x = width-dogW;
      velocity.x *= -1;
      dogImage = dogT;
      dogPlayer.stop();
      dogPlayer.play();
      imageIdx = 0;
    } else if (position.x < 0) {
      position.x = 0;
      velocity.x *= -1;
      dogImage = dogT;
      dogPlayer.stop();
      dogPlayer.play();
      imageIdx = 0;
    } else if (velocity.x < 0 ) {
         imageIdx++;
         if ( imageIdx < 4 ) {
            dogImage = dogL1;
         } else if ( imageIdx < 8 ) {
            dogImage = dogL2;
         } else if ( imageIdx < 12 ) {
            dogImage = dogL3;
      }
    } else if (velocity.x > 0 ) {
         imageIdx++;
         if ( imageIdx > 8 ) {
            dogImage = dogR3;
         } else if ( imageIdx > 4 ) {
            dogImage = dogR2;
         } else if ( imageIdx > 0 ) {
            dogImage = dogR1;
      }
    }
  }

 
  void display() {
     pushMatrix();
      update();
      checkBoundaryCollision();
      translate(position.x, position.y);
      fill(0);
      image(dogImage, 0,0,dogW, dogH);
      popMatrix();

  }
}
int paddleW = 78;
int paddleH = 108;
int paddleLine = paddleH/2;
int paddleThickness = 20;
PImage cMan;
PImage cMan2;

class Paddle {
  PVector position;
  PVector velocity;
  boolean collision;
  float r, m;
  Ball theBall;
  
  Paddle(PImage man,float x, float y, float r_, Ball b) {
    position = new PVector(x, y);
    velocity = new PVector(1,1);//PVector.random2D();
    velocity.mult(3);
    r = r_;
    m = r*.1;
    collision = false;
    theBall = b;
    cMan = man;
    cMan2 = loadImage("man2.jpg");
  }
  
  void update() {
    position.add(velocity);
  }

  void setPosition(float x, float y) {
    position.x = x;
    position.y = y;
  }
  
  float getPositionX() {
    return position.x;
  }
  float getPositionY() {
    return position.y;
  }

  void checkBoundaryCollision() {
    if (position.x > width-paddleW) {
      position.x = width-paddleW;
      velocity.x *= -1;
    } 
    else if (position.x < 0) {
      position.x = 0;
      velocity.x *= -1;
    } 
    else if (position.y > height-r) {
      position.y = height-r;
      velocity.y *= -1;
    } 
    else if (position.y < r) {
      position.y = r;
      velocity.y *= -1;
    }
  }
  
  void display() {
      pushMatrix();
      position.x = mouseX;
      checkBoundaryCollision();
      
      translate(position.x, height-paddleH);
      image(cMan, 0,0,paddleH, paddleW);

      if ( (theBall.getPositionY() > height-paddleLine-paddleThickness) && (theBall.getPositionY() < height-paddleLine) )
      {
        if ( (theBall.getPositionX() >= mouseX) && (theBall.getPositionX() < mouseX+(paddleW/2)) )
       {
          image(cMan2, 0,0,paddleH, paddleW);
          theBall.paddleCollisionLeft();
       } else if ( (theBall.getPositionX() >= mouseX+(paddleW/2)) && (theBall.getPositionX() < mouseX+paddleW) )
       {
          image(cMan2, 0,0,paddleH, paddleW);
          theBall.paddleCollisionRight();
       }
      }
      popMatrix();

  }
}


