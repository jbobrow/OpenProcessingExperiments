
int circleX=200;
int circleY=200;
int circleW=20;
int speedX=10;
int speedY=2;


void setup() {
  size(400, 400);
}

void draw() {
  background(201, 126, 100);
  circleX=circleX-speedX;
  circleY=circleY-speedY;
  stroke(255);
  line(300, 75, 300, 325);
  noStroke();

  


  fill(9, 198, 125);
  ellipse(circleX, circleY, circleW, circleW);

  if (circleX<0+10) {
    speedX=-speedX;
  }

  if (circleX>400-10) {
    speedX=-speedX;
    //    circleW=circleW*2;
  }

  if (circleY<0+10) {
    speedY=-speedY;
  }

  if (circleY>400-10) {
    speedY=-speedY;
  }

  if (circleX>300) {
  } 
  else {
  }

  if ((circleY>75)&&(circleY<325)) {
    if (circleX+10>300) {
      speedX=-speedX;
    }
  }

  //  if (circleX<300) {
  //  } 
  //  else {
  //  }
  //
  //  if((circleY>75)&&(circleY<325)){
  //    if(circleX-10<300){
  //    speedX=-speedX;
  //    }
  //  }
}
