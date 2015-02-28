
// coordinates
//int x, y;
int u, v;
float prizeX, prizeY;

// other stuff
//int screenNumber;
int aScore, bScore;
//int speed;
PFont font;
PImage cookie, blue, red;
int screenNumber;
int Score;
int speed;
PImage lose, intro, map, slime, instr, credit, win;
float x, y, r, t, i, m, e;
boolean upPressed, downPressed;
float b1, bb1, b2, bb2, b3, bb3, b4, bb4, b5, bb5;
float score;
PImage bad1, bad2, bad3, bad4, bad5;
PImage good1, good2, good3, good4, good5;
float g1, gg1, g2, gg2, g3, gg3, g4, gg4, g5, gg5, it, its;


void setup()
{
  size(500, 500);
  smooth();
  noStroke();
  screenNumber = 0;
  upPressed = downPressed = false;
  //------------------------------
  intro = loadImage("intro.png");
  lose = loadImage("lose.png");
  map = loadImage("map.jpg");
  instr = loadImage("instr.jpg");
  win = loadImage("win.jpg");
  credit = loadImage("credit.jpg");
  slime = loadImage("t.png");
  bad1 = loadImage("bad1.png");
  bad2 = loadImage("bad2.png");
  bad3 = loadImage("bad3.png");
  bad4 = loadImage("bad4.png");
  bad5 = loadImage("bad5.png");
  //------------------------------
  good1 = loadImage("good1.png");
  good2 = loadImage("good2.png");
  good3 = loadImage("good3.png");
  good4 = loadImage("good4.png");
  good5 = loadImage("good5.png");
  //------------------------------
  m = 250;
  e = 100;
  score = i = 0;
  b1 = random(1000, 2000);
  b2 = random(1000, 2000);
  b3 = random(1000, 2000);
  b4 = random(1000, 2000);
  b5 = random(1000, 2000);
  bb1 = random(0, 500);
  bb2 = random(0, 500);
  bb3 = random(0, 500);
  bb4 = random(0, 500);
  bb5 = random(0, 500);
  //-----------------------
  g1 = random(1000, 2000);
  g2 = random(1000, 2000);
  g3 = random(1000, 2000);
  g4 = random(1000, 2000);
  g5 = random(1000, 2000);
  gg1 = random(0, 500);
  gg2 = random(0, 500);
  gg3 = random(0, 500);
  gg4 = random(0, 500);
  gg5 = random(0, 500);
  it = random(0, 500);
  its = random(1000, 2000);
}

void draw()
{ 
  background(0);
  if (screenNumber == 0)
  {
    displayIntro();
  }
  else if (screenNumber == 1)
  {
    displayPlay();
    junk();
    bad();
    good();
  }
  else if (screenNumber == 2)
  {
    displayWin();
  }
  else if (screenNumber == 3)
  {
    displayLose();
  }
  else if (screenNumber == 4)
  {
    displayCredits();
  }
  else if (screenNumber == 5)
  {
    displayInstr();
  }
}


void mouseClicked()
{
  if (mouseX > 180 && mouseX < 325 && mouseY > 160 && mouseY < 220) 
  {
    screenNumber = 1;
    m = 250;
    e = 100;
    score = i = 0;
    b1 = random(1000, 2000);
    b2 = random(1000, 2000);
    b3 = random(1000, 2000);
    b4 = random(1000, 2000);
    b5 = random(1000, 2000);
    bb1 = random(0, 500);
    bb2 = random(0, 500);
    bb3 = random(0, 500);
    bb4 = random(0, 500);
    bb5 = random(0, 500);
    g1 = random(1000, 2000);
    g2 = random(1000, 2000);
    g3 = random(1000, 2000);
    g4 = random(1000, 2000);
    g5 = random(1000, 2000);
    gg1 = random(0, 500);
    gg2 = random(0, 500);
    gg3 = random(0, 500);
    gg4 = random(0, 500);
    gg5 = random(0, 500);
    it = random(0, 500);
    its = random(1000, 2000);
  }
  if (mouseX > 100 && mouseX < 410 && mouseY > 260 && mouseY < 320) screenNumber = 5;
  if (mouseX > 140 && mouseX < 360 && mouseY > 360 && mouseY < 420) screenNumber = 4;
  if (mouseX > 420 && mouseX < 480 && mouseY > 10 && mouseY < 35) screenNumber = 0;
  if (mouseX > 30 && mouseX < 225 && mouseY > 425 && mouseY < 470) 
  {
    screenNumber = 1;
    m = 250;
    e = 100;
    score = i = 0;
    b1 = random(1000, 2000);
    b2 = random(1000, 2000);
    b3 = random(1000, 2000);
    b4 = random(1000, 2000);
    b5 = random(1000, 2000);
    bb1 = random(0, 500);
    bb2 = random(0, 500);
    bb3 = random(0, 500);
    bb4 = random(0, 500);
    bb5 = random(0, 500);
    g1 = random(1000, 2000);
    g2 = random(1000, 2000);
    g3 = random(1000, 2000);
    g4 = random(1000, 2000);
    g5 = random(1000, 2000);
    gg1 = random(0, 500);
    gg2 = random(0, 500);
    gg3 = random(0, 500);
    gg4 = random(0, 500);
    gg5 = random(0, 500);
    it = random(0, 500);
    its = random(1000, 2000);
  }
}


