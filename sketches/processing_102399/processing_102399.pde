
/* @pjs pauseOnBlur=true; 
preload="defeat.png,intro.png,victory.png"; 
 */

/****************************************************************************
*        LICENSE TERMS:
*  zlib License.
*
*  Copyright (c) 2013 Tkachenko Alexey.
*
*  This software is provided 'as-is', without any express or implied warranty. In no event will the authors be held liable for any damages arising from the use of this software.
*  
*  Permission is granted to anyone to use this software for any purpose,including commercial applications, and to alter it and redistribute it
*  freely, subject to the following restrictions:
*
*     1. The origin of this software must not be misrepresented; you must not claim that you wrote the original software. 
*        If you use this software in a product, an acknowledgment in the product documentation would be appreciated but is not required.
*
*     2. Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.
*
*     3. This notice may not be removed or altered from any source distribution.
*
*****************************************************************************/


//Coors of ball
float ballX, ballY;
//coords of player board
float pBoardX, pBoardY;
//coords of enemy board
float eBoardX, eBoardY;
//For ball movement
float yDirection, xDirection;
//General board and ball parameters
float boardWidth, boardHeight, ballWidth, ballHeight, margin;
//colors
color eColor, pColor, bColor;
//State of the game
boolean playing;
int pScore, eScore, winningScore;
//ScoreBars
float pScoreBarX, pScoreBarY, eScoreBarX, eScoreBarY, scoreBarHeight, scoreBarWidth;
//For endgame scrren
PImage img;

void setup()
{
  size(900, 700);  
  background(0);
  noCursor();
  //Scorebars
  //width and height of one element of scorebar
  scoreBarWidth = 25;
  scoreBarHeight = 25;
  //positions
  eScoreBarX = 25;
  eScoreBarY = 25;
  pScoreBarX = 25;
  pScoreBarY = height - 2*25;
  
  //not playing yet
  playing = false;
  //5 hits to win
  winningScore = 5;
  pScore = 0;
  eScore = 0;
  
  //Set board params
  boardWidth = 150;
  boardHeight = 20;
  ballWidth = 25;
  ballHeight = 25;
  margin = 100;
  
  //Set colors
  eColor = color(255,0,0);
  bColor = color(0,255,0);
  pColor = color(255,255,255);
  
  //initial ball, enemy, player board positions    
  eBoardX = width/2 - boardWidth/2;
  eBoardY =  margin;
  pBoardX = width/2 - boardWidth/2;
  pBoardY = height - (margin+boardHeight);
  ballY = pBoardY - ballHeight - 1;
  ballX = pBoardX + boardWidth/2 - ballWidth/2;
  //initial directions for ball movements
  yDirection = -7.5;
  xDirection = 7.5;  
}

void draw()
{
  // code that happens every frame
  background(0);
    
  //scorebars
  drawScoreBars();
  
  //enemy
  fill(eColor);
  rect(eBoardX, eBoardY, boardWidth, boardHeight);
  
  //ball
  fill(bColor);
  rect(ballX, ballY, ballWidth, ballHeight);
  
  //player
  fill(pColor);
  rect(pBoardX, pBoardY, boardWidth, boardHeight);
  
  if (playing)
  {    
    moveBoard();  
    moveBall();
    moveEnemy();    
  }
  else
  {
    endGame();
  }
}

//Movement of player's board with mouse
void moveBoard()
{
  float target;
  if( mouseX <= boardWidth/2 )//out of bounds
  {
    target = 0;
  }
  else if( mouseX >= width - boardWidth/2)//out of bounds
  {
    target = width - boardWidth;
  }
  else//ok
  {
    target = mouseX - boardWidth/2;
  }
  pBoardX = target;
}

//For moving ball, and processing it's collisions with walls and boards
void moveBall()
{
  //collisions with wallls
  if( ballX <= 0 )
  {
    ballX = 0;
    xDirection *= -1;
  }
  else if (ballX >= (width - ballWidth)+1)
  {
    ballX = width - ballWidth;
    xDirection *= -1;
  }
  //Collision with top or bottom parts of game field
  //which means someone just lost (not completely, but missed one, y'know)
  if( ballY <= 0 ) //enemy lost
  {    
    pScore++;
    checkScore();
    resetBallPosition("player");    
  }
  else if (ballY >= height - ballHeight) //player lost
  {
    eScore++;
    checkScore();
    resetBallPosition("enemy");
  }
  //Collisions with boards
  if( ballCollision(eBoardY, eBoardX) ) //enemy board
  {
    yDirection *= -1;
    //place ball below enemy board to avoid derping
    ballY = eBoardY + boardHeight + ballHeight/2;
    checkHitLocation( eBoardX );
  }
  else if( ballCollision(pBoardY, pBoardX) ) //player board
  {
    yDirection *= -1;
    //place ball on top of player's board to avoid derping
    ballY = pBoardY - boardHeight/2 - ballHeight;
    checkHitLocation( pBoardX );
  }
  //Increments, moves the ball
  ballX += xDirection;
  ballY += yDirection;
}

//Movement of enemy Board, sort of AI
void moveEnemy()
{
  //Easing for movement smoothing also the lower it is the faster enemy will be "reacting"
  //(that is moving horizontally) to ball's movement
  float easing = abs(yDirection) * 0.6; //depends on ball's vertical speed
  //target for enemy board to move to
  float targetX = ballX - boardWidth/2;
  //keep value in bounds in case ball goes too far
  if( targetX <= 0)
  {
    targetX = 0;
  }
  else if (targetX >= width-boardWidth)
  {
    targetX = width-boardWidth;
  }
  eBoardX += (targetX-eBoardX) / easing;
}

//collision detection routine of some board against ball
boolean ballCollision( float boardY, float boardX)
{
   float centerBallY = ballY + ballHeight/2;
   float centerBoardY = boardY + boardHeight/2; 
   float centerBallX = ballX + ballWidth/2;
   float centerBoardX = boardX + boardWidth/2; 
   if( abs(centerBallY - centerBoardY) <= (ballHeight/2+boardHeight/2) )
   {
     if(abs(centerBallX - centerBoardX) <= (ballWidth/2+boardWidth/2)
     /*abs( (ballX) - (boardX+boardWidth/2) ) <= boardWidth/2 
          || abs( (ballX+ballWidth) - (boardX+boardWidth/2) ) <= boardWidth/2 */ )
     {
       return true;
     }
   }
   return false;
}

//alters speed and angle of ball's movement depending on which part of board was hit
void checkHitLocation( float boardX )
{
  float hitPercent;
  float ballPosition = (ballX+ballWidth/2) - (boardX+boardWidth/2);
  hitPercent = ( ballPosition/(boardWidth - ballWidth) - 0.0 ) ;
  xDirection = ( hitPercent )* 30.0;
  yDirection *= 1.05;
}

//Places ball on top of player's board or below enemy's depending on who's the "starter"
void resetBallPosition( String starter)
{
  if( starter == "player")
  {
    ballY = pBoardY - ballHeight - 1;
    ballX =  pBoardX + boardWidth/2 - ballWidth/2;
    yDirection = -7.5;
    xDirection = 7.5  * pow( -1, (pScore+eScore) ); //sort of randomization of angle every turn( left or right)
  }
  else if( starter == "enemy" )
  {
    ballY = eBoardY + boardHeight + 1;
    ballX =  eBoardX + boardWidth/2 - ballWidth/2;
    yDirection = 7.5;
    xDirection = 7.5  * pow( -1, (pScore+eScore) );
  }
}

//Stops all game actions and handles drawing of endgame (or startgame) screens
void endGame()
{
  playing = false;    
  if( pScore >= winningScore )
  {
    img = loadImage("victory.png");
  }
  else if (eScore >= winningScore )
  {
    img = loadImage("defeat.png");
  }
  else
  {
    img = loadImage("intro.png");
  }
  imageMode(CENTER);
  image(img, width/2, height/2,img.width, img.height);
}

//Yep
void checkScore()
{
  if( pScore >= winningScore)
  {
    //player won
    endGame();
  }
  else if( eScore >= winningScore)
  {
    //player lost
    endGame();
  }
  else
  {
    return;
  }
}

//It does what it's name suggests
void drawScoreBars()
{
  float lastX = 0;
  //player scorebar
  fill( color(0,255,0) );//greens
  for( float x = pScoreBarX, i = 0; i < pScore; i++, x+=scoreBarWidth+1)
  {
    rect(x, pScoreBarY, scoreBarHeight, scoreBarWidth);
    lastX = x;
  }
  fill( color(150,150,150) );//nones
  for(float x = lastX +scoreBarWidth+1, i = 0; i < winningScore-pScore; i++, x+=scoreBarWidth+1)
  {
    rect(x, pScoreBarY, scoreBarHeight, scoreBarWidth);
  }
  //Enemy scorebar
  lastX = 0;
  fill( color(0,255,0) );//greens
  for( float x = eScoreBarX, i = 0; i < eScore; i++, x+=scoreBarWidth+1)
  {
    rect(x, eScoreBarY, scoreBarHeight, scoreBarWidth);
    lastX = x;
  }
  fill( color(150,150,150) );//nones
  for(float x = lastX +scoreBarWidth+1, i = 0; i < winningScore-eScore; i++, x+=scoreBarWidth+1)
  {
    rect(x, eScoreBarY, scoreBarHeight, scoreBarWidth);
  } 
}

//Event handler to start a game
void mouseClicked()
{
  if( !playing)
  {    
    setup(); //explicitly calling setup() to reset game
    playing = true;
  }
}


