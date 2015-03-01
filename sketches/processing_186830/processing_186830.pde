
boolean gameStart = false;

float x = 150;
float y = 150;
float speedX = random(3, 5);
float speedY = random(3, 5);
int leftColor = 128;
int rightColor = 128;
int diam;
int rectSize = 150;
float diamHit;


void setup() {
  size(900, 400);
  noStroke();
  smooth();
  ellipseMode(CENTER);
}

void draw() { 
  background(137,139,137);

  fill(#ffdd00);
  diam = 20;
  ellipse(x, y, diam, diam);

  fill(leftColor);
  rect(#ffdd00, height);
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
      fill(random(0,128),random(0,128),random(0,128));
      diamHit = random(75,150);
      ellipse(x,y,diamHit,diamHit);
      rectSize = rectSize-10;
      rectSize = constrain(rectSize, 10,150);      
    } 

    // if ball hits wall, change direction of X
    else if (x < 25) {
      speedX = speedX * -1.1;
      x = x + speedX;
      leftColor = 0;
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
      speedY = speedY * -1;
      y = y + speedY;
    }
  }
}
void mousePressed() {
  gameStart = !gameStart;
}
                
