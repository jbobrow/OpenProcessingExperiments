
PImage img; // loads image

float xPos; // x position of ball
float yPos; // y position of ball
float xSpeed; // x speed of ball
float ySpeed; // y speed of ball
float startSpeed = 3; // starting speed of the ball

int score=0; // initial score
int lives=10; // initial lives

boolean gameOver = false; // creating true/false values for gameOver. Initially set to false, when player reaches 0 lives gameOver will become true and execute code

void setup () {
  frameRate(60); // 60 frames per second
  img = loadImage("background.jpg"); // loading an image for the background
  size(600,500); // size of the window
  smooth();

  xPos = width/2; // initial x position of ball
  yPos = height/2; // initial y position of ball

  xSpeed = startSpeed; // initial x speed of ball is set to startSpeed (5)
  ySpeed = startSpeed; // initial y speed of ball is set to startSpeed (5)
}
  
void draw () {
  imageMode(CENTER); // imported image is centered
  image(img,0,0); // imported image is loaded and placed at 0, 0
  
  ball(); // loads the ball function into draw
  
  fill(150,200,150,100); // adding a transparent green colour to overlay the image. this creates a ghosting effect
  rect(0,0,width,height); // transparent rectangle covers the width and height of the window
  
  textAlign(CENTER); // text aligned to center
  textSize(16); // text size of 16
  fill(255); // white fill
  text("score = "+score,80,30); // text field that adds the score                  
  text("lives = "+lives,width-80,30); // text field that counts the lives          
  fill(#FCF494); // coloured fill
  textSize(18); // text size of 18
  text("Click inside the ball for points. Have fun!", width/2, 50); // introductory text
  
    if (score >= 100) { // if score is greater than or equal to 100 then...
      textSize(12); // text size of 12
      text("Try not to panic...", width/2, height - 20); // tells the player not to panic
    }
    
    if (score >= 200) { // if score is greater than or equal to 200 then...
      textSize(12); // text size of 12
      text("............", width/2, height - 10); // tells the player not to panic
    }
    
     if (score >= 300) { // if score is greater than or equal to 300 then...
      fill(#FF7171); // fill colour
      textSize(20); // text size of 20
      text("UH OH!", width-100, height - 20); // theres no going back!
    }
  
    if (lives <= 1) { // if lives is less than or equal to 1 then...
      fill(255); // white fill
      textSize(18); // text size of 18
      text("DONT GIVE UP!", width/2, height - 35); // tells the player not to give up
  }
}

void ball () { // ball function
  fill(255); // white fill  
  ellipse(xPos,yPos,50,50); // creates ball via ellipse. uses xPos and yPos to set the position of the ball and is 50 by 50 pixels
  
  //checks if ellipse is within width and height
  //reverses speed direction on collision
  if (xPos > (width-25) || xPos < 25) {xSpeed*=-1;}
  if (yPos > (height-25) || yPos < 25) {ySpeed*=-1;}
   
  xPos+=xSpeed; //applies speed to ball
  yPos+=ySpeed; //applies speed to ball
}

void mousePressed()                              
{
  if (dist(mouseX, mouseY, xPos, yPos)<=25) // setting up if statement, checking if the player has clicked the ball
  {
    score=score+10; // the score increases by 10 each time the ball is hit                             
    xSpeed = random(-5,5); // each time mouse clicks ball, the xSpeed is a random value between -5 and 5
    ySpeed = random(-5,5); // each time mouse clicks ball, the ySpeed is a random value between -5 and 5
    ball(); // this is here as the ball will blink whenever it is clicked (giving the player visual feedback)
  }
   else { // if mouse is not clicked on ball then..
    background(100,0,0); // flash red background for visual feedback
    lives = lives - 1; // takes a live away
   }
   
  if (lives <= 0) { // if lives is less than or equal to 0 then...
    imageMode(CENTER); // center image
    tint(200,0,0, 240); // adds a tint to the image
    image(img,0,0); // loads image
    textAlign(CENTER); // text is centered
    textSize(50); // text size is 50
    text("Game Over!", width/2,height/2); // tells the player that the game is over
    noLoop(); // does not loop
  }
  
  if (score >= 100) { // if score is equal to or greater than 100 then...
    xSpeed = random(-8,8); // increase x value range
    ySpeed = random(-8,8); // increase y value range
  }
  
  if (score >= 200) { // if score is equal to or greater than 200 then...
     xSpeed = random(-11,11); // increase x value range
    ySpeed = random(-11,11); // increase y value range
  }
  
  if (score >= 300) { // if score is equal to or greater than 300 then...
    xSpeed = random(-14,14); // increase x value range
    ySpeed = random(-14,14); // increase y value range
  }
}

// Created by Conan Mc Nicholl. //



