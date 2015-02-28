
// Josh Newby
// Copyright Josh Newby 2013, Pittsburgh PA 15217
// Homework # 7 Game Project

float wd, ht, x, y;
float a, b;
float anoise, bnoise;
float aoffset, boffset;
float showscore;
int time, startTime, gameTime, countdown;
int mode, score;

void setup()
{
  size (400, 400);
  background (0);
  smooth();
  frameRate (60);
  mode = 0;
  wd = width;
  ht = height;
  x = 20;
  y = 20;
  anoise = random (width);
  bnoise = random (height);
  aoffset = 0.01;
  boffset = 0.01;
}

void drawMovingTarget()
{
  a = noise (anoise) * width;
  b = noise (bnoise) * height;
  
  noStroke();
  fill (255, 0, 0);
  ellipse (a, b, x * 1.2 , y * 1.2);
  fill (255, 255, 255);
  ellipse (a, b, x * .9, y * .9);
  fill (255, 0, 0);
  ellipse (a, b, x * .5, y * .5);
  
  anoise = anoise + aoffset;
  bnoise = bnoise + boffset;
}

void draw()
{
 background(0);
 if (mode == 0)
 {
   introScreen();
 }
  else if (mode == 1)
 {
   play();
 }
 else
 {
   endScreen();
 }
}
 
 void endScreen()
 {
   background (0);
   textSize(50);
   fill (255);
   text (score, wd * .5, ht * .5);
   textSize (10);
   text ("flies caught", wd * .5, ht * .5 + 20);
   rectMode(CENTER);
   noStroke();
   
   textSize (25);
   fill(255, 0, 0);
   if (score < 5)
   {
     text("you're a sloth.", wd * .5, ht * .5 + 50);
   }
   if (score > 5 && score < 10)
   {
     text("you're a chameleon", wd * .5, ht * .5 + 50);
   }
   if (score > 10)
   {
     text("you're a treefrog", wd * .5, ht * .5 + 50);
   }
 }
 
  
void introScreen()
{
  fill (255, 255, 255);
  textAlign(CENTER);
  textSize(25);
  text("FLY HUNTER", wd * .5, ht * .5 - .2 * ht);
  line (wd * .333, ht * .5 - .18 * ht, wd * .666, ht * .5 - .18 * ht);
  textSize(22);
  text("Move mouse to aim crosshairs.", wd * .5, ht * .5 - .1 * ht);
  text("Click to fire at the fly.", wd * .5, ht * .5);
  text("Hit the target to begin!", wd * .5, ht *.5 + .1 * ht);
  
  noStroke();
  fill (255, 0, 0);
  ellipse (wd * .5, ht * .7, x * 1.2 , y * 1.2);
  fill (255, 255, 255);
  ellipse (wd * .5, ht * .7, x * .9, y * .9);
  fill (255, 0, 0);
  ellipse (wd * .5, ht * .7, x * .5, y * .5);
  
  noFill();
  stroke (255, 255, 255);
  ellipse (mouseX, mouseY, 2 * x, 2 * y);
  line (mouseX, mouseY - 30, mouseX, mouseY + 30);
  line (mouseX -30, mouseY, mouseX + 30, mouseY);
}

 void mouseClicked()
{
 if (mouseX > wd * .5 - x * 1.2
 && 
 mouseX < wd * .5 + x * 1.2 
 && 
 mouseY > ht * .7 - y * 1.2 
 && 
 mouseY < ht * .7 + y * 1.2
 && mode == 0)
{
  mode = 1;
  startTime = millis();
  score = 0;
}
}

void play ()
{
  background (0);
  drawMovingTarget();
  crosshairs();
  timer();
  showScore();
}

void mousePressed()
{
  if (mouseX <= a + x * .5 && mouseX >= a - x * .5
  && mouseY <= b + y *.5 && mouseY >= b - y *.5)
  {
    score = score + 1;
    hit();
  }
}

void hit()
{
  strokeWeight(6);
  stroke (255, 0, 0);
  line(a + 1 * x, b + 1 * y, a + 3 * x, b + 3 * y);
  line(a - 1 * x, b - 1 * y, a - 3 * x, b - 3 * y);
  line(a + 1 * x, b - 1 * y, a + 3 * x, b - 3 * y);
  line(a - 1 * x, b + 1 * y, a - 3 * x, b + 3 * y);
}
  
void showScore()
{
  textSize(10);
  fill(255);
  textAlign(CENTER);
  text ("score", wd * .5, ht * .08);
  textSize(30);
  text (score, wd * .5, ht * .15);
}
  
void timer ()
{
  gameTime = 30000;
  time = gameTime/1000;
  countdown = gameTime/1000 - ((millis() - startTime))/1000;
  textSize (10);
  fill (255);
  textAlign(CENTER);
  text ("time", x * 1.8, y * 1.5);
  textSize(30);
  text (countdown, x * 1.8, y * 3);
  
  if (countdown <= 0)
  {
    mode = 2;
  }
}

void crosshairs()
{
  noFill();
  strokeWeight (1);
  stroke (255, 255, 255);
  ellipse (mouseX, mouseY, 2 * x, 2 * y);
  line (mouseX, mouseY - 30, mouseX, mouseY + 30);
  line (mouseX -30, mouseY, mouseX + 30, mouseY);
}
