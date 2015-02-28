
int numBalls = 20;
boolean buttonOn = false;
Ball[] ball = new Ball[500];
void setup()
{
 size(600, 600);
 background(104,53,115);
 smooth();
 ellipseMode(RADIUS);
 for (int i=0;i<(numBalls+1);i++) {
    ball[i] = new Ball();
    ball[i].createBall();
 }
}
void draw()
{
 if (buttonOn == true){
    background(104,53,115);
 }
 if (buttonOn == true) {
    fill(0, 255, 0); // green square (on)
    rect(width/2, height/2, 50, 50);
   
    for (int i=0;i<(numBalls+1);i++) {
     ball[i].moveBall();
    }
 } else if (buttonOn == false) {
    fill(255,0,0); // red square (off)
    rect(width/2, height/2, 50, 50);
 }
}
void mousePressed() {
 if (mouseX > (width/2) && mouseX < ((width/2)+50) &&
    mouseY > (height/2) && mouseY < ((height/2)+50)) {
    if (buttonOn == true) {
     buttonOn = false;
    }
    else if (buttonOn == false) {
     buttonOn = true;
    }
 }
}
/**************************************************************/
class Ball
{
 int rad = 20;
 float xPos = random(width);
 float yPos = random(height);
 float xSpeed = random(5);
 float ySpeed = random(5);
 int xDirection = 1;
 int yDirection = 1;
 Ball() {
 }
 void createBall() {
    fill(32,50,210);
    ellipse(xPos, yPos, rad, rad);
 }
 void moveBall() {
    xPos = xPos + ( xSpeed * xDirection );
    yPos = yPos + ( ySpeed * yDirection );
    if (xPos > width-rad || xPos < rad) {
     xDirection *= -1;
    }
    if (yPos > height-rad || yPos < rad) {
     yDirection *= -1;
    }
   
    fill(32,50,210);
    ellipse(xPos, yPos, rad, rad);
 }
}

