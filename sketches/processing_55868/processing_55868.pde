
float xpos = random(0, 800);
float ypos;
float speed = 1.0;
float score = 0.0;
PFont font;
float br;
float wide;
PImage lose;
PShape redbomb;
PShape bluebomb;
PShape yellowbomb;
PShape greenbomb;
PShape blob;
PShape BG;
boolean gameover = false;

void setup()
{
  size(800, 480);
  rectMode(CENTER);
  //noCursor();
  font = loadFont("AgencyFB-Reg-48.vlw");
  textFont(font);
  br = 50;
  lose = loadImage("ENDSCREEN.png");
  redbomb = loadShape("red.svg");
  bluebomb = loadShape("blue.svg");
  yellowbomb = loadShape("yellow.svg");
  greenbomb = loadShape("green.svg");
  blob = loadShape("blob.svg");
  BG = loadShape("background.svg");
  shapeMode(CENTER);
}

void draw()
{
  fill(0, 100);
  noStroke();
  smooth();
  shape(BG, width/2, height/2, width, height);
  wide = 50;
  shape(bluebomb, xpos, ypos, 50, 50);
  ypos+=speed;


  shape(blob, mouseX, 475, 200, 250);

  textSize(48);
  fill(255);
  text(score, 700, 50);


  if (xpos<=mouseX+wide && xpos>=mouseX-wide && ypos >= 395 && ypos < height)
  {
    score = score + 1.0;
    speed = speed + 0.5;
    ypos = 0;
    xpos = random(0, 800);
  }

  if (score > 10.0)
  {
    bluebomb = yellowbomb;
  }

  if (score > 20.0)
  {
    yellowbomb = redbomb;
  }

  if (score > 40.0)
  {
    redbomb = greenbomb;
  }

  if (ypos > height)
  {
    image(lose, 0, 0);
    text(score, 345, 300);
  }
}


