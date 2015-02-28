
// Oliver Haimson alhaimso
// Homework 3
// Copyright 2012

float x, y, x2, y2, wd, ht;

void setup()
{
  size(400,400);
  smooth();
  strokeWeight(2);
  initGame();
}

void initGame()
{
  loop();
  x = 100;
  y = 100;
  x2 = 100;
  y2 = 100;
  wd = 50;
  ht = 50;
 
  // background image
  PImage bg;
  bg = loadImage("bg.jpeg");
  image(bg,0,0, width, height);
  
  // instructional text
  textSize(12);
  fill(0,0,0);
  text("press the mouse to move the axes", 185, 355);
  text("drag the mouse to increase the size", 185, 370);
  text("press any key to start over", 185, 385);
  
  // title text
  textSize(16);
  fill(255,255,255);
  text("SPACE TAKEOVER!!", 15, 50);
}

// draw the circles and move them with the mouse
void draw()
{
  fill(32,45,152);
  ellipse(mouseX, y, x%wd, ht);
  x=x+1;
  fill(36,110,137);
  ellipse(x2, mouseY, wd, y2%ht);
  y2=y2+1;
  // you win if the ellipses' diameters get large enough
  if(wd>width*.8){
    win();
    }
}

void win()
{
    textSize(20);
    fill(255,255,255);
    text("YOU WIN!", 155,175);
    text("You have completed the Space Takeover!", 4,200);
    noLoop();
}

// change the axes when the mouse is pressed
void mousePressed()
{
  y=mouseY;
  x2=mouseX;
}

// increase the size when the mouse is dragged
void mouseDragged()
{
  wd = wd+1;
  ht = ht+1;
}

// start over when a key is pressed
void keyPressed()
{
  initGame();
}


