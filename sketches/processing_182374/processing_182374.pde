

// declares variables 

int ballX;

int ballY;

int ballSpeedX = 5;

int ballSpeedY = 5;

int paddleHeight = 30;

int paddleColor;

int score = 0;

int lives= 3;

boolean lost= false;


// initializes the canvas, mouse, and the ball

void setup() {

  size(800, 600); // sets canvas

  noCursor(); / tells mouse not to show up

  ballX = width/2; // width of ball

  ballY = height/2; // height of ball

}


// sets the loop to draw the paddle and the ball

void draw() {

  background(128); 

  moveBall(); // tells ball to move

  checkCollide(); // check if the ball collides with the wall or the paddle

  drawPaddle(); // draw paddle

  drawBall(); // draw ball

if (lives<=0){

noLoop();

}

}


// tells the ball to move

void moveBall() {

  ballX = ballX + ballSpeedX; // changes ball location from the speed of 5 or it can change

  ballY = ballY + ballSpeedY; // changes ball location from the speed of 5 or it can change

  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY); // tells to print the speed of the ball with the word ballspeedX or Y

}


// how to check the collide 

void checkCollide() {

  if (ballX < 0 || ballX > width) { //  ballX is less than 0 or greater than the left or right edges

    ballSpeedX = ballSpeedX * -1; // ball speed changes by -1

  }

  if (ballY < 0) { // ballY is less than the top edge 

    ballSpeedY = ballSpeedY * -1; // ball speed changes by -1

  }

  if (ballY > height-paddleHeight)  // ballY is past the goal line { score=score+1;

text(“score =”+score,10,10);

}

else{

  

 if (ballX > mouseX && ballX < mouseX + 200) { // ballX is between or in the paddle

      ballSpeedY = ballSpeedY * -1; // ballspeedY changes by -1

    } 

else if( ballX && ballY  > height-paddleHeight){

lives=lives-1;} 

else {

      text("GAME OVER!", width/2, height/2); // print game over on the screen 

      noLoop();

    }

  }

}


// tells  how to draw ball

void drawBall() {

  noStroke();

  ellipse(ballX, ballY, 20, 20); // coordinates of ball

}


// tells how to draw the paddle

void drawPaddle() {

  stroke(paddleColor); // paddle color

  strokeWeight(4); // thickness of the border

  rect(mouseX, height-paddleHeight-4, 200, paddleHeight); // the height of the paddle that moves with the mouse

rect(0,120,40,100);

rect(757,30,40,100);

}


// when mouse is pressed

void mousePressed() {

  paddleColor = int((map(mouseX, 0, width, 0, 255))); // change paddle color between the color scale 0-255

}


// when key is pressed

void keyPressed() {

  if (key == 'b' || key == 'B') { // if key b or B is pressed

    fill(0); // change paddle color to black

  }

  if (key == 'w' || key == 'W') { if w or W key is pressed

    fill(255); // change color to white

  }

}






