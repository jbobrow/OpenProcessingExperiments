
int ballX = 200;
int ballY = 150;

int ballXVelocity = 0;
int ballYVelocity = 0;

int paddleOneX = 10; //We want to move the paddle away from the edge;
int paddleOneY = 150;

int paddleTwoX = 400 - 10;
int paddleTwoY = 150;

void setup() {

size(400,300);
background(200);

ballXVelocity = random(3);
ballYVelocity = random(3);


}

void draw() {

clear();
fill(50);
ellipse(ballX, ballY, 20, 20);


//Lets draw paddles now
fill(50, 60, 52)
rect(paddleOneX, paddleOneY, 10, 40);
rect(paddleTwoX, paddleTwoY, 10, 40);

//Lets move the ball!
ballX += ballXVelocity;
ballY += ballYVelocity;

}
