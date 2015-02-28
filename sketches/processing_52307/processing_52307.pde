
PImage swings;
PImage bolly;
PImage ballerina;
PImage cleo;
PImage couple;
PImage danza;
PImage grace;
PImage kneel;
PImage lift;
PImage pointy;
PImage tut;
PImage B3;
PImage B4;
PImage B5;
PImage B6;

float r2;

float x = -1000;
float x2 = 620;
float speed = .7;
int direction = -1;


void setup () {
  size(700, 400);
  frameRate(60);

  //bgs
  swings=loadImage("girls_swing.jpg");
  //people
  ballerina=loadImage("ballerina.png");
  bolly=loadImage("bolly.png");
  cleo=loadImage("cleo.png");
  couple=loadImage("couple.png");
  danza=loadImage("danza.png");
  grace=loadImage("grace.png");
  kneel=loadImage("kneel.png");
  lift=loadImage("lift.png");
  pointy=loadImage("point.png");
  tut=loadImage("tuttut.png");

  B3=loadImage("banner_3.png");
  B4=loadImage("banner_4.png");
  B5=loadImage("banner_5.png");
  B6=loadImage("banner_6.png");
}

void draw() {
  background(swings);
  image(bolly, 180, 110);
  image(ballerina, 72, 80);
  image(cleo, 116, 101);
  image(lift, 0, 137);
  image(tut, 374, 124);

  if (mousePressed == true) {

    background(swings);
    r2 += random(-speed, speed);

    x += speed;
    if (x>width) {
      x = -1000;
    }
    x2 += speed * direction; 
    if (x2<-1400) {
      x2 = 610;
    }
    image(B3, x, r2);
    image(B4, x2, 120);

    pushMatrix();
    translate (200, 240);

    x += speed;
    if (x>width) {
      x = -1000;
    }
    x2 += speed * direction; 
    if (x2<-1400) {
      x2 = 620;
    }
    image(B5, x, r2);
    image(B6, x2, 120);
    popMatrix();

    //random pop-ups
    float x = random(width);
    float y = random (height);
    tint (182, 186, x, y);

    image(bolly, x-50, y-100);
    image(ballerina, x-60, y-60);
    image(cleo, x-70, y+30);
    image(couple, x-200, y-200);
    image(danza, x-160, y-250);
    image(grace, x-450, y-300);
    image(kneel, x-100, y-200);
    image(lift, x+200, y-100);
    image(pointy, x+130, y-45);
    image(tut, x+60, y-20);
  }
}


