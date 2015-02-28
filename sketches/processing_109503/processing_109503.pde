
//Shannon Hart
//Studio 5C

int fieldSize = 400;
int ballX = fieldSize / 2;
int ballY = fieldSize / 2;
int ballWidth = 20;
int ballHeight = 20;
int horizontalDirection = 1;
int verticalDirection = 1;
int speedX = 3;
int speedY = 1;
int batX = 200;
int batY = 480;
int batWidth = 200;
int batHeight = 20;
int batSpeed = 10;

void setup() {
  size(fieldSize, fieldSize);
}

void draw() {
  background(0);
  ballX += speedX * horizontalDirection;
  ballY += speedY * verticalDirection;
  ellipse(ballX, ballY, ballWidth, ballHeight);
  rect(batX, batY, batWidth, batHeight);
  
  if (ballX >= fieldSize) {
    horizontalDirection = - 1;
  } else if (ballX <= 0) {
    horizontalDirection = 1;
  }
  if (ballY >= fieldSize) {
    verticalDirection = -1;
  } else if (ballY <= 0) {
    verticalDirection = 1;
  }
  
  boolean ballHitsBat = ballY + (ballHeight / 2) >= batY && 
                        ballY + (ballHeight / 2) <= (batY + batHeight) &&
                        (ballX >= batX && ballX <= batX + batWidth);
  
  if (ballHitsBat) {
    verticalDirection = -1;
  }
  
  ballX += horizontalDirection;
  ballY += verticalDirection;
}

void keyPressed() {
  if (key == 'a' || keyCode == LEFT && !(batX <= 0)) { // '' means a character
    batX -= batSpeed;
  }
  if (key == 'd' || keyCode == RIGHT && !(batX >= width - batWidth)) { 
    batX += batSpeed;
  }
  if (key == 'w' || keyCode == UP && !(batY <= 0)) { 
    batY -= batSpeed;
  }
  if (key == 's' || keyCode == DOWN && !(batY >= height - batHeight)) { 
    batY += batSpeed;
  }
}
