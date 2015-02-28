
// JC Wu
// 10-14-11

// global vars
int dudeX=200;
int dudeY=200;
int ballX=400;
int ballY=-100;
int ballVY=3;
int ball2X=100;
int ball2Y=-100;
int ball2VY=5;
int ball3X=300;
int ball3Y=-100;
int ball3VY=2;
int ball4X=200;
int ball4Y=-100;
int ball4VY=4;
int ball5X=450;
int ball5Y=-100;
int ball5VY=6;
int ufoX=0;
int ufoY=200;
int ufoVX=4;

void setup(){
  size(500,500);
  frameRate(30);
}

void draw(){
  background(#000000);
  ufo();
  dude();
  ball();
  ball2();
  ball3();
  ball4();
  ball5();
}

void ufo(){
    // draw a sun
  noStroke();
  fill(#EDD91D);
  ellipse(500,10,200,200);
  // moon 
  fill(#BBBBBB);
  ellipse(40,50,70,70);
  stroke(1);
  fill(#BBBBBB);
  ellipse(50,60,15,15);
  ellipse(20,35,12,12);
  ellipse(55,35,10,10);
  ellipse(25,65,8,8);
  //stars
  noStroke();
  fill(#FFFFFF);
  ellipse(90,80,15,15);
  ellipse(150,120,10,10);
  ellipse(70,20,10,10);
  ellipse(150,100,15,15);
  ellipse(190,60,15,15);
  ellipse(240,170,10,10);
  ellipse(300,200,10,10);
  ellipse(50,160,15,15);
  ellipse(220,250,15,15);
  ellipse(360,200,15,15);
  ellipse(420,160,10,10);
  ellipse(350,40,10,10);
  // Saturn
  fill(#AF7E1C);
  ellipse(300,100,160,80);
  stroke(#000000);
  strokeWeight(1);
  ellipse(300,100,150,78);
  fill(#000000);
  ellipse(300,100,124,70);
  fill(#E3A425);
  ellipse(300,97,77,77);
  //motion
  ufoX=ufoX+ufoVX;
  // right to left wrap
  if(ufoX>600){
    ufoX=-100;
    ufoVX= 3+(int)random(6);
    ufoY=5+(int)random(400);
  }
  fill(#898282);
  ellipse(ufoX,ufoY,80,40);
  fill(#0E08CE);
  ellipse(ufoX,ufoY-10,45,30);
}
// draw the yellow dude
void dude(){
  // attach to mouse
  dudeY=mouseY;
  dudeX=mouseX;
  // helperbox
  stroke(#FFFFFF);
  fill(#000000);
  rect(dudeX-50,dudeY-120,100,120);
  // dude
  stroke(#000000);
  strokeWeight(3);
  fill(#20D8E0);
  ellipse(dudeX,dudeY-50,96,99);
  stroke(#000000);
  fill(#E3C040);
  ellipse(dudeX,dudeY-93,50,50);
  strokeWeight(4);
  line(dudeX,dudeY-2,dudeX,dudeY-68);
  fill(#000000);
  ellipse(dudeX-5,dudeY-10,5,5);
  ellipse(dudeX-5,dudeY-30,5,5);
  ellipse(dudeX-5,dudeY-50,5,5);
  //eyes
  strokeWeight(2);
  fill(#FFFFFF);
  ellipse(dudeX-10,dudeY-100,10,20);
  ellipse(dudeX+10,dudeY-100,10,20);
  fill(#000000);
  ellipse(dudeX-10,dudeY-105,4,4);
  ellipse(dudeX+10,dudeY-105,4,4);
  fill(#FFFFFF);
  ellipse(dudeX,dudeY-83,10,20);
}

// drawing the balls
void ball(){
  //motion
  ballY=ballY+ballVY;
  //bottom to top wrap
  if(ballY>550){
    ballY=-50;
    ballVY=5+(int)random(3);
    ballX=(int)random(500);
  }
  noStroke();
  fill(#00FF00);
  ellipse(ballX,ballY,30,30);
}

void ball2(){
  //motion
  ball2Y=ball2Y+ball2VY;
  //bottom to top wrap
  if(ball2Y>520){
    ball2Y=-20;
    ball2VY=5+(int)random(8);
    ball2X=3+(int)random(400);
  }
  fill(#FF0000);
  ellipse(ball2X-100,ball2Y,30,30);
}

void ball3(){
  //motion
  ball3Y=ball3Y+ball3VY;
  // bottom-top wrap
  if(ball3Y>530){
    ball3Y=-30;
    ball3VY=2+(int)random(6);
    ball3X=5+(int)random(300);
  }
  fill(#0000FF);
  ellipse(ball3X,ball3Y,30,30);
}

void ball4(){
  //motion
  ball4Y=ball4Y+ball4VY;
  //bottom-top wrap
  if(ball4Y>530){
    ball4Y=-30;
    ball4VY=4+(int)random(4);
    ball4X=6+(int)random(123);
  }
  fill(#ED960A);
  ellipse(ball4X,ball4Y,30,30);
}

void ball5(){
  //motion
  ball5Y=ball5Y+ball5VY;
  //bottom-top wrap
  if(ball5Y>540){
    ball5Y=-40;
    ball5VY=2+(int)random(9);
    ball5X=(int)random(450);
  }
  fill(#6F0B8E);
  ellipse(ball5X,ball5Y,30,30);
}
  


