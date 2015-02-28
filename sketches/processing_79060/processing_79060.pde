
float Xvalue = 225;
float Yvalue = 225;
float movement=.25;
float snakey= 50;
float snakex= 85;
float snakepoint=.3;
float centx= 45;
float centy= 420;
float centpoint=.3;
float dinox=200;
float dinoy=50;
float dinopointx=.3;
float dinopointy= .5;
float squidx= 200;
float squidy= 400;
float squidpointx= .5;
float squidpointy= .3;
PImage leftwalk;
PImage rightwalk;
PImage snake;
PImage centipede;
PImage dinosaur;
PImage squid;
PImage Lswitch;
boolean i = true;
int r;
float exitX;
float exitY;


void setup() {
  size(500, 500);
  background(250);
  smooth();
  leftwalk=loadImage("mekeleft.png");
  rightwalk=loadImage("mekeright.png");
  snake=loadImage("Snake.png");
  centipede=loadImage("centipede.png");
  dinosaur=loadImage("dinosaur.png");
  squid=loadImage("squid.png");
  Lswitch=loadImage("switch.png");
}
void draw() {
  size(500, 500);
  background(250);
  fill(0);
  rect(exitX, exitY, 80, 80);
  rect(Xvalue, Yvalue, 50, 50);
  //  image(rightwalk,Xvalue-20,Yvalue-20);
  fill(250);
  text("Click and Drag your mouse to move Meke around and try to find the lightswitch!", 45, 20);
  if (i==true) {
    r = int(random(0, 4));
    i=false;
  }
  // if (Xvalue<topleft && Xvalue[i]>playerPosX-35 && ypos[i]<playerPosY+35 && ypos[i]>playerPosY-35)
  if (dist(Xvalue, Yvalue, exitX, exitY)<50) {
    background(250);
  }
  if (dist(Xvalue, Yvalue, snakex, snakey)<25) {
    background(0);
  }
  if (dist(Xvalue, Yvalue, centx+75, centy)<50) {
    background(0);
  }
  if (dist(Xvalue, Yvalue, dinox+25, dinoy+25)<50) {
    background(0);
  }
  if (dist(Xvalue, Yvalue, squidx+40, squidy+33)<50) {
    background(0);
  }
}

void mouseDragged() 
{
  fill(0);

  rect(snakex, snakey+5, 30, 50);

  rect(centx+45, centy, 100, 20);

  rect(dinox+20, dinoy+20, 50, 50);

  rect(squidx+40, squidy+33, 50, 50);
  if (r==0) {
    fill(0);
    exitX= 0;
    exitY= 0;
    //  rect(0, 0, 80, 80);
  }
  if (r==1) {
    fill(0);
    exitX= 0;
    exitY= 400;
    // rect(0, 400, 80, 80);
  }
  if (r==2) {
    fill(0);
    exitX= 410;
    exitY= 0;
    // rect(410, 0, 80, 80);
  }
  if (r==3) {
    fill(0);
    exitX= 410;
    exitY= 400;
    //  rect(410, 400, 80, 80);
  }
  if (mouseX > 250) {
    Xvalue= Xvalue+movement;
    fill(255, 246, 167);
    ellipse(Xvalue+50, Yvalue+50, 100, 100);
    image(rightwalk, Xvalue-20, Yvalue-20);
  }
  if (mouseX < 250) {
    Xvalue= Xvalue-movement;
    fill(255, 246, 167);
    ellipse(Xvalue, Yvalue+50, 100, 100);
    image(leftwalk, Xvalue-20, Yvalue-20);
  }
  if (Xvalue >= 460) {
    Xvalue=Xvalue-movement;
  }
  if (Xvalue <=-10) {
    Xvalue=Xvalue+movement;
  }
  if (mouseY > 250) {
    Yvalue= Yvalue+movement;
  }
  if (mouseY < 250) {
    Yvalue= Yvalue-movement;
  }
  if (Yvalue >= 460) {
    Yvalue=Yvalue-movement;
  }
  if (Yvalue <=-10) {
    Yvalue=Yvalue+movement;
  }


  image(snake, 50, snakey);
  snakey=snakey+snakepoint;
  if (snakey >= 300) {
    snakepoint=-snakepoint;
  }
  if (snakey <= 0) {
    snakepoint=.3;
  }
  image(centipede, centx, 400);
  centx=centx+centpoint;
  if (centx >=500) {
    centpoint=-centpoint;
  }
  if (centx<=40) {
    centpoint=.3;
  }
  image(dinosaur, dinox, dinoy);
  dinox=dinox+dinopointx;
  dinoy=dinoy+dinopointy;
  if (dinox >=500) {
    dinopointx=-dinopointx;
  }
  if (dinox<=0) {
    dinopointx=.3;
  }
  if (dinoy>=400) {
    dinopointy=-dinopointy;
  }
  if (dinoy<= -100) {
    dinopointy= .5;
  } 
  image(squid, squidx, squidy);
  squidx=squidx+squidpointx;
  squidy=squidy+squidpointy;
  if (squidx >=500) {
    squidpointx=-squidpointx;
  }
  if (squidx<=0) {
    squidpointx=.5;
  }
  if (squidy>=550) {
    squidpointy=-squidpointy;
  }
  if (squidy<=0) {
    squidpointy= .3;
  }

  if (r==0) {

    image(Lswitch, 0, 0);
  }
  if (r==1) {

    image(Lswitch, 0, 400);
  }
  if (r==2) {
    image(Lswitch, 410, 0);
  }
  if (r==3) {
    image(Lswitch, 410, 400);
  }
}


