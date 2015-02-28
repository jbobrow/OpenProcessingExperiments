
// Ball properties
float ballX = 256;
float ballY = 256;

float ballAccel = 0.1;
float ballVelX = 0;
float ballVelY = 0;

float ballDiam = 50;
color ballColor = color(0, 255, 255);

int score = 0;

void setup(){
    size(512, 512);
    background(0);
}

void draw(){
    if(checkGameOver())
    {
        showGameOver();
        return; // do not execute any code after this line
    }

    score++;
    updateBall();
    moveBall();
    drawBall();
}

void showGameOver()
{
    // Comment Here
    fill(0, 10);
    rect(0, 0, width, height);

    // set text properties
    textAlign(CENTER, CENTER);
    fill(255, 0, 0);
    textSize(64);

    text("Score: " + score, 256, 150);
    text("Game Over!", 256, 256);

    textSize(32);
    text("Press Space to play again.", 256, 300);
    checkRestart();
}

void checkRestart()
{
    // restart the game if the space bar was pressed.
    if(keyPressed && key == ' ')
    {
        ballX = 256;
        ballY = 256;

        ballVelX = 0;
        ballVelY = 0;

        score = 0;

        clear();
    }
}

boolean checkGameOver()
{
    if(ballX > 512) return true;
    if(ballX < 0) return true;
    if(ballY > 512) return true;
    if(ballY < 0) return true;

    return false;
}

void updateBall()
{
    // horizontal movement
    if(ballX > mouseX)
    {
        ballVelX = ballVelX + ballAccel;
    }
    if(ballY < mouseX)
    {
        ballVelX = ballVelX - ballAccel;
    }

    // vertical movement
    if(ballY > mouseY)
    {
        ballVelY = ballVelY + ballAccel;
    }
    if(ballY < mouseY)
    {
        ballVelY = ballVelY - ballAccel;
    }
}

void moveBall()
{
    ballX += ballVelX;
    ballY += ballVelY;
}

// Draw our Ball at the specified x and y position
void drawBall()
{
    ballColor = color(0, random(255), random(255));
    noStroke();
    fill(ballColor);
    ellipse(ballX, ballY, ballDiam, ballDiam);
}
