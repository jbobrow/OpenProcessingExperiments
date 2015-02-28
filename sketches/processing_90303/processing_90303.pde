
//Code from Hunter Bolin
int ball;
int above;
int value = 0;
int counter=0;
int[] xpos=new int[150]; 
int[] ypos=new int[150];
float playerPosX, playerPosY;
int moveRIGHT;
int moveLEFT;
boolean dead = false;
PImage Win;
PImage underwater;
PImage Lose;
PImage Submarine;
 
void setup() {
  dead= false;
  background(50);
   
  underwater= loadImage("underwater.jpg");
  Submarine=loadImage("Submarine.jpg");
  Lose=loadImage("Lose.jpg");
  Win=loadImage("Win.jpg");
  smooth();
  size(600, 600);
  playerPosX = 100;
  playerPosY= 500;
  //frameRate(60);
   
 
  for (int i = 0; i < 150; i = i+1) {
    int ball =int(random(0, 600));
    int above=int(random(-3000, -50));
    xpos[i]=ball;
    ypos[i]=above;
     
  }
}
void draw() {
  image(underwater, 0, 0);
  counter+=1;
  
  if (dead) {
        image(Lose, 0, 0);
        counter = 0;
      }
      if (counter>900) {
        image(Win,0,0);
      }
  if (!dead) {
    for (int i = 0; i < 150; i = i+1) {
      fill(random(255),random(255),random(255));
      ellipse(xpos[i], ypos[i], 30, 30);
      ypos[i]+=3;
      if (counter>700) {
        ypos[i]+=4;
      }
      if (xpos[i]<playerPosX+35 && xpos[i]>playerPosX-35 && ypos[i]<playerPosY+35 && ypos[i]>playerPosY-35) {
        dead= true;
      }
    }
 
 
 
 
    if (playerPosX>=581) {
      moveRIGHT= 0;
    }
    if (playerPosX<=15) {
      moveLEFT= 0;
    }
  }
 
  rectMode(CENTER);
  rect (playerPosX, playerPosY, 30, 30);
  image(Submarine, playerPosX-16, playerPosY-16);
    if (moveRIGHT == 1) {
    playerPosX = playerPosX + 5;
  }
  if (moveLEFT == -1) {
    playerPosX = playerPosX - 5;
  }
  
}
void keyPressed()
{
  if (key == 'd')
  {
    moveRIGHT=1;
  }
  if  (key == 'a')
  {
    moveLEFT=-1;
  }
}
void keyReleased()
{
  if (key == 'd')
  {
    moveRIGHT= 0;
  }
  if (key == 'a')
  {
    moveLEFT= 0;
  }
}



