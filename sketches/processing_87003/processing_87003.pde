
// variables for the screen and buttons
int rbx= 100;
int bbx = 150;
int gbx = 200;
int by = 500;
int bh = 30;

//variables for the speed and fucntion of the red button ball
int speedX=1;
int speedY=1;
int ballX=250;
int ballY=300;

int rButton=-1;
int bButton=-1;
int gButton= -1;
int rColor=255;
int bColor=254;
int gColor=255;


int[] xpos = new int[50]; 
int[] ypos = new int[50];


void setup() {
  size(800, 600);


  smooth();
  for (int i=0; i < xpos.length; i++) {
    xpos[i] = 0;
    ypos[i] = 0;
  }
}

void draw () {
  background(100);
  cPannelDisplay();
  screenDisplay();
  if (rButton == 1) {
    snakeMove();
  }
}

void screenDisplay() {
  fill(120);
  rect(340, 450, 120, 20);
  fill(150);
  rect(380, 400, 40, 50);
  rect(90, 90, 620, 320);
  fill(0);
  rect(100, 100, 600, 300);
}

void cPannelDisplay() {
  fill(120);
  rect(90, 490, 150, 50);
  fill(255, 0, 0);
  rect(rbx, by, bh, bh);
  fill(0, 0, 255);
  rect(bbx, by, bh, bh);
  fill(0, 255, 0);
  rect(gbx, by, bh, bh);
}

void snakeMove() {
  for (int i = 0; i < xpos.length-1; i ++ ) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }

  xpos[xpos.length-1] = ballX; 
  ypos[ypos.length-1] = ballY;

  ballX= ballX+speedX;
  ballY= ballY+speedY;

  if (ballX > 675 || ballX < 125) {
    speedX=speedX*-1;
  }

  if (ballY > 375 || ballY < 125) {
    speedY=speedY*-1;
  }


  for (int i = 0; i < xpos.length; i ++ ) {
    noStroke();
    fill(rColor, gColor, bColor);
    ellipse(xpos[i], ypos[i], i, i);
    stroke(1);
    if (bButton==1) {
      bColor = int(225*sin(i/2)+125);
    } 
    if (gButton == 1 ) {
      gColor = int(random(1, 255));
    }

    noStroke();
    ellipse(ballX, ballY, 20, 20);
    stroke(1);
  }
}

void mousePressed() { 
  if (mouseX < rbx+bh && mouseX > rbx && mouseY > by && mouseY < by+bh) {
    println("The Red button has been pressed");
    rButton= rButton*-1;
  } 


  if (mouseX < bbx+bh && mouseX > bbx && mouseY > by && mouseY < by+bh) {
    println("The Blue button has been pressed");
    bButton= bButton*-1;
  } 


  if (mouseX < gbx+bh && mouseX > gbx && mouseY > by && mouseY < by+bh) {
    println("The Green button has been pressed");
    gButton = gButton*-1;
  }
}



