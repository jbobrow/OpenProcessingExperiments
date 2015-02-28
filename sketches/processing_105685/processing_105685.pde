
//bouncing ball using if between up/down edges and paddles
//changing number change if balls hit the padlles
//paddles one control with mouse(using mouseClick) keyboard(keyCODE UP/DOWN)
//line in the center

float ballX;
float ballY;
int leftN;
int rightN;
int speed1;
int speed2;
float paddle1;
float paddle2;

void setup() {
  size(800, 600);
  leftN = 0;
  rightN = 0;
  ballX=random(0, width);
  ballY=random(0, height);
  speed1 =3;
  speed2 =3;
  rectMode(CENTER);
  paddle1=height/2;
  paddle2=height/2;
  textAlign(CENTER);
}

void draw() {
  background(20, 20, 150);
  strokeWeight(3);//line stroke
  stroke(255);
  line(width/2, 0, width/2, height);//line

  //score
  //textFont("font.vlw");
  textSize(50);
  text(leftN, width/4, 50);
  text(rightN, width/4*3, 50);

  //ball
  ballX+=speed1;
  ballY+=speed2;
  if ((ballY <= 5) ||(ballY >= height - 5)) {
    speed2 = -speed2;
  }
  if (ballY <0 ) {
    ballY=0;
  }

  //paddle left
  if ((ballY >= paddle1-35)&&(ballY<=paddle1+35) && (ballX>=90) && (ballX<=110)) {
    speed1 = -speed1;

  
  }
  //paddle right
  if ((ballY >= paddle2-35)&&(ballY<=paddle2+35)&&(ballX>=690)&&(ballX<=706))
  {
    speed1 = -speed1;
    println("right");
  }
  if (ballY>= height-5) {
    ballY=height-5;
  }


  //ball
  fill(170, 185, 0);
  noStroke();
  rect(ballX, ballY, 10, 10);

if((mousePressed)&&(ballX>width+100)){
leftN++;
ballX=width/2;
ballY=height/2;

}

if((ballX<-10)||ballX>810){
textSize(30);
  text("Click to try again",width/2,height/2);

}

if((mousePressed)&&(ballX<-50)){
rightN++;
ballX=width/2;
ballY=height/2;
}


  //paddle
  if (keyPressed) {
    if (key==CODED) {
      if (keyCode==UP) {
        paddle1=paddle1-10;
      }
      if (keyCode==DOWN) {
        paddle1=paddle1+10;
      }
    }
  }
  paddle2=mouseY;
  rect(100, paddle1, 10, 60);
  rect(width-100, paddle2, 10, 60);
}

