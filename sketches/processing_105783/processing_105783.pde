

float xPos2;  //X PO\osition
float yPos2;  //Y Position
float speed;  //speed on x
float radius2;  //radius
float speedy;   //speed on y
float x1;
float y1;
float x2;
float y2;
int score2;
int score1;
PFont score;
boolean gameStart;

void setup() {
  size(1000, 500);

  gameStart=true;
  xPos2=width/2; //initial x postion
  yPos2=height/2;  // initial y position
  radius2=20; //defined radius
  speed=5;  //random speed for x
  speedy=5;  //random speed for y
  ellipse(xPos2, yPos2, radius2, radius2); //set ellipse
  x1=50;
  y1=200;
  x2=950;
  y2=200;
  score2=0;
  score1=0;
  textMode(CENTER);
  score=loadFont("LetterGothicStd-Slanted-150.vlw");
}

void draw() {
  background(255);
  fill(0);
  line(width/2, 0, width/2, height);
  text(score1, width/4, 50);
  text(score2, width*.75, 50);
  if (score1>=10) {
    text("PLAYER 1 WINS!!!!", width/2, 50);
    score1=10;
  }
  if (score2>=10) {
    text("PLAYER 2 WINS!!!!", width/2, 50);
    score2=10;
  }
  if (score1>=10 || score2>=10) {
    text("PLAY AGAIN?", width/2, height/2);
  }
  //  if (score1>=10){
  //    gameStart=!gameStart;}
  //  if (score2>=10){
  //    gameStart=!gameStart;}
  //  if (gameStart==false){
  //    fill(255);
  //    rect(width/2,height/2,100,50);
  //    text("Play Again?",width/2+100,height/2+50);}
  rect(x1, y1, 20, 60);
  if (keyPressed) {
    if (keyCode==UP) {
      y1=y1-10;
    }
    if (keyCode==DOWN) {
      y1=y1+10;
    }
  }
  if (y1<0) {
    y1=0;
  }
  if (y1>height-60) {
    y1=height-60;
  }
  rect(x2, y2, 20, 60);
  if (mouseY>y2) {
    y2=y2+10;
  }
  if (mouseY<y2) {
    y2=y2-10;
  }
  if (y2<0) {
    y2=0;
  }
  if (y2>height-60) {
    y2=height-60;
  }
  fill(255, 0, 0);
  ellipse(xPos2, yPos2, radius2, radius2);
  xPos2=xPos2+speed;
  if (yPos2<y1+70 && yPos2>y1-10 && xPos2-20>x1+5 && xPos2-20<x1+35) {
    speed=speed*-1;
  }

  if (yPos2<y2+70 && yPos2>y2-10 && xPos2+20<x2+10 && xPos2+20>x2-10) {
    speed=speed*-1;
  }

  if (xPos2>=width-radius2/2) {    //ball bounces off right wall
    xPos2=width/2;
    yPos2=height/2;
    score1=score1+1;
  }
  if (xPos2<=0+radius2/2) {  //ball bounces off left wall
    score2=score2+1;
    xPos2=width/2;
    yPos2=height/2;
  }
  yPos2=yPos2+speedy;    //ball bounces off bottom
  if (yPos2>=height-radius2/2) {
    speedy=speedy*-1;
  }
  if (yPos2<=0+radius2/2) {   //ball bounces off top
    speedy=speedy*-1;
  }
  if (gameStart==false) {
    score2=0;
    score1=0;
  }
  if (score1==0 || score2==0){
    gameStart= true;}
}

void mousePressed() {
  if (mouseX>width/2-100 && mouseX<width/2+100 && mouseY>height/2-100 && mouseY<height/2+100 && score1>=10 || score2>=10) {
    gameStart=!gameStart;
  }
}




