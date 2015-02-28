
//Display window size
int widthD= 400;
int HeightD= 600;
int score=0;
int lives=3;
String message;

//Bricks
float brickX=0;
int spaceBetweenBricks= 5;
int numberOfBricks= 10;
int numberOfBrickRows= 10;
int spaceFromCeiling= 20; //space between the first row of bricks and the ceiling
float brickWidth= (widthD-(numberOfBricks-2)*spaceBetweenBricks)/numberOfBricks;
float brickHeight= 10;
color brickColors[]= {color(255, 0,0), color(255, 183, 0), color(255,255,0), color(0,255,0), color(0,0,255), color(156,0,255), color(255, 0,0), color(255,183, 0), color(255,255,0), color(0,255,0)};
color brickColor= color(255, 255, 0);
ArrayList<Block> BasketOfBricks= new ArrayList<Block>();

//Ball
int ballWidth= 16;
float ballStartX=random(widthD);
float ballStartY=HeightD/2;
color ballColor= color(255, 0, 0);
boolean hasLost= false;
boolean hasWon= false;
Ball Moe= new Ball(ballStartX, ballStartY, ballWidth, ballColor);

//Paddle
int paddleX= widthD/2;
int paddleY= HeightD-50;
int paddleHeight= 20;
int paddleWidth= 70;
color paddleColor= color(255, 0, 255);
Block paddle= new Block(paddleX, paddleY, paddleWidth, paddleHeight, paddleColor);

void setup() {
  size(widthD, HeightD);
  background(255); 
  setupBricks();
}

void draw() {
    background(255); 
    drawBricks();
    if(!hasLost&&!hasWon) drawBall();
    drawPaddle();
    updateScore(false);
    drawLivesText();
    if(lives==0) drawLose();
}

//initialize all the bricks
void setupBricks() {
  
  for(int rowNumber=0;rowNumber<numberOfBrickRows;rowNumber++) {
    for(int brickNumber=0;brickNumber<numberOfBricks;brickNumber++) {
        color brickColor=brickColors[rowNumber];
        float brickY= spaceFromCeiling+(brickHeight+spaceBetweenBricks)*rowNumber;
        brickX=(brickWidth+spaceBetweenBricks)*brickNumber;
        BasketOfBricks.add(new Block(brickX, brickY, brickWidth, brickHeight, brickColor));
    }
  }
}

//draw the bricks
void drawBricks() {  
  for(int brickNumber= BasketOfBricks.size()-1; brickNumber>=0; brickNumber--) {
    Block brick=BasketOfBricks.get(brickNumber);
    brick.draw();
    if(brick.collidesWith(Moe)) {
      BasketOfBricks.remove(brick);
      updateScore(true);
    }
  }
}

//draw the ball
void drawBall() {
    Moe.draw();
    Moe.update();
    if(Moe.checkWallCollision()) {
      lives--;
      Moe.move(width/2, height/2);
    }
}



//draw the paddle and have it move with the mouse
void drawPaddle() {
  paddle.draw();
  paddle.blockX=mouseX;
  paddle.collidesWith(Moe);
}

void displayText(String message, int x, int y, boolean isCentered) {
  fill(0);
  textSize(32);
    String name= message;
    float textX= x;
    if (isCentered) {
      float widthText= textWidth(name);
      textX= (width-widthText)/2;
    } 
    int textY= y;
    text(name, textX, textY);
}
  
void drawLose() {
  String message="You lose!";
    displayText(message, 0, height/2, true);
    hasLost=true;
  }
  
void updateScore(boolean isNew) {
  if (isNew) score+=10;
  message="Score:"+score;
  displayText(message, 0, height-2, false);
  if(score==numberOfBricks*numberOfBrickRows*10) {
    displayText("You win!",0,height/2,true);
    hasWon=true;
  }
}

void checkLives() {
  if(Moe.ballY+Moe.ballWidth==height) {
    lives--;
  }
  drawLivesText();
}

void drawLivesText() {
  String message;
  message="Lives: " + lives;
  displayText(message,((int)(width-textWidth(message))),height-2,false);
}
/*******Ball Class**************/
/* The default class has the following default modes
 * Constructor function: to create a new ball call:
               Ball ballName= new Ball(x, y, Width, Color);
 * ballName.draw();  //this draws the ball
 * ballName.update(); //this moves the ball
 * ballName.checkWallCollision(); //
 */
class Ball {
  float ballX;
  float ballY;
  float ballWidth;
  color ballColor;
  float speedY= 3.5;
  float speedX= 3.5;
  
  //This is constructor known as the function that initiates
  Ball(float x, float y, int Width, color Color) {
     ballX= x;
     ballY= y;
     ballWidth= Width;
     ballColor= Color; 
  }
   //this draws the ball on the screen
  void draw() {
    noStroke();
    fill(ballColor);
    ellipse(ballX, ballY, ballWidth, ballWidth);
  }
  
  
  //this changes the ball to the speed;
  void update() {
    ballX+=speedX;
    ballY+=speedY;
  }
  void move(int X, int Y) {
    ballX = X;
    ballY = Y;
    speedY= 4;
    speedX= 4;
  }
  
  //this does the bounce
  boolean checkWallCollision() {
    if (ballX>width-ballWidth/2) {
        speedX=-abs(speedX); 
    } else if (ballX<ballWidth/2) {
       speedX=abs(speedX);
    } if (ballY>height-ballWidth/2) { 
        speedY=-abs(speedY);
        return true; 
    } else if (ballY<ballWidth/2) {
        speedY= abs(speedY);
    }
    return false;
  }
}
/*******Block Class**************/
/* The default class has the following default modes
 * Constructor function: to create a new block call:
               Block blockName= new Block(x, y, Width, Height, Color);
 * blockName.draw();  //this draws the block
 * blockName.move(x, y); //this moves the block to be centered on X and Y
 * blockName.collidesWith(Ball b); //checks if it collided with the ball 
 *                                 //and makes the ball bounce
 * blockName.setHits(int numberOfHits); //allows you to set the number of times a brick needs to hit
 * blockName.getHits(); //tells you how times left the brick can be hit
 */
class Block {
  float blockX;
  float blockY;
  float blockWidth;
  float blockHeight;
  color blockColor;
  int maxHits= 1;
  int hits=maxHits;
  
  //This is constructor known as the function that initiates
  Block(float x, float y, float Width, float Height, color Color) {
     blockX= x;
     blockY= y;
     blockWidth= Width;
     blockHeight= Height;
     blockColor= Color; 
  }
   //this draws the block on the screen
  void draw() {
    noStroke();
    fill(blockColor);
    rect(blockX, blockY, blockWidth, blockHeight);
  }
  
  
  //this moves the block 
  //to be centered on X, Y coordinates
  void move(int X, int Y) {
    blockX=X-blockWidth/2;
    blockY=Y-blockHeight/2;
    
    //prevents it from going off screen on the X direction
    if (blockX+blockWidth>width) {
      blockX=width-blockWidth;
    }
    else if (blockX<0) {
      blockX=0;
    }
    
    //prevents it from going off screen on the the Y direction
    if (blockY+blockHeight>height) {
      blockY=height-blockWidth;
    }
    else if (blockY<0) {
      blockY=0;
    }
    
  }
  
  //allows you to change the number of times an individual block can be hit
  void setMaxHits(int numberOfHits) {
    maxHits=numberOfHits;
    hits= maxHits;
  }
  
  //tells you if the brick can be hit more
  //returns 0 if the brick needs to be removed
  //useful if you want the brick hit multiple times
  int getHits() {
   return hits;
  }
  
  //returns a boolean if it collides with a ball.
 // It automatically changes the speed of the ball
  boolean collidesWith(Ball b) {
    //collides with bottom of block
    if ((b.ballX+b.ballWidth/4>blockX && b.ballX-b.ballWidth/4<blockX+blockWidth)
        && (b.ballY-b.ballWidth/2<(blockY+blockHeight) && b.ballY-ballWidth/2>blockY)) {
        //println("Collision Bottom 2 ");
        b.speedY=abs(b.speedY);
        hits--;
        return true;
      }
    
    //collides with top of block
    if ((b.ballX+b.ballWidth/4>blockX && b.ballX-b.ballWidth/4<blockX+blockWidth)
      && (b.ballY+b.ballWidth/2<blockY+blockHeight && b.ballY+b.ballWidth/2>blockY)) {
        //println("Collision Top ");
        b.speedY=-abs(b.speedY);
        hits--;
        return true;
      }
      
     //collides with Left side of block
    else if ((b.ballY+b.ballWidth/4>blockY && b.ballY-b.ballWidth/4<blockY+blockHeight)
      && (b.ballX+b.ballWidth/2>blockX && b.ballX+b.ballWidth/2<blockX+blockWidth)) {
        //println("Collision Left ");
        b.speedX=-abs(b.speedX);
        hits--;
        return true;
      }
 
    //collides with Right side of block
   if ((b.ballY+b.ballWidth/4>blockY && b.ballY-b.ballWidth/4<blockY+blockHeight)
      && (b.ballX-b.ballWidth/2<blockX+blockWidth && b.ballX-b.ballWidth/2>blockX)) {
        //println("Collision Right");
        b.speedX=abs(b.speedX);
        hits--;
        return true;
      }
  return false;
  }
}
