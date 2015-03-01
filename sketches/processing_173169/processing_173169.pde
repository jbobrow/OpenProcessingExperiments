
float ballX;
float ballY;
float ballSpeedX = 5;
float ballSpeedY = 5;
float paddleHeight = 30;
int paddleColor;
boolean activate=false;

void setup() {
size(800, 600);
noCursor();
ballX = width/2;
ballY = height/2;
}

void draw() {
background(128); //sets background to specific color(128)
moveBall();
checkCollide();
drawPaddle();
drawBall();
if (mousePressed)
  activate=true;
}

void moveBall() {
ballX = ballX + ballSpeedX;
ballY = ballY + ballSpeedY;
println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY);
}

void checkCollide() {
if (ballX < 0 || ballX > width) {
ballSpeedX = ballSpeedX * -1; //switch x dircetion
}
if (ballY < 0) {
ballSpeedY = ballSpeedY * -1.1; //ball speed increase by -1.1 each time it hits the top of the canvas //switch y direction
}
if (ballY > height-paddleHeight) {
if (ballX > mouseX && ballX < mouseX + 200) {
ballSpeedY = ballSpeedY * -1;
} else {
text("GAME OVER!", width/2, height/2); //Tells you that you’ve lost “GAME OVER”
noLoop();
}
}
}

void drawBall() { //moves ballX, ballY to certain location
noStroke();
ellipse(ballX, ballY, 20, 20);




}



void drawPaddle() {
stroke(paddleColor);

strokeWeight(4);
rect(mouseX, height-paddleHeight-4, 200, paddleHeight);



}

void mousePressed() {
paddleColor = int((map(mouseX, 0, width, 0, 255)));


}

void keyPressed() {
if (key == 'b' || key == 'B') {
fill(0);
}
if ((key == 'r' || key == 'r')&& activate) {
fill(random(0,255), random(0,255), random(0,255)); //randomly changes color of ball and paddle each time the key'r' is pressed.
}
}
