
int r;
int above;
int value = 0;
int counter=0;
int[] xpos=new int[150];  
int[] ypos=new int[150];
float playerPosX, playerPosY;
int moveRIGHT;
int moveLEFT;
boolean dead = false;
PImage octo;
PImage pirate;
PImage gameover;
PImage winner;

void setup() {
  dead= false;
  background(50);
  
  octo= loadImage("octopusTrial1.png");
  pirate=loadImage("pirateTrial1.png");
  gameover=loadImage("gameover.png");
  winner=loadImage("winner.png");
  smooth();
  size(600, 600);
  playerPosX = 100;
  playerPosY= 500;
  //frameRate(60);
  

  for (int i = 0; i < 150; i = i+1) {
    int r =int(random(0, 600));
    int above=int(random(-3000, -50));
    xpos[i]=r;
    ypos[i]=above;
    
  }
}
void draw() {
  //background(50);
  image(octo, 0, 0);
  counter+=1;
  // xpos[0]+=1;
  // ypos[0]+=1; 
  if (dead) {
        image(gameover, 0, 0);
        counter = 0;
      }
      if (counter>900) {
        image(winner,0,0);
      }
  if (!dead) {
    for (int i = 0; i < 150; i = i+1) {
      fill(40,250,20);
      ellipse(xpos[i], ypos[i], 50, 50);
      ypos[i]+=3;
      if (counter>700) {
        ypos[i]+=4;
      }
      if (xpos[i]<playerPosX+35 && xpos[i]>playerPosX-35 && ypos[i]<playerPosY+35 && ypos[i]>playerPosY-35) {
        //ellipse(50, 50, 500, 500);   
        //textSize(90);
        // fill(0, 0, 250);
        // text("GAME OVER", 50, 300);
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
  image(pirate, playerPosX-16, playerPosY-16);
  // fill(60, 60, 180);
  if (moveRIGHT == 1) {
    playerPosX = playerPosX + 5;
  }
  if (moveLEFT == -1) {
    playerPosX = playerPosX - 5;
  }
  //fill(0,250,0);
  // rect(300,550,50,50);
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


