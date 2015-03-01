
PImage player;
PImage bg;
PImage warp;
PImage winner;
boolean pickup1=false;
boolean pickup2=false;
boolean pickup3=false;
PImage collect1;
PImage collect2;
PImage collect3;
int x=250;
int y=600;
int r=5;
int aX = 300;
int aY = 400;
int ran=0;
int rand=0;
int rando=0;
int nar=0;
int dnar=0;
boolean winIt=false;
boolean loseIt=false;
void setup(){
  size(501, 701);
  player=loadImage("ship.gif");
  bg=loadImage("space.png");
  warp=loadImage("portal.png");
  winner=loadImage("win.gif");
  collect1=loadImage("ball.gif");
  collect2=loadImage("ball.gif");
  collect3=loadImage("ball.gif");
  
}

void draw(){ 
  
  fill(0,0,0);
  rect(0,0,500,700);
  fill(rand, ran, rando);
  rect(350, 550, 10, 100);
  rect(100, 200, 20, 100);
  rect(300, 40, 15, 150);
  rect(200, 500, 15, 100);
  rect(400, 300, 20, 100);
  rect(290, 250, 20, 70);
  image(player,x,y);
  ran=random(255);
  rand=random(255);
  rando=random(255);

  image(warp,300,20);
  image(collect1,20,20);
  image(collect2,20,400);
  image(collect3,200,200);
  if(x>500)
    x=0;
  if(x<0)
    x=500;
  if(y<0)
    y=700;
  if(y>700)
    y=0;
  if(((x>=5)&&(x<=35))&&((y>=5)&&(y<=35)))
    pickup1=true;
  if(((x>=5)&&(x<=35))&&((y>=385)&&(y<=415)))
    pickup2=true;
  if(((x>=185)&&(x<=215))&&((y>=185)&&(y<215)))
    pickup3=true;
  youWon();
}
void keyPressed(){
  if(key=='a'){
    x=x-r;
  }
  if(key=='d'){
    x=x+r;
  }
  if(key=='w'){
    y=y-r;
  }
  if(key=='s'){
    y=y+r;
  }
}
void youWon(){
 if(((350<=x)&&(x<=450))&&((y>=90)&&(y<=105))){
 if((pickup1)&&(pickup2)&&(pickup3)){
   image(winner,30,0);
   r=0;
  }
 }
}


