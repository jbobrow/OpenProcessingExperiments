
float x = 800; //sets the initial position of the x coordinate of the ball to 800 
float y = 450; //sets the initial position of the y coordinate of the ball to 450 
float xSpeed = 5; //sets the rate of change in the x position of the ball to 8 
float ySpeed = 5; //sets the rate of change in the y position of the ball to 8 
int rectRadiusx = 25; //sets the horizontal radius of the paddle to 25
int rectRadiusy = 100; //sets the vertical radius of the paddle to 100
int rectX2 = 1500; //sets the initial x position of the right paddle to 1500
int rectX = 100; //sets the initial x position of the left paddle to 100
int rectY = 450; //sets the initial y position of the right paddle to 450
int rectY2 = 450; //sets the initial y position of the left paddle to 450
int radius = 25; //sets the radius of the ball to 25
int buttonRadiusx = 75; //sets the horizontal radius of the start button to 75
int buttonRadiusy = 30; //sets the vertical radius of the start button to 30
int leftPlayerscore = 0; //sets the initial left player's score to 0
int rightPlayerscore = 0; //sets the initial right player's score to 0
int scoreW = 50; //sets the horizontal radius of the scoretext to 50
int scoreH = 25; //sets the vertical radius of the scoretext to 25
int scoreY = 50; //sets the y coordinate of the scoretext to 50
boolean startButton = true; //sets the condition of startButton to true
boolean keys[] = new boolean [4]; //sets keys as an array with 4 boolean values

//this only runs once
void setup() {
  size(1600, 900); //sets the size of the canvas to 1600 by 900 pixels
  rectMode(RADIUS); //sets rectMode to RADIUS
  ellipseMode(RADIUS); //sets ellipseMode to RADIUS
  noStroke(); //removes the stroke
  textSize(30); //sets text size to 30 pixels
}

//this runs until the stop button is pressed or when noLoop() is called
void draw() {
  if (startButton == true) { //if startButton is true
    startGame(); //then the conditional is true, run startGame
  }
  if (startButton == false) {  //if startButton is false
    //then run the code below it
    constrains(); //runs the constrains function
    background(255); //sets the background to white
    drawRects(); //runs the drawRects function
    arrayConditional(); //runs the arrayCondtional function
    drawBall(); //runs the drawBall function
    move(); //runs the move function
    edgeBounce(); //runs the edgeBounce function
    leftRectbounce(); //runs the left RectBounce function
    rightRectbounce(); //runs the rightRectbounce function
    score(); //runs the score function
    println(xSpeed); //prints the value of xSpeed
  }
}

//defines constrains
void constrains() {
  rectY = constrain(rectY, rectRadiusy, height-rectRadiusy); //constrains the left paddle within the canvas
  rectY2 = constrain(rectY2, rectRadiusy, height-rectRadiusy); //constrains the right paddle within the canvas
}

//defines drawRects
void drawRects() {
  fill(255, 0, 0); //sets the fill to red
  rect(rectX, rectY, rectRadiusx, rectRadiusy); //draws the left paddle
  fill(0, 0, 255); //sets the fill to blue
  rect(rectX2, rectY2, rectRadiusx, rectRadiusy); //draws the right paddle
}

//defines drawBall
void drawBall() {
  fill(0, 255, 0); //sets the fill for everything after it to green
  ellipse(x, y, radius, radius); //draws the ball in the center of the canvas with a radius of 25
}

//defines arrayConditional
void arrayConditional() {
  if (keys[0]) { //if the first key is pressed
    rectY-=30; //then moves the paddle up by 30 units
  } 
  if (keys[1]) { //if the second key is pressed
    rectY+=30; //then moves the paddle down by 30 units
  } 
  if (keys[2]) { //if the third key is pressed
    rectY2-=30; //then moves the paddle up by 30 units
  }  
  if (keys[3]) { //if the fourth key is pressed
    rectY2+=30; //then moves the paddle down by 30 units
  }
}

//defines move
void move() {
  x = x  + xSpeed; //changes the x position of the ball by xSpeed
  y = y + ySpeed; //changes the y position of the ball by ySpeed
}

//defines edgeBounce
void edgeBounce() {
  if (y-radius<=0 || y+radius>=height) { //if the ball goes beyond the top or bottom borders
    ySpeed = ySpeed * -1; //then reverse the y direction of the ball
  }
}

//defines score
void score() {
  fill(255, 0, 0); //sets the fill to red
  text("Score: " + leftPlayerscore, width/2-150, scoreH); //prints the score for the left player 
  fill(0, 0, 255); //sets the fill blue
  text("Score: " + rightPlayerscore, width/2, scoreH); //prints the score for the right player 
  if (x+radius>=rectX2) { //if the ball passes the right goal line
    //then do the following
    leftPlayerscore++; //add 1 to the left player's score
    x = width/2; //sets the x coordinate of the ball in the center of the canvas
    y = height/2; //sets the y coordinate of the ball in the center of the canvas
    xSpeed = 5; //sets xSpeed back to 5 after the left player scores
  }
  if (x-radius<=rectX) { //if the ball passes the left goal line
    //then do the following
    rightPlayerscore++; //add 1 to the right player's score
    x = width/2; //sets the x coordinate of the ball in the center of the canvas
    y = height/2; //sets the y coordinate of the ball in the center of the canvas
    xSpeed = 5; //sets xSpeed back to 5 after the right player scores
  }
}

//defines leftRectbounce
void leftRectbounce() {
  if (x-radius<=rectX+rectRadiusx && y+radius>=rectY-rectRadiusy && y-radius<=rectY+rectRadiusy) { //if the ball hits the left paddle
    xSpeed = xSpeed * -1.15; //then reverse the direction of the ball and increase the xSpeed by 10% of the current speed
  }
}

//defines rightRectbounce
void rightRectbounce() {
  if (x+radius>=rectX2-rectRadiusx && y+radius>=rectY2-rectRadiusy && y-radius<=rectY2+rectRadiusy) { //if the ball hits the right paddle
    xSpeed = xSpeed * -1.15; //then reverse the direction of the ball and increase the xSpeed by 15% of the current speed
  }
}

//defines startGame
void startGame() {
  if (mouseX>=width/2-buttonRadiusx && mouseX<=width/2+buttonRadiusx && mouseY>=height/2-buttonRadiusy && mouseY<=height/2+buttonRadiusy) { //if the mouse is inside the start button
    fill(0, 0, 255); //then change the color of it to bright blue
  } else {
    fill(0, 0, 150); //otherwise, make the color dark blue
  }
  if (mouseX>=width/2-buttonRadiusx && mouseX<=width/2+buttonRadiusx && mouseY>=height/2-buttonRadiusy && mouseY<=height/2+buttonRadiusy && mousePressed) { //if the mouse is inside the start button and the mouse is clicked
    startButton = false; //then set startButton to false
  }
  rect(width/2, height/2, buttonRadiusx, buttonRadiusy); //draws the start button in the center of the canvas with a width of 150 and height of 100
  fill(0, 255, 0); //sets the fill to green
  text("START", width/2-50, height/2); //prints the word start on the start button
}

//when any key is pressed
void keyPressed() {
  if (key == 'w')  keys[0] = true; //if "w" is registered as the key that is pressed, then "0" is true
  if (key == 's')  keys[1] = true; //if "s" is registered as the key that is pressed, then "0" is true
  if (key == 'i')  keys[2] = true; //if "i" is registered as the key that is pressed, then "0" is true
  if (key == 'k')  keys[3] = true; //if "k" is registered as the key that is pressed, then "0" is true
}

//when any key is released
void keyReleased() {
  if (key == 'w')  keys[0] = false; //if "w" is registered as the key that is released, then "0" is false
  if (key == 's')  keys[1] = false; //if "s" is registered as the key that is released, then "1" is false
  if (key == 'i')  keys[2] = false; //if "i" is registered as the key that is released, then "2" is false
  if (key == 'k')  keys[3] = false; //if "k" is registered as the key that is released, then "3" is false
}



