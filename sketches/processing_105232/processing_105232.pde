
float ballX;
float ballY;
float a=1.0*10.0;
boolean down=true;


void setup() {
  size(500, 500);
  background(255);
  ballX=width/2.0;
  ballY=height/2.0;
}

void draw() {
  background(255);
  ellipse(ballX, ballY, 20, 20);
  fill(0);

  ballX=height/2.0;

  if (ballY>=500) {
    down=false;
   
  }
  
  if (down) {
    ballY=ballY+a;
  } else {
    ballY=ballY-a;
  }
  
  if ((ballY<=0)||(ballY>500)){
  a=-a;
  }
  
 
}



