
float ellipseX, ellipseY, radius;
float myX, myY;
int startTime = 0;

void setup()
{
    size(displayWidth, displayHeight);
    ellipseX = random (displayWidth);
    ellipseY = random (displayHeight);
    radius = 100;
    myX = displayWidth/2;
    myY = displayHeight/2;
    textSize(100);
    textAlign(CENTER);
}

void draw()
{
    background(0, 0, 0);
    //Create the hidden circle
    fill (0, 0, 0);
    ellipse(ellipseX, ellipseY, radius, radius);
    //Displays the time
    fill (255, 255, 255);
    text (str(millis()/1000), width - 100, height - 50);
    //Create the player
    fill(255, 255, 255);
    ellipse(myX, myY, 20, 20);
    detectionSquare(ellipseX, ellipseY, myX, myY);
    //Wrap the screen
    if (myX < 0) myX = width;
    else if (myX > width) myX = 0;
    else if (myY < 0) myY = height;
    else if (myY > height) myY = 0;
    //Check if level won
    if (dist(ellipseX, ellipseY, myX, myY) <= radius)
    {
      winGame();
    }
    if (radius <= 20)
    {
      text ("You've won the game! Congrats!", width/2, height/2);
    }
}

//Creates the square in the corner for hot and cold
void detectionSquare(float targetX, float targetY, float myX, float myY)
{
    float distance = dist(targetX, targetY, myX, myY);
    float highestDistance = dist(0, 0, displayWidth, displayHeight);
    float red = map (distance, 0, highestDistance, 255, 0);
    float blue = map (distance, 0, highestDistance, 0, 255);
    color closeness = color(red, 0, blue);
    fill (closeness);
    rect (0, 0, 50, 50);  
}

//Winning a level
void winGame()
{
  fill (255, 255, 255);
  ellipse (ellipseX, ellipseY, radius, radius);
  fill (random(255), random(255), random(255));
  text("YOU WON", displayWidth/2, displayHeight/2);
  text("Press Enter to move on", width/2, height/2+100);
}

//Reset for the next level
void keyReleased()
{
  if (key == ENTER && frameCount - startTime > 100){
    ellipseX = random(width);
    ellipseY = random(height);
    radius -= 10;
    startTime = frameCount;
  }
}

//Make moves and cheat with g
void keyPressed() {
  if (key == 'g' || key == 'G')
  {
    fill (255, 255, 255);
    ellipse (ellipseX, ellipseY, radius, radius);
  }
  if (key == CODED) {
    if (keyCode == UP) 
    {
      myY-=5;
    } 
    else if (keyCode == DOWN) 
    {
      myY+=5;
    } 
    else if (keyCode == LEFT) 
    {
      myX-=5;
    }
    else if (keyCode == RIGHT)
    {
      myX+=5;
    }
  }
}
