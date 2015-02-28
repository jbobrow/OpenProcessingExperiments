
int p1;
int p2;
int p1y;
int p2Y;


int ballX;
int ballY;
int ballSX;
int ballSY;

PFont Bemio;
int scoreL;
int scoreR;

void setup() {
  size(600, 400);
  colorMode(HSB, 255);
  background(255);
  Bemio = loadFont ("Bemio-50.vlw");


  ballX=int(random(0, width));
  ballY=int(random(0, height));
  ballSX=4;
  ballSY=5;
}

void draw() {
  background(255);
  fill(50);
  strokeWeight (1);
  line (300, 0, 300, 400);
  fill(30, 255, 255);


  //bouncing ball
  if (ballY>height) {
    ballSY=-ballSY;
    println("hi");
  }

  if (ballY<0) {
    ballSY=-ballSY;
  }



  if (ballX>width) {
  ballSX=-ballSX;
}



ballX+=ballSX;
ballY+=ballSY;
ellipse(ballX, ballY, 25, 25);


//left condition
if (ballY>mouseY && ballY<mouseY+100 && ballX > 50 && ballX <80) {
  ballSX=-ballSX;
}
//left player
rect(50, mouseY, 20, 100);  


//right condition
if (ballY>UP && ballY<UP+100 && ballX < 530 && ballX >500) {
  ballSX=-ballSX;
}
//right player
rect(500, p2Y, 20, 100);

//score right
textFont(Bemio);
text (scoreR, 400, 50);
textSize(50);
if (ballX<0) {
  scoreR++;
  ballX =width/2;
}

//score left
textFont(Bemio);
text (scoreL, 200, 50);
textSize(50);
if (ballX>width) {
  scoreL++;
  ballX=width/2;
}

}
void keyPressed() {
  if (keyPressed) {
    if (key==CODED) {
      if (keyCode ==UP) {
        p2Y-=50;
      }

      if (keyCode ==DOWN) {
        p2Y+=50;
      }
    }
  }
}



