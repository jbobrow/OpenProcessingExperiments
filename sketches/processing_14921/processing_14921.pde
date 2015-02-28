


float xpos=0;
int speed=10;

float ypos=0;
int yspeed=1;

float xpos2=1;
int speed2=11;

float ypos2=1;
int yspeed2=11;

float xpos3=2;
int speed3=12;

float ypos3=2;
int yspeed3=12;

PImage stone;
PImage bamboo;
PImage thorns;

void setup () {
  background (0,0,0,20);
  size(500,500);


  stone = loadImage("stone.jpg");
  bamboo= loadImage("bamboo.jpg");
  thorns = loadImage("thorns.jpg");
}


void draw() {
  background(100);
  xpos=xpos+speed;
  ypos=ypos+yspeed;
  xpos2=xpos2+speed2;
  ypos2=ypos2+yspeed2;
  xpos3=xpos3+speed3;
  ypos3=ypos3=yspeed3;
  
  tint(200,200,200, 200);  
  image(stone, xpos, ypos, 200, 200);


  if (xpos>400) {
    speed= -4 ;
  }

  if (xpos<0) {
    speed=4;
  }

  if (ypos>400) {
    yspeed= -3 ;
  }
  if (ypos<0) {
    yspeed=3;
  }

  tint(200,200,200,200);
  image(bamboo, xpos2, ypos2, 300, 300);


  if (xpos2>400) {
    speed2= -3 ;
  }

  if (xpos2<0) {
    speed2=3;
  }

  if (ypos2>400) {
    yspeed2= -2 ;
  }
  if (ypos2<0) {
    yspeed2=2;
  }
  
  tint(200,200,200,200);
  image(thorns, xpos3, ypos3, 250, 250);


  if (xpos3>400) {
    speed3= -2 ;
  }

  if (xpos3<0) {
    speed3=2;
  }

  if (ypos3>400) {
    yspeed3= -1 ;
  }
  if (ypos3<0) {
    yspeed3=1;
  }
  
  
}


