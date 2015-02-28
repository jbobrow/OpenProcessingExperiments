
Player player= new Player();
boolean gameOver = false;
PImage helicopter;
float[] landHeights = new float[0];
float landSegmentWidth = 5;
float currentHeight = 500;
int score = 0;
 
 
void setup() {
  size(600, 400);
  helicopter=loadImage("helicopter.png");
  imageMode(CENTER);
}
 
void draw() {
  background(0);
  fill(46, 209, 36);
 
 
 
  if (gameOver == true) {
    fill(0);
    background(255);
    text("GAME OVER", 100, 100);
    text("SCORE:  "+frameRate, 100, 120);
    text("pres 'r' to restart", 300,110);
    noLoop();
  }
  else {
 
    if (landHeights.length>0) {
      landHeights = subset(landHeights, 1);
    }
    while (landHeights.length<width/landSegmentWidth) {
      landHeights = append(landHeights, currentHeight);
      currentHeight+=random(-6, 5.75);
      if (currentHeight>height) {
        currentHeight = height;
      }
      else if (currentHeight<220) {
        currentHeight = 220;
      }
    }
 
 
    player.yVel *=0.96;
    if ((keyPressed) && (key==' ')) {
 
      player.yVel-=0.5;
    }
    else {
 
      player.yVel+=0.1;
    }
 
    player.y+=player.yVel;
 
    if (player.y>landHeights[13]||player.y<height-landHeights[13]) {
      gameOver = true;
    }
  }
  player.draw();
  noStroke();
  for (int i = 0; i< landHeights.length; i++) {
    rect(i*landSegmentWidth, landHeights[i], landSegmentWidth, height);
    rect(i*landSegmentWidth, 0, landSegmentWidth, height-landHeights[i]);
  }
 
  score++;
  fill(255);
  text("Score: " + score/2, 0, 50);
}
 
void mousePressed() {
  if (gameOver) {
  }
}
 
class Player {
  float x;
  float y;
  float yVel;
 
  Player() {
    x = 60;
    y = 150;
    yVel = 0;
  }
 
  void draw() {
 
    image(helicopter, x, y, helicopter.width/4, helicopter.height/4);
    if (gameOver == true) {
      fill(255);
      background(0);
 
      text("GAME OVER", 100, 195);
      text("SCORE:  "+score/2, 100, 210);
      text("pres 'r' to restart", 300,200);
      noLoop();
    }
  }
}
 
 
void reset()
{
  loop();
  score = 0;
  gameOver=false;
 
  player.x = 60;
  player.y = 150;
  player.yVel = 0;
 
  currentHeight = 500;
  landHeights = new float[0];
}
 
void keyPressed()
{
  if (key == 'r')
  {
    reset();
      
  }
}

