
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
color brickColors[]= {color(255, 0,0), color(255, 94, 0),color(255,255,0), color(0,255,0),color(0,146,255),color(186,0,255), color(255,0,0), color(255,94,0), color(255,255,0), color(0,255,0)};
color brickColor= color(255,255,0);
ArrayList<Block> BasketOfBricks= new ArrayList<Block>();

//Ball
int ballWidth= 16;
float ballStartX=random(widthD);
float ballStartY=HeightD/2;
color ballColor= color(255, 0, 0);
Ball Moe= new Ball(ballStartX, ballStartY, ballWidth, ballColor);
int ballR = ballWidth/2;

//Paddle
int paddleX= widthD/2;
int paddleY= HeightD-50;
int paddleHeight= 20;
int paddleWidth= 70;
color paddleColor= color(0);
Block paddle= new Block(paddleX, paddleY, paddleWidth, paddleHeight, paddleColor);

//setups
void setup() {
  size(400,600);
  background(255); 
  setupBricks();
}
//Animation
void draw() {
    
    if (lives>0) {
      background(255); 
      drawBricks();
      drawBall();
      drawPaddle();
      drawText();
      drawLose();
    }
}

//initialize all the bricks
void setupBricks() {
    for(int brickNumber=0; brickNumber<numberOfBricks; brickNumber++) {
    for(int rowNumber=0; rowNumber<numberOfBricks; rowNumber++) {
        float brickX=brickNumber*(brickWidth+spaceBetweenBricks); 
        float brickY= spaceFromCeiling+rowNumber*(brickHeight+spaceBetweenBricks);
        color brickColor=(brickColors[rowNumber]);
        BasketOfBricks.add(new Block(brickX, brickY, brickWidth, brickHeight, brickColor));
        
    }
  }
}

//draw the bricks
void drawBricks() {
  for(int brickNumber= BasketOfBricks.size()-1; brickNumber>=0; brickNumber--) {
    Block brick=BasketOfBricks.get(brickNumber);
    brick.draw();
   if (brick.collidesWith(Moe)) {
    BasketOfBricks.remove(brick);
    score=score+10;
    
  }
  //if (BasketOfBricks == 0) {
   // displayText("You Win!", 200,300, true);
 // }
}
}
//draw the ball
void drawBall() {
    Moe.draw();
    Moe.update();
    Moe.checkWallCollision();
}



//draw the paddle and have it move with the mouse
void drawPaddle() {
  paddle.draw();
  paddle.move(mouseX, paddleY);
  paddle.collidesWith(Moe);
}

//drawText
void drawText() {
  displayText("Score: " + score, 10, height-10, false);
  if (score == 1000) {
  displayText("You WIN!", 200, 300, true);
  }
  displayText("Lives: " +lives, width-125, height-10, false);
  
  
}
//text for score
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
  //text for if you lose
void drawLose() {
  if (lives == 0) {
    displayText("You LOSE :(", 200,300, true);
    
  }
  
}
