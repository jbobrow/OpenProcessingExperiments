
/*The boolean that control the moving of the ball. This is set false in the
  beginning because the ball doesn't need to move at the beginning 
  of the game */
  boolean startMoving = false;
  /* This variable controls the y positions of the left and right padels */
  int lefty = height/2;
  int righty = height/2;
  /* the position of the ball*/
  float ballx = 400;
  float bally = 300;
  /* the speed of the ball*/
  int speedX = 5;
  int speedY = 3;
  /* These variables control the lives of the left and right player */
  int livesLeft = 3;
  int livesRight = 3;
  /* This boolean is true when one of the players is game over */
  boolean GameOver = false;
  /* These variables control the position of the button to start a new game */
  int startAgainX = 325;
  int startAgainY = 280;

void setup () {
  size(800,600);
}

void draw(){
  background(255);
  stroke(0);
  // Dashed line. This is a for loop, of all short lines, where the loop calcutates the beginning y position of the line
  for (int dashedLine = 0; dashedLine < height; dashedLine = dashedLine+5) {
  line(width/2, dashedLine-2, width/2, dashedLine);
} 

 // The ball
  fill(0);
  stroke(0);
  smooth();
  ellipse(ballx,bally,20,20);
  
  // The text on the top of the screen which says how many lives each player has left
  text("Lives: " + livesLeft,40,20);
  text("Lives: "+ livesRight,720,20);

/* When the left player has 0 lives left, the code within the if statement will start working: the text 'game over' will appear on the
left side of the screen, the speed of the ball will be set to 0, the button ' start again' will appear in the middle of the screen. 
If you click this button, the ball will be set to his beginning position, the speed will be set to the beginning speed en the lives will be 
3 again.*/
if (livesLeft <= 0){
  fill(255,0,0);
  text("Game over...",170,300);
  speedX = 0;
  speedY = 0;
  startAgainX = 325;
  startAgainY = 280;
  fill(0);
  rect(startAgainX,startAgainY,150,40);
  fill(255);
  text("Play another game!", startAgainX+20,startAgainY+25);
  if(mousePressed){
  if(mouseX > 325 && mouseX < 425 && mouseY > 280 && mouseY <330){
    startAgainX = 1000;
    startAgainY = 1000;
    speedX = 5;    
    speedY = 3;
    startMoving = false;  
    livesLeft = 3;
    livesRight = 3;
 }
 loop();
  }   
}

/* When the right player has 0 lives left, the code within the if statement will start working: the text 'game over' will appear on the
right side of the screen, the speed of the ball will be set to 0, the button ' start again' will appear in the middle of the screen. 
If you click this button, the ball will be set to his beginning position, the speed will be set to the beginning speed en the lives will be 
3 again.*/
if (livesRight <= 0){
  fill(255,0,0);
  text("Game over...",570,300);
  speedX = 0;
  speedY = 0;
  startAgainX = 325;
  startAgainY = 280;
  fill(0);
  rect(startAgainX,startAgainY,150,40);
  fill(255);
  text("Play another game!", startAgainX+20,startAgainY+25);
  if(mousePressed){
  if(mouseX > 350 && mouseX < 450 && mouseY > 275 && mouseY <325){
    startAgainX = 1000;
    startAgainY = 1000;
    startMoving = false;
    speedX = 5;
    speedY = 3;
    livesLeft = 3;
    livesRight = 3;
 }
 loop();
  } 
}

// left paddle
noStroke();
fill(0);
rect(20,lefty,10,100);
  
//right paddle
rect(width-20,righty,10,100);
  
 
  
// making the ball move
if (startMoving == true){
   ballx = ballx + speedX;
   bally = bally + speedY;
}
  
  /* if the ball leaves the screen at the right side of the screen, the right player loses 1 live and the ball will go to the beginning position 
  again. By setting the speed to negative, the ball will go into the other direction when you click the screen again   */
   if (ballx > width) 
    {
      ballx = 400;
      bally = 300;
      startMoving = false;
      livesRight = livesRight - 1;
 
      speedX = -speedX;
      speedY = 3;

    }
    /* The same for when the ball leaves the screen on the left side */
    else if (ballx < 0) 
    {
      ballx = 400;
      bally = 300;
      startMoving = false;
      livesLeft = livesLeft - 1;      

     speedX = 5;
     speedY = 3;
    }
    
    /* When the ball hits the top or bottom part of the screen it will bouce back, by changing the speed into a negative number. Because the position
    of the ball is calculated from the middle, I choose to add 10, because the width and height of the ball is 20. So now the corner of the ball
    will hit the top and bottom part of the screen instead of the middle */
    if (bally > height-10) 
    {
      speedY = speedY * -1;
    }
    else if (bally < 0+10) 
    {
      speedY = speedY * - 1;
    } 
    
    /* An if statement that makes sure that when the ball hits a paddle, it will bounce back. because the inner side of the paddle is 40 px from 
    the side, i made the first statement, the second statement means that the y position of the ball should be bigger than the y position of the highest
    point of the paddle. The third statement means that that the y position of the ball should be smaller than the lowest point of the paddle. The 
    paddle is 100 px long, so that is the highest point of the paddle + 100. This works the same for left and right. 
    */
    if (ballx <= 40 && bally >= lefty && bally <= (lefty + 100)){      
    speedY = -speedY;
    speedX = speedX * -1;
    speedY = speedY * -1;
    }
    
    if (ballx >= 770 && bally >= righty && bally <= (righty + 100)){      
    speedY = -speedY;
    speedX = speedX * -1;
    speedY = speedY * -1;
    }

   /* This makes the paddles move. UP and DOWN for the right paddle. SHIFT and CONTROL for the left paddle. In the if statement, I also make sure 
   that the paddle cannot leave the screen. 
   */
    if (keyPressed && righty >= 0){ 
        if (key == CODED) {
         if (keyCode == UP) {
           righty = righty - 8;
      }
     }
    }
    
    if (keyPressed && righty <= height-100){ 
        if (key == CODED) {
         if (keyCode == DOWN) {
           righty = righty + 8;
      }
     }
    }
    
    if (keyPressed && lefty >= 0){ 
        if (key == CODED) {
         if (keyCode == SHIFT) {
           lefty = lefty - 8;
      }
     }
    }
    
    if (keyPressed && lefty <= height-100){ 
        if (key == CODED) {
         if (keyCode == CONTROL) {
           lefty = lefty + 8;
      }
     }
    } 
}

// If this is called, the ball starts moving
void mousePressed(){
  startMoving = true;
}
