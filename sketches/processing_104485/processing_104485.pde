

//Display window size
int widthD= 400;
int HeightD= 600;
int score=0;
int lives=3;
//Bricks
int spaceBetweenBricks= 5;
int numberOfBricks= 10;
int numberOfBrickRows= 10;
int spaceFromCeiling= 20; //space between the first row of bricks and the ceiling
float brickWidth= (widthD-(numberOfBricks-2)*spaceBetweenBricks)/numberOfBricks;
float brickHeight= 10;
color brickColors[]= {
  color(255, 0, 0), color(125, 125, 0), color(125, 0, 125), color(0, 125, 125), color(0, 255, 0), color(0, 0, 255), color(155, 100, 0), color(0, 100, 155), color(0, 155, 100), color(100, 0, 155)
};
color brickColor= color(255, 255, 0);
ArrayList<Block> BasketOfBricks= new ArrayList<Block>();

//Ball
int ballWidth=16;
float ballStartX=random(widthD);
float ballStartY=HeightD/2;
color ballColor= color(255, 0, 0);
Ball Moe= new Ball(ballStartX, ballStartY, ballWidth, ballColor);

//Paddle
int paddleX= widthD/2;
int paddleY= HeightD-50;
int paddleHeight= 20;
int paddleWidth= 70;
color paddleColor= color(255, 0, 255);
Block paddle= new Block(paddleX, paddleY, paddleWidth, paddleHeight, paddleColor);

//setup once
void setup() {
  size(widthD, HeightD);
  background(255); 
  setupBricks();
}

//make everything
void draw() {
  if(lives>0)
  {
  background(255); 
  drawBricks();
  drawBall();
  drawPaddle();
  drawText();
  }
  if(lives==0)
  {
   drawLose(); 
  }
}

//initialize all the bricks
void setupBricks() {
  for (int rowNumber=0; rowNumber<numberOfBrickRows; rowNumber++) 
  {
    color brickColor= brickColors[rowNumber];
    rect(0, spaceFromCeiling+(brickHeight+spaceBetweenBricks)*rowNumber, brickWidth, brickHeight);
    for (int brickNumber=0; brickNumber<numberOfBricks; brickNumber++) 
    {
      BasketOfBricks.add(new Block((spaceBetweenBricks+brickWidth)*brickNumber, spaceFromCeiling+(brickHeight+spaceBetweenBricks)*rowNumber, brickWidth, brickHeight, brickColor));
    }
  }
}

//draw the bricks
void drawBricks() {
  for (int brickNumber= BasketOfBricks.size()-1; brickNumber>=0; brickNumber--) {
    Block brick=BasketOfBricks.get(brickNumber);
    brick.draw();
    brick.collidesWith(Moe);
    if (brick.collidesWith(Moe))
    {
      BasketOfBricks.remove(brick);
      score+=10;
    }
  }
}


//draw the ball
void drawBall() {
  Moe.draw(); 
  Moe.update();
  if (Moe.checkWallCollision())
  {
   lives--;
   Moe.move(width/2, height/2); 
  }
}



//draw the paddle and have it move with the mouse
void drawPaddle() {
  paddle.draw();
  paddle.move(mouseX, paddleY);
  paddle.collidesWith(Moe);
}

//drawText
void drawText() {
  displayText("Score:" + score, 10, 590, false);
  if (score==1000)
  {
    displayText("You win!", 0, 300, true);
  }
  displayText("Lives: " + lives, 275, 590, false);
}

//make text
void displayText(String message, int x, int y, boolean isCentered) {
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

//you lose
void drawLose() {
  if (score<1000)
  {
   displayText("You Lose!", 0, 300, true); 
  }
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
  float speedY= random(1, 10);
  float speedX= random(-10, 10);

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
    ballX=X;
    ballY= Y;
    speedY= random(1, 10);
    speedX= random(-10, 10);
  }

  //this does the bounce
  boolean checkWallCollision() {
    if (ballX>width-ballWidth/2) {
      speedX=-abs(speedX);
    } 
    else if (ballX<ballWidth/2) {
      speedX=abs(speedX);
    } 
    if (ballY>height-ballWidth/2) { 
      speedY=-abs(speedY);
      return true;
    } 
    else if (ballY<ballWidth/2) {
      speedY= abs(speedY);
    }
    return false;
  }
}

/*******Block Class**************/
/* The default class has the following default modes
 * Constructor function: to create a new block call:
               Block blockName= new Block(x, y, Width, Height, Color);
 * blockName.draw();  //this draws the ball
 * blockName.move(x, y); //this moves the block to be centered on X and Y
 * blockName.collidesWith(Ball b); //checks if it collided with the ball 
 *                                 //and makes the ball bounce
 * blockName.setHits(int numberOfHits); //allows you to set the number of times a brick needs to hit
 * blockName.getHIts(int numberOfHits); //tells you how times left the brick can be hit
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



