
boolean toRight = true;

int ballX = 200;

+int ballY = 150;

int scoreL = 0;
int scoreR = 0;

int ballXVelocity = 0;

int ballYVelocity = 0;



int paddleOneX = 10;

int paddleOneY = 150;



int paddleTwoX = 400 - 10;

int paddleTwoY = 150;



void setup() {


size(400, 300);
background(200);




ballXVelocity = random(3);

ballYVelocity = random(3);



}



void draw() {



if (ballY <= 0) {
    ballYVelocity *= -1;

}
if (ballY >= 300) {
    ballYVelocity *= -1;
}

if (ballX <= 0) {
    scoreR += 1;
    ballX = 200;
    ballY = 150;
}
if (ballX >= 400) {
    scoreL += 1;
    ballX = 200;
    ballY = 150;

}
if (toRight &&
ballX >= paddleTwoX-10 &&
ballY >= paddleTwoY &&
ballY <= paddleTwoY+40) {
    ballXVelocity *= -1;
    toRight = false;

}



background(0);

fill(50);



ellipse(ballX, ballY, 20, 20);



fill(50, 20, 150);


rect(paddleOneX, paddleOneY, 10, 40);

rect(paddleTwoX, paddleTwoY, 10, 40);



ballX += ballXVelocity;

ballY += ballYVelocity;



}

void keyPressed() {

if (key == CODED) {

    if(keyCode == UP) {
        paddleTwoY -= 5;
    }
    if(keyCode == DOWN) {
        paddleTwoY += 5;
    }
}
else{
    if(key == 'w') {
        paddleOneY -= 5;
    }
    if (key == 's') {
        paddleOneY += 5;
    }
}

}
