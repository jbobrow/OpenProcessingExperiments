
float intBallX=random(10,590);
float intBallY=random(10,590);
float intBallDX=1;
float intBallDY=1;

void setup() {
  size(600,600);
}

void draw() {
  background(0);
  // DRAW BALL
  fill(0,255,0);
  ellipse(intBallX,intBallY,10,10);
  // MOVE BALL
  intBallX+=intBallDX;
  intBallY+=intBallDY;
  // BOUNCE BALL OFF WALLS
  if ((intBallX>595) || (intBallX<5)) {
     intBallDX=intBallDX*-1;
  }
  if ((intBallY>595) || (intBallY<5)) {
     intBallDY=intBallDY*-1;
  }
  //if (((intBallX>(mouseX+25)) || (intBallX<(mouseX-25))) && ((intBallY>(mouseY+25)) || (intBallY<(mouseY-25)))) {
  //   intBallDX=intBallDX*-1;
  //   intBallDY=intBallDY*-1;
  //}
  //if ((intBallY>595) || (intBallY<5)) {
  //   intBallDY=intBallDY*-1;
  //}
  //if ((intBallX<mouseX+10) && (intBallX>mouseY-10) && (intBallY<mouseY+10) && (intBallY>mouseY-10)) {
  //   intBallDX=intBallDX*-1;
  //   intBallDY=intBallDY*-1;
  //}
  
  // DRAW PADDLE
  fill(255);
  ellipse(mouseX,mouseY,20,20);

}

void mousePressed() {
  // CHANGE SPEED AND DIRECTION
  intBallDX=random(-5,5);
  intBallDY=random(-5,5);
}


