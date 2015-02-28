
float bSize = 30;                   //ball size
float r = bSize/2;
float startPosY = 20;
float endPosY = 500-(bSize/2);
float ballPosX, ballPosY;
float vY =.1;
float vX;
float friction1 = 0.8;             //the walls abosrb some engry of the ball
float friction2 = 0.01;            //the fraction of the bottom 
float resistance = 0.0001;         //the resistance of the air
float gravity =2;                  //a force direction down

void setup() {
  size(500, 500);
  vX = random(40);
  vY = random(-15, 60);
  ballPosY = height/2;
  ballPosX = width/2;
}

void draw() {
  background(255);

  // Up/Down Motion
  if ((ballPosY >= endPosY) && (vY > 0)) {                         //when the ball touches the bottom
    vY = -vY;                                                      //it flip to up
    vY = vY+friction1;                                             //the walls abosrb some engry of the ball
    ballPosY=endPosY;
  } 

  if ((ballPosY <= r) && (vY < 0)) {                              //do the same to the top
    vY = -vY; // flip to down
    vY = vY-friction1;
    ballPosY=r;
  }

  if (vY>0) {
    vY = vY - resistance + gravity;
  }

  if (vY<0) {
    vY = vY + resistance + gravity;
  }


//  println(ballPosY);
//  println(vY);


  // Left/Right Motion
  if ((ballPosX >= width-r) && (vX > 0)) {
    vX = -vX;
    vX = vX+friction1;
    ballPosX=width-r;
  } 
  if ((ballPosX <= r) && (vX < 0)) {
    vX = -vX;
    vX = vX-friction1;
    ballPosX=r;
  }


  if (vX>0) {
    vX = vX-friction2;
  }

  if (vX<0) {
    vX = vX+friction2;
  }



  ballPosY += vY;
  ballPosX += vX;
  fill(0);
  ellipse(ballPosX, ballPosY, bSize, bSize);
}

void mousePressed() {
  vX+=random(-30, 30);
  vY+=random(-30, 30);
}



