
int ballX = 200;
int ballY = 150;

int ballXVelocity = 0;
int ballYVelocity = 0;

int paddleOneX = 10; // We want to move the paddle away from the edge
int paddleOneY = 130;

int paddleTwoX = 385;
int paddleTwoY = 125;

void setup() {
size(400, 300);

rect(200, 150, 10, 40);

ballXVelocity = random(6)-random(6);
ballYVelocity = random(6)-random(6);

}

void draw() {

background(100);
rect(197.5, 0, 5, 400);
stroke(255);
strokeWeight(5)
noFill();
ellipse(200, 150, 75, 75);
noStroke(); //remember to add stroke(); again if you want to have an outline on another thing.
fill(255);
ellipse(ballX, ballY, 20, 20);


if ((ballX > 400) || (ballX < 0) || (ballY > 300) || (ballY < 0)) {
//Lets move the ball!
    ballX = 200
    ballY = 150
    ballXVelocity = random(6)-3;
    ballYVelocity = random(6)-3;
    }
    
ballX += ballXVelocity;
ballY += ballYVelocity;

//Lets draw paddles now

fill(255);

if ((ballX < 201)&&(ballY < 300)&&(ballY > 0)) {  
    paddleOneY = ballY - 25;
    }
else if (paddleOneY > 100) {
paddleOneY -= 5;
    }     
else if (paddleOneY < 150) {
paddleOneY += 5;
}

 rect(paddleOneX, paddleOneY, 5, 50);

 rect(paddleTwoX, paddleTwoY, 5, 50);




}

//Is a key on the keyboard pressed?
void keyPressed() {

// here we check if the key pressed is a "coded" key
if (key == CODED) {
    // checking if we press the UParrow
    if(keyCode == UP) {
        paddleTwoY -=   5; //change position by 5 pixels
    }
    // DOWN arrow   
    if(keyCode == DOWN) {
        paddleTwoY  += 5;
    }
}

}



