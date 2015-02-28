
float ballX;
float ballY;
float vx; 
float vy; 
int r;
int g;
int b;

void setup() {
  size(800, 800);

  ballX = width / 2;
  ballY = height / 2;
  vx = 5;
  vy = 2;
}

void draw() {
  noStroke();
  moveBall();
  drawBall();
  if(keyPressed && key == 'r') {
    background(255);
  }
}

void moveBall() {
  ballX += vx;
  ballY += vy;
  
  int r = (int) random(100,255);
  int g = (int) random(100,255);
  int b = (int) random(100,255);

  if (ballX > width) {
    vx = random(-25,-1);
    fill(r,b,g);
  }
  if (ballX < 0) {
    vx = random(1,25);
    fill(r,g,b);
  }
  if (ballY > height) {
    vy= random(-1,-25);
    fill(r,g,b);
  }
  if (ballY < 0) {
    vy= random(1,25);
    fill(r,g,b);
  }
}

void drawBall() {
  ellipse(ballX, ballY, 30, 30);
}
