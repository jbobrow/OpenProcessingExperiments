
int strawberryY = 100;
int strawberryX = 0;
PImage strawberry; 
int vel=5;

int kiwiY=100;
int kiwiX=0;
PImage kiwi;


int cherriesY=100;
int cherriesX=0;
PImage cherries;

int cakeY=100;
int cakeX =0;

PImage cake;

int cupY=100;
int cupX=0;

PImage cup;

void setup(){
  size(500,400);
  background(70,3,80);
  smooth();
  frameRate(65);
  strawberry=loadImage("strawberry.jpg");
  kiwi=loadImage("kiwi.jpg");
  cherries=loadImage("cherries.jpg");
   cake=loadImage("cake.jpg");
  cup=loadImage("cup.jpg");
}
 
    
void draw(){
background(255);
image(strawberry,strawberryX,strawberryY);
strawberryX= strawberryX + vel;
image(kiwi,kiwiX-400, kiwiY);
 kiwiX=kiwiX + vel;
image(cherries,cherriesX-800,cherriesY);
cherriesX=cherriesX + vel;
image(cake,cakeX-1200,cakeY);
cakeX=cakeX +vel;
image(cup,cupX-1600,cupY);
cupX=cupX + vel;

}

