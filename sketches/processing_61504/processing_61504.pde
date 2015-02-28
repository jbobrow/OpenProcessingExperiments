
int ballx=300;
int bally=400;
int speed=5;
int velx=speed;
int vely=speed;
int score1=0;
int score2=0;
int rectlength=80;
double level=1;
float ballPos=200;
boolean started=false;

public void setup() {
  size(700,500);
  frameRate(60);
  PFont font = loadFont("Jokerman-Regular-48.vlw");
  PFont font2= loadFont("Ravie-48.vlw");
  textFont(font, 20);
  textFont(font, 15);
}

public void textSetUp() {
  PFont font = loadFont("Jokerman-Regular-48.vlw");
  PFont font2= loadFont("Ravie-48.vlw");
  fill(255);
  textFont(font, 50);
  text("Pong", 290,50);
  fill(255);
  rect(243,120,210,50);
  textFont(font2,35);
  fill(255,200,200);
  text("Easy",286,155);
  fill(255);
  rect(243,200,210,50);
  textFont(font2,35);
  fill(205,76,80);
  text("Medium",255,240);
  fill(255);
  rect(243,280,210,50);
  textFont(font2,35);
  fill(205,0,80);
  text("Hard",285,320);
}

public void paddleSetUp() {
  //setting up player paddle
  rect(690,mouseY, 10, rectlength);
  rectMode(CENTER);
  fill(255);
  noStroke();
 
  //setting up computer paddle
  rect(10,ballPos,10,80);
  rectMode(CENTER);
  fill(255);
  noStroke();
  if(bally<ballPos) {
    ballPos-=level;
  }
  if(bally>ballPos) {
    ballPos+=level;
  }
}

public void draw() {
  
  if(started==false) {
  background(0);
  textSetUp();
    if(mousePressed && mouseY< 170 && mouseY >115 && mouseX< 455 && mouseX>240){
      level=4.7;
      speed=5;
      started=true;
    }else if(mousePressed && mouseY<250 && mouseY> 200 && mouseX< 455 && mouseX>240) {
      level=7.6;
      speed=8;
      rectlength=60;
      started=true;
    }else if(mousePressed && mouseY<330&& mouseY> 280 && mouseX< 455 && mouseX>240) {
      level=10.8;
      speed=11;
      rectlength=45;
      started=true;
    }
}else {
   background(0);
   PFont font2= loadFont("Ravie-48.vlw");
   textFont(font2, 15);
   fill(255,255,255);
   text("computer:  " + score1, 80,20);
   text("player:  " + score2, 450,20);

  paddleSetUp(); 
  
  //creating and setting up the ball
  ballx+=velx;
  bally+=vely;
  ellipseMode(CENTER);
  ellipse(ballx, bally, 10, 10);
  noStroke();
  fill(255,255,255);
  
  //ball bouncing back from the top and bottom walls
  if(bally>=500)
  vely=-speed;
  if(bally<=0)
  vely = speed;
  
 //temporary for right and left walls 
 if(ballx>=700)
  velx=-speed;
  if(ballx<=0)
  velx=speed;
} 
}


