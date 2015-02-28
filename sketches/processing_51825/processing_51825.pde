
//backgrounds
PImage crying;
PImage foundery;
PImage swings;
PImage hall;
PImage staircase;
PImage hallway;
PImage trumpet;
PImage waterfall;

//people
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


int timer = 0;

void setup () {
  size(700, 400);
  frameRate(1);

  //bgs
  crying =loadImage("crying_kids.jpg");
  foundery=loadImage("foundery.jpg");
  swings=loadImage("girls_swing.jpg");
  hall=loadImage("hall2.jpg");
  staircase=loadImage("staircase.jpg");
  hallway=loadImage("stated_hall.jpg");
  trumpet=loadImage("trumpet.jpg");
  waterfall=loadImage("waterfall.jpg");

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
}

void draw() {

  if (timer == 0) {
    background(foundery);
    image(bolly, 423, 196);
    image(cleo, 526, 118);
    image(couple, 171, 141);
    image(danza, 60, 170);
    image(ballerina, 128, 207);
    image(grace, 164, 244);
    image(kneel, 506, 208);
    image(lift, 292, 263);
    image(pointy, 560, 201);
    image(tut, 196, 261);
  }

  if (timer == 1) {

    background(waterfall);
    image(bolly, 560, 34);
    image(cleo, 41, 61);
    image(lift, 359, 251);
    image(pointy, 531, 181);
    image(tut, 318, 27);
  }

  if (timer == 2) {

    background(trumpet);
    image(bolly, 196, 108);
    image(couple, 1, 77);
    image(grace, 293, 65);
    image(pointy, 520, 48);
  }

  if (timer == 3) {

    background(trumpet);
    image(bolly, 196, 108);
    image(couple, 1, 77);
    image(grace, 293, 65);
    image(pointy, 520, 48);
  }

  if (timer == 4) {
    background(hallway);
    image(ballerina, 295, 95);
    image(grace, 379, 268);
    image(kneel, 152, 191);
    image(pointy, 281, 191);
    image(tut, 507, 158);
  }

  if (timer == 5) {
    background(hall);
    image(bolly, 444, 298);
    image(ballerina, 231, 135);
    image(cleo, 255, 249);
    image(couple, 46, 216);
    image(danza, 124, 186);
    image(grace, 358, 180);
    image(kneel, 330, 106);
    image(lift, 578, 180);
  }

  if (timer == 6) {
    background(staircase);
    image(ballerina, 86, 212);
    image(cleo, 108, 243);
    image(couple, 14, 242);
    image(grace, 108, 277);
    image(lift, 308, 263);
    image(tut, 261, 298);
  }

  if (timer == 7) {
    background(swings);
    image(bolly, 184, 124);
    image(ballerina, 84, 20);
    image(cleo, 124, 73);
    image(couple, 45, 191);
    image(danza, 582, 27);
    image(grace, 395, 290);
    image(kneel, 84, 239);
    image(lift, 27, 101);
    image(pointy, 524, 190);
    image(tut, 395, 124);
  }

  if (timer == 8) {
    background(crying);
    image(bolly, 589, 271);
    image(ballerina, 575, 234);
    image(cleo, 63, 111);
    image(couple, 164, 75);
    image(danza, 589, 128);
    image(grace, 73, 282);
    image(kneel, 432, 109);
    image(lift, 520, 113);
    image(pointy, 385, 200);
    image(tut, 353, 240);
  }

  timer = timer + 1;
  if (timer >= 9) {
    timer = 0;
  }
  //text & rect

  if (mousePressed == true) {
    tint(171, 221, 229, 200);
    filter(INVERT);
    filter(OPAQUE);
  }
  if (mousePressed == false) {
    noTint();
  }
}

void mouseDragged () {
  float x = random(width);
  float y = random (height);
  tint (182, 186, x-100, y+50);
  image(bolly, x-50, y+100);
  image(ballerina, x-60, y+60);
  image(cleo, x-70, y+30);
  image(couple, x+200, y+200);
  image(danza, x-160, y+250);
  image(grace, x+450, y-300);
  image(kneel, x+500, y-200);
  image(lift, x-200, y+100);
  image(pointy, x+130, y-45);
  image(tut, x+60, y-20);
}


