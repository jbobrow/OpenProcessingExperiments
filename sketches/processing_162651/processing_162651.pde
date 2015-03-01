
float posX=400;
float posY=100;
float w=20;
float h=20;
float speedX=4;
float speedY=4;
float ballRadius=10;

float paddX=495;
float paddY;
float paddW=10;
float paddH=60;

int recX=0;

void setup() {
  size(500, 400);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw() {
  background(0);

  //approaching color bar
  for (int recY=0; recY<height+20; recY=recY+40) {
    fill(random(255));
    rect(recX, recY, 20, 40);
  }

  //paddle moving with mouseY
  fill(255);
  paddY=mouseY;
  rect(paddX, paddY, paddW, paddH);

  //bouncing ball
  drawBall();
  moveBall();
  bounceBall();
  
  //game over
  if(recX+10>=width){
    background(0);
    fill(255);
    textSize(50);
    text("YOU LOSE",125,180);
  }

  //let mouse cursor disapear
  if (mouseX<width && mouseX>0 && mouseY<height && mouseY>0) {
    noCursor();
  }
}

void drawBall() {
  fill(254, 255, 5);
  noStroke();
  ellipse( posX, posY, w, h);
}

void moveBall() {
  posX=posX-speedX;
  posY=posY-speedY;
}

void bounceBall() {
  //reverse the direction when hit the bar
  if(posX-10<recX+10){    
    speedX=speedX*-1;
    recX=recX-90;
    background(random(255), random(255), random(255));
  }else{
    recX=recX+1;
  }
  
  //reverse the direction when hit the wall
  if ((posY-ballRadius<0) || (posY+ballRadius>height)) {
    speedY=speedY*-1;
  }


  //ball hits the paddle
  if ((posX+ballRadius>width-paddW)&&(posX+ballRadius<width)&&(posY+ballRadius>paddY-paddH/2)&&(posY-ballRadius<paddY+paddH/2)) {
    speedX=speedX*-1;
  }
}

void mousePressed() {
  posX=470;
  posY=mouseY;
  recX=0;
  speedX=speedX*-1;
} 



