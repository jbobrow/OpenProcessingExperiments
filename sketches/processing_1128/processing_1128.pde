
Player player1, player2;
int pX, p1Y, p2Y, diff=16, defaultPlayerSpeed=2, slowPlayerSpeed=1;
float m, x;
PFont font;
PImage scissors, paper, stone, backgrund, intro;
boolean starts=true;

void setup()
{
  noStroke();
  size(176,220);
  pX=width/2;
  p1Y=height/8;
  p2Y=7*height/8;
  player1 = new Player(pX, p1Y, 1);
  player2 = new Player(pX, p2Y, 2);
  font = loadFont("Georgia-Bold-10.vlw");
  scissors = loadImage("sciss.tga");
  paper = loadImage("paper.tga");
  stone = loadImage("stone.tga");
  backgrund = loadImage("background.tga");
  intro = loadImage("open.tga");
}

void draw()
{

  background(0);
  image(backgrund,0,0);
  writing();
  player1.spawn();
  player2.spawn();
  check();
  if (starts){
    image(intro,0,0);
    if (keyCode==ENTER){
      starts=false;
    }
  }

}


class Player
{
  int xpos, ypos, playa, weapon=10, score=0, playerSpeed=defaultPlayerSpeed; //weapons scissors==1, paper==2
  boolean mUp=false, mDown= false, mRight=false, mLeft=false,  //stone==3
  colRight=false, colLeft=false, colUp=false, colDown=false;
  Player(int xp, int yp, int pl)
  {
    xpos = xp;
    ypos = yp;
    playa = pl;
  }

  void spawn()
  {
    if (playa==1){
      fill(0,0,255);
    }
    if (playa==2){
      fill(255,0,0);
    }
    ellipse(xpos,ypos,diff,diff);
    weapons();
    moveUp();
    moveDown();
    moveRight();
    moveLeft();
    if(score==10){
      delay(2000);
      endgame();
      restart();

    }

  }

  void moveUp(){
    if ((mUp==true)&&(ypos+playerSpeed>=diff)){
      ypos = ypos - playerSpeed;
      if (colUp==true){
        ypos = ypos + 2*playerSpeed;
        colUp=false;
      }
    }
  }

  void moveDown(){
    if ((mDown==true)&&(ypos-playerSpeed<=height-diff)){
      ypos = ypos + playerSpeed;
      if (colDown==true){
        ypos = ypos - 2*playerSpeed;
        colDown=false;
      }

    }
  }

  void moveRight(){
    if ((mRight==true)&&(xpos-playerSpeed<=width-diff)){
      xpos = xpos + playerSpeed;
      if (colRight==true){
        xpos = xpos - 2*playerSpeed;
        colRight=false;
      }
    }
  }

  void moveLeft(){
    if((mLeft==true)&&(xpos-playerSpeed>=diff)){
      xpos = xpos - playerSpeed;
      if (colLeft==true){
        xpos = xpos + 2*playerSpeed;
        colLeft=false;
      }
    }
  }




  void weapons()
  {
    switch(weapon) {
    case 10:
      fill(0);
      playerSpeed=defaultPlayerSpeed;
      ellipse(xpos,ypos,diff-4,diff-4);
      break;
    case 1:
      playerSpeed=slowPlayerSpeed;
      image(scissors,xpos-6,ypos-6);
      break;
    case 2:
      playerSpeed=slowPlayerSpeed;
      image(paper,xpos-6,ypos-6);
      break;
    case 3:
      playerSpeed=slowPlayerSpeed;
      image(stone,xpos-6,ypos-6);
      break;
    }

  }


  void restart()
  {
    xpos=pX;
    if(playa==1)ypos=p1Y;
    if(playa==2)ypos=p2Y;
    weapon=10;
  }
}

void keyPressed() //key presses
{

  if(keyCode == UP) player1.mUp=true;
  if(keyCode == DOWN) player1.mDown=true;
  if(keyCode == RIGHT) player1.mRight=true;
  if(keyCode == LEFT) player1.mLeft=true;
  if(key==',') {
    player1.weapon=1;
  }
  if(key=='.') {
    player1.weapon=2;
  }
  if(key=='/') {
    player1.weapon=3;
  }


  if((key=='w')||(key=='W'))player2.mUp=true;
  if((key=='s')||(key=='S'))player2.mDown=true;
  if((key=='d')||(key=='D'))player2.mRight=true;
  if((key=='a')||(key=='A'))player2.mLeft=true;
  if((key=='v')||(key=='V'))player2.weapon=1;
  if((key=='b')||(key=='B'))player2.weapon=2;
  if((key=='n')||(key=='N'))player2.weapon=3;

}

void keyReleased()
{
  if(keyCode == UP) player1.mUp=false;
  if(keyCode == DOWN) player1.mDown=false;
  if(keyCode == RIGHT) player1.mRight=false;
  if(keyCode == LEFT) player1.mLeft=false;
  if((key==',')||(key=='.')||(key=='/')) {
    player1.weapon=10;
  }

  if((key=='w')||(key=='W'))player2.mUp=false;
  if((key=='s')||(key=='S'))player2.mDown=false;
  if((key=='d')||(key=='D'))player2.mRight=false;
  if((key=='a')||(key=='A'))player2.mLeft=false;
  if((key=='v')||(key=='V')||(key=='b')||(key=='B')||(key=='n')||(key=='N'))player2.weapon=10;


}

void check()
{
  float tester;
  tester=(sqrt(((player1.xpos-player2.xpos)*(player1.xpos-player2.xpos))
    +((player1.ypos-player2.ypos)*(player1.ypos-player2.ypos))))/2;

  if(tester+1<=diff/2)
  {
    if(player1.weapon!=player2.weapon)
    {
      if((player2.weapon-player1.weapon==1)||(player1.weapon-player2.weapon==2)||(player2.weapon==10))
      {                                                                          //player 1 scores
        player1.score=player1.score+1;

      }

      if((player1.weapon-player2.weapon==1)||(player2.weapon-player1.weapon==2)||(player1.weapon==10))
      {                                                                          //player 2 scores
        player2.score=player2.score+1;

      }  

      player1.restart();
      player2.restart();
      delay(1000);
    } 

  }
  if(tester<=diff/2)
  {
    if(player1.weapon==player2.weapon) {
      collision(); 

    }
  }

}



void collision(){
  if(player1.xpos>player2.xpos){
    player1.colLeft=true;
    player2.colRight=true;
  }
  if(player2.xpos>player1.xpos){
    player2.colLeft=true;
    player1.colRight=true;
  }
  if(player1.ypos>player2.ypos){
    player1.colUp=true;
    player2.colDown=true;
  }
  if(player2.ypos>player1.ypos){
    player2.colUp=true;
    player1.colDown=true;
  }
}


void writing()
{
  fill(0);
  String str1 = ("Player 1: " + player1.score), str2 = ("Player 2: "+ player2.score);
  textFont(font,10);
  text(str1, 10,height/10);
  text(str2, 10,9*height/10);
}

void endgame()
{

  starts=true;
  player1.score=0;
  player2.score=0;

}

