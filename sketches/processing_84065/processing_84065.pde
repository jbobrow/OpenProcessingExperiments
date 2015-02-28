
/** Morgan Nolan 0702126 - Pong Game - **/
int posX, posY;
int speedX; //This variable sets the speed value for X
int speedY; //This variable sets the speed value for Y
int shapeSize = 10;
int lineX, lineY;
int spacing = 12;
//Variables for the Paddles
int paddleLeftX, paddleLeftY;
int paddleRightX, paddleRightY;
int sizeAcross = 10, sizeDown = 100;


void setup()
{
  size(800, 600);
  background(40, 126, 44); //Set background colour to green.
  posX = width/2;
  posY = height/2;
  stroke(255);
  lineX = (width / 2);
  //Initiate variables for the Paddles
  paddleLeftX = 0;
  paddleLeftY = height/2 - sizeDown/2;
  paddleRightX = width-10;
  paddleRightY = height/2 - sizeDown/2;
}

void draw()
{
   
  //Draw the background here to reset the screen.
  background(40, 126, 44); //Set background colour to green.
  ellipse(posX, posY, shapeSize, shapeSize); //Draws the ellipse - I can probably move this line
  int i = 0;
    while (i < height) // While Loop used to draw the dashed line with a spacing of 12.
    {
      line(lineX, i, lineX, i +8); // lineX is set to half the screen.  i=0 Coords for x are (200,0) i+8 is the length of the dashed line + spacing
      i = i + spacing;
    }
    
    if (mousePressed) // When the mouse is pressed, the speedX & speedY values are set so this starts the ball moving.
    {
      speedX = 3;
      speedY = 2;
    }

  posX = posX + speedX;
  posY = posY + speedY;
  
  //Test to see if the ball touches or passes the Paddles
  
 if (posX > width)
  {
   // speedX = speedX * -1;
   // This controls the Right Paddle and tests if the balls makes contact.  Otherwise resets.
   if ((posY > paddleRightY) && (posY < paddleRightY + sizeDown)) { // Tests to see if the posY (Ball position) touches the paddle right position and sizeDown and not the border
        speedX = (-speedX); //Changes Polarity of ball
      }
      else {
        // If the ball doesn't make contact with the paddle, the ball is reset to the centre and the polarity is reversed so the ball aims for the player who scored the point.
        speedX = -3;
        posX = (width / 2); 
        posY = (height / 2); // Drop the ellipse back into the Centre
        
      }
  }
  
  // This controls the left border of the screen
 else if (posX < 0)
    {
      if ((posY > paddleLeftY) && (posY < paddleLeftY + sizeDown)) { // Tests to see if the posY (Ball position) touches the paddle left position and sizeDown and not the border
        speedX = (-speedX); 
        java.awt.Toolkit.getDefaultToolkit().beep(); //Make Beep Sound When the paddle is touched by the ball
      }
      else {
       // If the ball doesn't make contact with the paddle, the ball is reset to the centre and the polarity is reversed so the ball aims for the player who scored the point.
        speedX = 3; // Speed is reverseing the direction to aim for the player who scored the point.
        posX = (width / 2);
        posY = (height / 2);
        
      }
    }
  
    
    if ((posY > height - shapeSize / 2) || (posY < shapeSize / 2)) {
      speedY = (-speedY); //Changes Polarity of the ball
      speedX = (-speedX); java.awt.Toolkit.getDefaultToolkit().beep(); //Make Beep Sound When the paddle is touched by the ball
    }
  
  
 // ellipse(posX, posY, shapeSize, shapeSize); //Draws the ellipse - I can probably move this line

  //The following two lines add in the Player area text - Player 1 & Player 2
  text("Player 1", width / 4, 15); // 15 is the distance from the top of the screen.
  text("Player 2", width / 4*3, 15); // Places the text in the centre of the second half of the screen.
  text("Player 1 - Use W and S keys", width / 8, 560); // Instruction to user
  text("Player 2 - Use the Up and Down keys", width / 8, 580); // Instruction to user
  //The following section draws the Paddles
  // Draw Left Paddle
  rect(paddleLeftX, paddleLeftY, sizeAcross, sizeDown);
  rect(paddleRightX, paddleRightY, sizeAcross, sizeDown);
  
  // User controls
  if(keyPressed)
  {
    if (key == 'W' || key == 'w') // key is used for ASCII keys
    {
      paddleLeftY -= 8; // Set the speed of the Left Paddle.
    }
    else if (key == 'S' || key == 's')
    {
      paddleLeftY += 8;
    }
    
    if (paddleLeftY < 0)
    {
    paddleLeftY = 0;
  }
  else if (paddleLeftY > height - sizeDown)
  {
        paddleLeftY = (height - sizeDown);
  }
  
  
  //Draw Right Paddle
  
  if (keyCode == UP) // keyCode is used for special key characters, including the arrow keys. Non-ASCII keys
    {
      paddleRightY -= 8; // Set the speed of the Right Paddle.
    }
    else if (keyCode == DOWN)
    {
      paddleRightY += 8;
    }
    
    if (paddleRightY < 0)
    {
    paddleRightY = 0;
  }
  else if (paddleRightY > height - sizeDown)
  {
        paddleRightY = (height - sizeDown);
  }
  }
}



