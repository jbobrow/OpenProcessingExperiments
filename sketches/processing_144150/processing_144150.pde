
boolean gameStart = false;

float x = 150;
float y = 150;
float speedX = random(3, 5);
float speedY = random(3, 5);
int leftColor = 66;
int rightColor = 66;
int diam;
int rectSize = 900;
//ALEX NOTE: To make the bar bigger at the beginning, giving the player a sense of false hope
float diamHit;


void setup() {
  size(900, 720);
  // ALEX NOTE: To make the game fullscreen on an HD screen
  noStroke();
  smooth();
  ellipseMode(CENTER);
}

void draw() { 
  background(255);

  fill(0,8,66);
  diam = 20;
  ellipse(x, y, diam, diam);

  fill(leftColor);
  rect(0, 128, 20, height);
  fill(rightColor);
  rect(width-30, mouseY-rectSize/2, 10, rectSize);


  if (gameStart) {

    x = x + speedX;
    y = y + speedY;

    // if ball hits movable bar, invert X direction and apply effects
    if ( x > width-30 && x < width -20 && y > mouseY-rectSize/2 && y < mouseY+rectSize/2 ) {
      speedX = speedX * -1;
      x = x + speedX;
      rightColor = 0;
      fill(random(128,128),random(0,18),random(0,128));
      //ALEX NOTE: to change the colour of the fill when the ball hits the bar
      diamHit = random(75,750);
      //ALEX NOTE: changed the size of the diameter
      ellipse(x,y,diamHit,diamHit);
      rectSize = rectSize-10;
      rectSize = constrain(rectSize, 10,150);      
    } 

    // if ball hits wall, change direction of X
    else if (x < 25) {
      speedX = speedX * -1.7;
      //ALEX NOTE: This is also important. I changed the speed of acceleration to make the game go much much faster. This makes the game almost unplayable after several hits
      x = x + speedX;
      leftColor = 128;
    }

    else {     
      leftColor = 128;
      rightColor = 128;
    }
    // resets things if you lose
    if (x > width) { 
      gameStart = false;
      x = 150;
      y = 150; 
      speedX = random(3, 5);
      speedY = random(3, 5);
      rectSize = 150;
    }


    // if ball hits up or down, change direction of Y   
    if ( y > height || y < 0 ) {
      speedY = speedY * -1.4; 
      //ALEX NOTE: This is also important as it changes the angle to make it angle much higher than a traditional game of pong.
      y = y + speedY;
    }
  }
}
void mousePressed() {
  gameStart = !gameStart;
}
                
