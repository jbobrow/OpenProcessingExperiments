
// This is a simple little game that awards points for fetching a ball.
// Fetch as many as you can in 20 seconds!
// Created by Mr. Norm Krumpe
// January 22, 2014

PImage dogPicture;
PImage backgroundPicture;
float ballX, ballY;
int score;
int startTime;
boolean gameInProgress;
int gameLength; 

void setup() {
  size(600, 400);
  // Loads the pictures you want into memory
  dogPicture = loadImage("dog.png");
  backgroundPicture = loadImage("sunset.jpg");

  score = 0;
  startTime = millis(); // For keeping track of time
  gameLength = 20; // how many seconds should the game last?
  gameInProgress = true; // set this to false when the game ends
  randomBall();
}

// This part happens 60 times per second: display the pictures
// and update the status of the game
void draw() {
  // Clear the old background by re-displaying the image
  image(backgroundPicture, 0, 0, width, height);

  // See if the game is still going on:
  if (elapsedTime() <= gameLength) {
    // if it is, draw something for the dog to fetch
    fill(255, 255, 0); // yellow
    ellipse(ballX, ballY, 15, 15); // 15 is the size of the ball
  }
  else {
    // otherwise, game is over
    gameInProgress = false;
  }
  
  // show the dog AFTER drawing the ball, because we want it to 
  // be in front of it.  
  image(dogPicture, mouseX, mouseY, 125, 100);  
  
  showScore();
}

// Select a new random location
void randomBall() {
  ballX = random(width);
  // Pick something in the lower half of the screen so that
  // the dog doesn't drown in the Gulf of Mexico
  ballY = random(height/2, height);
}

// When the mouse is clicked, see if a point should be awarded:
void mouseClicked() {
  if (gameInProgress) {
    if (dist(mouseX, mouseY + 45, ballX, ballY) < 10) {
      score = score + 1;
      randomBall();
    }
    else {
      score = score - 1;
    }
  }
}

// Display the score, and time, or note that the game is over
void showScore() {
  text("Fetch Points: " + score, 0, 20);
  if (gameInProgress) {
    text("Elapsed time: " + (int)(gameLength - elapsedTime()), 0, 40);
  }
  else {
    fill(255, 0, 0);
    text("GAME OVER!", 0, 40);
  }
}

// Computes how many seconds have gone by so far.
// Time is measured in milliseconds, so we need to divide by 1000.
int elapsedTime() {
  return (millis() - startTime) / 1000;
}



