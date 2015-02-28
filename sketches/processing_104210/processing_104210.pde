
int ballX = 27;
int ballY = 485;
int ballwidth = 38;
int SpeedX = 15;
int SpeedY = 12;

int ballx2=17;
int bally2=34;
int speedx2= 75;
int speedy2= 75; 

int paddleheight=22;
int paddlelength=200;
int paddlex= 250;
int paddley= 850-paddleheight;


void setup(){
  size (600, 850);
  background (0, 0, 255);
}

void draw(){
  //background (0, 0, 255);

rect (mouseX, mouseY, 200, 22);
fill(78, 9, 43);
 ball1();
 ball2();
}

void ball1(){
  //This updates the speed
  ballX= ballX+SpeedX;
  ballY= ballY+SpeedY;
  println(ballY);
  println(ballX);
  
  //this draws the ball
  ellipse(ballX, ballY, ballwidth, ballwidth);
  fill(255, 0, 255);
  //these are the collisions
  if (ballX>width || ballX<0) {
    SpeedX=SpeedX*-1;
  }

  if (ballY>height || ballY<0){
    SpeedY=SpeedY*-1;
  } 
  

}

void ball2(){
  ballx2= ballx2+speedx2;
  println(ballx2);
  ellipse(ballx2, bally2, ballwidth, ballwidth);

if (ballx2>width || ballx2<0) {
  speedx2=speedx2*-1;
}

  if (bally2>height || bally2<0){
  speedy2=speedy2*-1;
  } 
  bally2= bally2+speedy2;
  println(bally2);
}





