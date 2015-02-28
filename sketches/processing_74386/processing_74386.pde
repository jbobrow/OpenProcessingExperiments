
int c=100;
int xPos1= 20;
int xPos2= -300;
int dirX1= 5;
int dirY1= 0;
int d= 70;
int yPos1= 277;
int a=167;
int b=384;

void setup() {

  size(600, 500);
  noCursor();
}

void draw() {

  background(200);

  //campo da gioco
  strokeWeight(5);
  line(0, height/1.3, width, height/1.3);
  line(0, height/3, width, height/3);


  //ostacolo 1
  xPos1=xPos1+dirX1;
  fill(255);
  rect(xPos1, height/1.76, c, c);

  if (xPos1 > width) {
    xPos1=0;
  }

  //ostacolo 2
  xPos2=xPos2+dirX1;
  rect(xPos2, height/3, c, c);

  if (xPos2 > width) {
    xPos2=0;
  }

  //pallina
  fill(255, 0, 0);
  strokeWeight(2);
  ellipse(width/2, yPos1, d, d);

  yPos1 = yPos1 + dirY1;

  //top border
  if (yPos1 < height/3 + d/2) {
    yPos1=height/3 + d/2;
  }
  
  //bottom border
  if (yPos1 > b - d/2) {
    yPos1=b - d/2;
  }
}

void keyPressed() {

  if (keyCode == UP) {
    dirY1 = -4;
  } 
  if (keyCode == DOWN) {
    dirY1 = 4;
  }
}

void keyReleased() {
  dirY1 = 0;
}
