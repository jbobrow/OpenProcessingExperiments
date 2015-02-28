
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/70817*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
int ballX = 50;
int ballY = 50;

int speedX = 5;
int speedY = 3;

int paddle = 0;

int scoreC = 0;
int scoreM = 0;
int hit = 30;

void setup () {
  
  size (800, 400);
  smooth ();
  
}

void draw () {
  
 //background
 fill (255, 80);
 rect (0, 0, 800, 400);
 fill (0, 130);
 rect (0, 0, 800, 350);
 
 //ball
 fill (255);
 noStroke ();
 ellipse (ballX, ballY, 10, 10);
 ballX += speedX;
 ballY += speedY;
 
 if ((ballX > 790) || (ballX < 5)) {
   speedX *= -1;  
 }
 if ((ballY > 340) || (ballY < 5)) {
   speedY *= -1;
 }

 //paddles
 fill (255);
 //noStroke ();
 stroke (0);
 rect (790, mouseY, 5, 60);
 
 fill (255);
 //noStroke ();
 stroke (0);
 rect (5, paddle, 5, 60);
 
 //collisions
 if (speedX < 0) {
  paddle = ballY-hit;
 }
 
 //over
 if (mouseY > 290) {
    mouseY = 290;
  }
  if (mouseY < 0) {
    mouseY = 0;
  }
  if (paddle > 290) {
    paddle = 290;
  }
  if (paddle < 0) {
    paddle = 0;
  } 
  
 //count score
 if ((ballY > mouseY) && (ballY < mouseY+60) && (ballX == 790) && (speedX > 0)) {
   speedX *= -1;
   scoreM += 1;
 } 
 
 if ((ballY > paddle) && (ballY < paddle+60) && (ballX == 10) && (speedX < 0)) {
   speedX *= -1;
   scoreC += 1;
   hit = int(random (-10,80));
 }
  
 //score
 PFont font;
 font = loadFont ("Verdana-30.vlw");
 textFont (font, 30);
 fill (0);
 text ("Computer", 100, 385);
 fill (0);
 text (scoreC, 300, 385);
 fill (0);
 text ("Player", 500, 385);
 fill (0);
 text (scoreM, 700, 385);

}

