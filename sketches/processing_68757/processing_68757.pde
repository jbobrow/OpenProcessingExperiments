
//Kevin Hyun hyun
//Copyright 2012

float x, y, wd, ht;
int value;
int timedown, timeup;
boolean m;

void setup()
{

//  PFont font;
//  font = loadFont("LetterGothicStd-32.vlw");

  smooth();
  size(400, 400);

  x = 100;
  y = 100;
  wd = 0;
  ht = 0;
  m = false;
  noCursor();
}

void draw()
{
  //Fade
  fill(255, 255, 255, 10);
  rect(-10, -10, 500, 500);

  //Circle Generation
  frameRate(30);
  noStroke();
  fill(random(255), random(255), random(255), random(50, 100));
  ellipseMode ( CENTER );
  ellipse(mouseX + random(-wd, wd), mouseY + random(-wd, wd), wd, ht);
  if (m)
  {
    wd = (timeup - timedown)/10;
    ht = (timeup - timedown)/10;
    m = false;
  }

  stroke(0);
  textSize(random(1, wd));
  textAlign(CENTER);
  text(frameCount, mouseX, mouseY);
}


void mousePressed()
{
  timedown = millis();
}

void mouseReleased()
{
  timeup = millis();
  m = true;
}


