
int ballX = 200;
int ballY = 150;

int ballXVelocity = 0;
int ballYVelocity = 0;

intpaddleOneX = 0;
intpaddleOneY = 150;

intpaddleTwoX = 200;
intpaddleTwoY = 150;

void setup() {

size(400,300);
background(200);


}

void draw() {

fill(50);
ellipse(ballX, ballY, 40, 20);


//Lets draw paddles now
fill(50, 60, 52)
rect(paddleOneX, paddleOneY, 40, 10);
rect(paddleTwoX, paddleTwoY, 40, 10);


}
