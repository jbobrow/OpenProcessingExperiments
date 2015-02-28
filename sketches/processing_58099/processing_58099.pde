
//declare states
static final int START = 0;
static final int LVL1 = 1;
static final int LVL2 = 2;
static final int LVL3 = 3;
static final int LVL4 = 4;
static final int LVL5 = 5;
static final int RESET = 6;

//variables
int level;
float posX;
float posY;
float sz;
float speed;
float angle;

//fonts
PFont type;

void setup() {
  angle = -90;
  sz = 55;
  size(600,350,P3D);
  background(250);
  //initialize the game
  level = START;
  type = loadFont("CourierNewPS-BoldMT-48.vlw");
  textFont(type,sz);
  fill(0);
  smooth();
  textAlign(CENTER);
  text("ROUGH DRAFT",width/2,height/2);
  posX = 0;
  posY = 0;
  speed = 1;
}

void mousePressed() {
  if(level < RESET) level++;
  if(level == RESET) level = START; 
}

void draw() {
//use draw to poll the game state
  switch(level) {
    case START:
      println("start");
      break;
    case LVL1:
      println("level one");
      break;
    case LVL2:
      println("level two");
      break;
    case LVL3:
      println("level three");
      break;
    case LVL4:
      println("level four");
      break;
    case LVL5:
      println("level five");
      break;
    case RESET:
      init();
      println("reset");
      break;
  }
  //text effects
  if (level == START) {
    background(250);
    textFont(type,50);
    fill(0);
    smooth();
    textAlign(CENTER);
    text("ROUGH DRAFT",width/2,height/2);
  }
  if (level == LVL1) {
    if (posX > 800) posX = -200;
    background(250);
    textFont(type,55);
    fill(0);
    smooth();
    textAlign(CENTER);
    text("ROUGH DRAFT",posX,height/2);
    posX = posX + 2;
  }
  if (level == LVL2) {
    if ((posY > 350) || (posY < 0)) speed = speed * -1;
    background(250);
    textFont(type,sz);
    fill(0);
    smooth();
    textAlign(CENTER);
    text("ROUGH DRAFT",width/2,posY);
    posY = posY + speed;
  }
  if (level == LVL3)  {
    if (sz > 200) sz = 50;
    background(250);
    textFont(type,sz);
    fill(0);
    smooth();
    textAlign(CENTER);
    text("ROUGH DRAFT",width/2,height/2);
    sz = sz +.25;
  }
  if (level == LVL4) {
    if (sz < 10) sz = 50;
    background(250);
    textFont(type,sz);
    fill(0);
    smooth();
    textAlign(CENTER);
    translate(random(0,75),random(0,10),random(0,100));
    text("ROUGH DRAFT",width/2,height/2);
    sz = sz - .05;
  }
   if (level == LVL5) {
    if (angle > 120) angle = -90;
    background(250);
    textFont(type,sz);
    fill(0);
    smooth();
    textAlign(CENTER);
    rotate(radians(angle));
    text("ROUGH DRAFT",width/2,height/2);
    angle++;
  }
}

