
// global variables, able to be used in all functions
int ballX; // x-location of the ball
int ballY; // y-location of the ball
int ballSpeedX = 6; // speed of the ball horizontally
int ballSpeedY = 6; // speed of the ball vertically
int paddleHeight = 10; // height of the paddle
int paddleColor; // color of the paddle
int value=50; //declares variable
void setup() {
size(500, 500); // canvas size
noCursor(); // hides the mouse
ballX = random(0,width); // spawns ball randomly for the width
ballY = random(0,height); //  spawns ball randomly for the height
}

void draw() {
fill(value);
ellipse();
if (!mousePressed) {
ellipse((random(0,700), random(0,600), 40, 40)); 
fill(random(255), random(255), random(255)); //Randomize color
}
background(125); // resets the background
moveBall(); // ball moves in X and Y directions
checkCollide(); // checks for collision with walls or paddle
drawPaddle(); // re-draws paddle
drawBall(); // re-draws ball 
}

void moveBall() {
ballX = ballX + ballSpeedX; // updates ball location horizontally
ballY = ballY + ballSpeedY; // updates ball location vertically

// monitor speed/direction of ball
println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY); 
}

void checkCollide() {
// left/right edge
if (ballX < 0 || ballX > width) {
ballSpeedX = ballSpeedX * -1; // switch X direction
}

// top edge
if (ballY < 0) {
ballSpeedY = ballSpeedY * -1; // switch Y direction
}

// paddle
if (ballY > height-paddleHeight) { // past 'goal line'
if (ballX > mouseX && ballX < mouseX + 200) { // within paddle
ballSpeedY = ballSpeedY * -1; // switch Y direction
} else { // end game
text("GAME OVER!", width/2, height/2);
noLoop();
}
}
}

void drawBall() {
noStroke();
ellipse(ballX, ballY, 20, 20);
}

void drawPaddle() {
stroke(paddleColor); // color of paddle border
strokeWeight(4); // border thickness of 4px

// y-value is always at the bottom, minus height of paddle, minus border of paddle
rect(mouseX, height-paddleHeight-4, 200, paddleHeight);
}

void mousePressed() {
// takes the values of mouseX between 0 and width and scales between 0-255
paddleColor = int((map(mouseX, 0, width, 0, 255)));
}

void keyPressed() {
// changes ball/paddle to black/white
if (key == 'b' || key == 'B') {
fill(0);
}
if (key == 'w' || key == 'W') {
fill(255);
}
}

