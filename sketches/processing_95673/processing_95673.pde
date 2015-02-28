

boolean bullet = false;  // Bullet T/F
float x = mouseX;
int y = -30;

int a = 0;  // Background colors
int b = 0;
int c = 0;

int color1 = 1;  // Background color changes
int color2 = 2;
int color3 = 3;

float x1 = random(630,710);  // Targets x-coordinate
float x2 = random(630,710);
float x3 = random(630,710);
float x4 = random(630,710);
float x5 = random(630,710);

float y1 = random(500,600);  // Targets y-coordinate
float y2 = random(600);
float y3 = random(600);
float y4 = random(600);
float y5 = random(600);

boolean c1 = false;  // Expanding circles T/F
boolean c2 = false;
boolean c3 = false;
boolean c4 = false;
boolean c5 = false;

int cx1 = 1;  // Expanding circles
int cy1 = 1;
int cx2 = 1;
int cy2 = 1;
int cx3 = 1;
int cy3 = 1;
int cx4 = 1;
int cy4 = 1;
int cx5 = 1;
int cy5 = 1;

int a1 = a - 50;  // Expanding circle colors
int b1 = b - 50;
int co1 = c - 50;
int a2 = a - 50;
int b2 = b - 50;
int co2 = c - 50;
int a3 = a - 50;
int b3 = b - 50;
int co3 = c - 50;
int a4 = a - 50;
int b4 = b - 50;
int co4 = c - 50;
int a5 = a - 50;
int b5 = b - 50;
int co5 = c - 50;

int speed = -2;  // Speed of white balls
int gspeed = -5;  // Speed of green ball

int score = 0;  // Game score
int rscore = 0;  // Figurative score (resets)

int sf = 0;  // Shots fired
int rsf = 0;  // Figurative shots fired (resets)

int timer = 50;  // ENTER button timer

int addtime = 30;  // Upgrade: adds time

float ptimer = addtime;  // Playing timer

boolean bomb = false;  // ENTER button T/F

int valuexpm = 70;  // Value of X P multiplier

float xp = 1;  // XP bar & meter
float xpX = 1;
int xpY = 15;

boolean upgrade = false;  // Upgrades menu T/F

int aim = 50;  // Upgrade costs
int add10 = 70;
int whiteb = 100;
int greenb = 130;
int xpm = 150;

boolean aimtf = false;  // aim upgrade

int timex = 157;  // Animations
int timey = 250;
int whiteb1 = 250;
int whiteb2 = 250;
int whiteb1s = speed;
int whiteb2s = speed - 1;
int greenb1 = 250;
int greenb2 = 250;
int greenb1s = gspeed;
int greenb2s = gspeed - 1;
int xpa1 = 1; 
int xpb1 = 15;
int xpa2 = 1;
int xpb2 = 15;

boolean restart = false;  // Restart?
boolean unrestart = false;

boolean start = true;  // Beginning menu

boolean instructions1 = false;  // Instructions
boolean instructions2 = false;
boolean instructions3 = false;

boolean cheats = false;  // The cheats menu
boolean cheat11 = false;
boolean cheat12 = false;
boolean cheat21 = false;
boolean cheat22 = false;
boolean cheat1 = false;
boolean cheat2 = false;

int helpx = 68;  // The little help box
int helpy = -109;

boolean glitchfix = false;  // The name says it all
boolean glitchfix2 = false;
boolean glitchfix3 = false;

boolean pause = false;  // Pause menu
boolean unpause = false;


void setup()
{
  size (600,600);  // All settings
  textFont (createFont("Verdana",16));
  smooth();
  noCursor();
  noStroke();
  rectMode (CENTER);
  frameRate (300);
  strokeWeight (2);
}

void draw()
{
  background (a,b,c);
 
  a += color1;  // Changes background colors
  b += color2;
  c += color3;
  
  if (a == 200)  {  // Changes background colors
    color1 = -1;
  }
  if (a == 0)  {
  color1 = 1;
  }
  
  if (b == 200)  {  // Changes background colors
    color2 = -2;
  }
  if (b == 0)  {
  color2 = 2;
  }
  
  if (c == 200)  {  // Changes background colors
  color3 = -3;
  }
  if (c == 0)  {
  color3 = 3;
  }

  if (!aimtf)  {  // Shows cursor location
  noFill();
  stroke (0);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-50);
  line (mouseX,mouseY,mouseX-50,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+50);
  line (mouseX,mouseY,mouseX+50,mouseY);
  noStroke();
  }
  if (aimtf)  {
  noFill();
  stroke (0);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-1000);
  line (mouseX,mouseY,mouseX-1000,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+1000);
  line (mouseX,mouseY,mouseX+1000,mouseY);
  noStroke();
  }
 
  if (y < 0)  {  // Sets bullet location from not moving with mouse
  x = mouseX;
  } else {
  x = x;
  }
 
  if (bullet)  {  // Draws the bullet
  fill (255);
  rect (x,y,7,40);
  y += 16;
  }
 
  if (y > 650)  {  // Stops the bullet
  y = 650;
  }
 
  fill (0,255,0);  // Targets
  ellipse (x1,y1,15,15);
  fill (255);
  ellipse (x2,y2,15,15);
  ellipse (x3,y3,15,15);
  ellipse (x4,y4,15,15);
  ellipse (x5,y5,15,15);
  
  if (c1 == false)  {  // Moves the targets if they aren't hit
  noStroke();
  fill (255);
  x1 += gspeed;
  }
  if (c2 == false)  {
  noStroke();
  fill (255);
  x2 += speed;
  }
  if (c3 == false)  {
  noStroke();
  fill (255);
  x3 += speed;
  }
  if (c4 == false)  {
  noStroke();
  fill (255);
  x4 += speed;
  }
  if (c5 == false)  {
  noStroke();
  fill (255);
  x5 += speed;
  }


  if (x1 <= -30)  {  // Resets the targets to 0
  x1 = random(630,710);
  y1 = random(500,600);
  }  
  if (x2 <= -30)  {
  x2 = random(630,710);
  y2 = random(600);
  }  
  if (x3 <= -30)  {
  x3 = random(630,710);
  y3 = random(600);
  }  
  if (x4 <= -30)  {
  x4 = random(630,710);
  y4 = random(600);
  } 
  if (x5 <= -30)  {
  x5 = random(630,710);
  y5 = random(600);
  }  
  
  text ("Money:",5,595);  // Draws the score
  text (score,67,595);
  
  if (x >= x1 - 7.5 && x <= x1 + 7.5 && y + 40 >= y1 - 7.5 && y + 40 <= y1 + 7.5)  {  // Increases score if ball 1 is hit
  score += 3;
  rscore += 3;
  text (score,70,595);
  c1 = true;
  }
  if (x + 7 >= x1 - 7.5 && x + 7 <= x1 + 7.5 && y + 40 >= y1 - 7.5 && y + 40 <= y1 + 7.5)  {
  score += 1;
  rscore += 1;
  text (score,70,595);
  c1 = true;
  }
  if (x >= x2 - 7.5 && x <= x2 + 7.5 && y + 40 >= y2 - 7.5 && y + 40 <= y2 + 7.5)  {  // Increases score if ball 2 is hit
  score += 1;
  rscore += 1;
  text (score,70,595);
  c2 = true;
  }
  if (x + 7 >= x2 - 7.5 && x + 7 <= x2 + 7.5 && y + 40 >= y2 - 7.5 && y + 40 <= y2 + 7.5)  {
  score += 1;
  rscore += 1;
  text (score,70,595);
  c2 = true;
  }
   if (x >= x3 - 7.5 && x <= x3 + 7.5 && y + 40 >= y3 - 7.5 && y + 40 <= y3 + 7.5)  {  // Increases score if ball 3 is hit
  score += 1;
  rscore += 1;
  text (score,70,595);
  c3 = true;
  }
  if (x + 7 >= x3 - 7.5 && x + 7 <= x3 + 7.5 && y + 40 >= y3 - 7.5 && y + 40 <= y3 + 7.5)  {
  score += 1;
  rscore += 1;
  text (score,70,595);
  c3 = true;
  }
  if (x >= x4 - 7.5 && x <= x4 + 7.5 && y + 40 >= y4 - 7.5 && y + 40 <= y4 + 7.5)  {  // Increases score if ball 4 is hit
  score += 1;
  rscore += 1;
  text (score,70,595);
  c4 = true;
  }
  if (x + 7 >= x4 - 7.5 && x + 7 <= x4 + 7.5 && y + 40 >= y4 - 7.5 && y + 40 <= y4 + 7.5)  {
  score += 1;
  rscore += 1;
  text (score,70,595);
  c4 = true;
  }
  if (x >= x5 - 7.5 && x <= x5 + 7.5 && y + 40 >= y5 - 7.5 && y + 40 <= y5 + 7.5)  {  // Increases score if ball 5 is hit
  score += 1;
  rscore += 1;
  text (score,70,595);
  c5 = true;
  }
  if (x + 7 >= x5 - 7.5 && x + 7 <= x5 + 7.5 && y + 40 >= y5 - 7.5 && y + 40 <= y5 + 7.5)  {
  score += 1;
  rscore += 1;
  text (score,70,595);
  c5 = true;
  }     
  
  noFill();
  if (c1 == true)  {  // Expanding circles 'n things
  stroke (a1,b1,co1);
  ellipse (x1,y1,cx1,cy1);
  fill (a1,b1,co1);
  ellipse (x1,y1,15,15);
  noFill();
  cx1 += 3;
  cy1 += 3;
  a1 += 4;
  b1 += 5;
  co1 += 6;
  }
  if (c2 == true)  {
  stroke (a2,b2,co2);
  ellipse (x2,y2,cx2,cy2);
  fill (a2,b2,co2);
  ellipse (x2,y2,15,15);
  stroke (0,0,0);
  noFill();
  cx2 += 3;
  cy2 += 3;
  a2 += 4;
  b2 += 5;
  co2 += 6;
  }
  if (c3 == true)  {
  stroke (a3,b3,co3);
  ellipse (x3,y3,cx3,cy3);
  fill (a3,b3,co3);
  ellipse (x3,y3,15,15);
  stroke (0,0,0);
  noFill();
  cx3 += 3;
  cy3 += 3;
  a3 += 4;
  b3 += 5;
  co3 += 6;
  }
  if (c4 == true)  {
  stroke (a4,b4,co4);
  ellipse (x4,y4,cx4,cy4);
  fill (a4,b4,co4);
  ellipse (x4,y4,15,15);
  stroke (0,0,0);
  noFill();
  cx4 += 3;
  cy4 += 3;
  a4 += 4;
  b4 += 5;
  co4 += 6;
  }
  if (c5 == true)  {
  stroke (a5,b5,co5);
  ellipse (x5,y5,cx5,cy5);
  fill (a5,b5,co5);
  ellipse (x5,y5,15,15);
  stroke (0,0,0);
  noFill();
  cx5 += 3;
  cy5 += 3;
  a5 += 4;
  b5 += 5;
  co5 += 6;
  }
  
  if (cy1 >= 200)  {  // Stops the circles after a while
  c1 = false;
  x1 = random(630,710);
  y1 = random(500,600);
  cx1 = 1;
  cy1 = 1;
  a1 = a - 50;
  b1 = b - 50;
  co1 = c - 50;
  }
  if (cy2 >= 200)  {
  c2 = false;
  x2 = random(630,710);
  y2 = random(600);
  cx2 = 1;
  cy2 = 1;
  a2 = a - 50;
  b2 = b - 50;
  co2 = c - 50;
  }
  if (cy3 >= 200)  {
  c3 = false;
  x3 = random(630,710);
  y3 = random(600);
  cx3 = 1;
  cy3 = 1;
  a3 = a - 50;
  b3 = b - 50;
  co3 = c - 50;
  }
  if (cy4 >= 200)  {
  c4 = false;
  x4 = random(630,710);
  y4 = random(600);
  cx4 = 1;
  cy4 = 1;
  a4 = a - 50;
  b4 = b - 50;
  co4 = c - 50;
  }
  if (cy5 >= 200)  {
  c5 = false;
  x5 = random(630,710);
  y5 = random(600);
  cx5 = 1;
  cy5 = 1;
  a5 = a - 50;
  b5 = b - 50;
  co5 = c - 50;
  }
  
  if (a1 == a)  {  // Shading of targets
  a1 = a;
  }
  if (b1 == b)  {
  b1 = b;
  }
  if (co1 == c)  {
  co1 = c;
  }
  if (a2 == a)  {
  a2 = a;
  }
  if (b2 == b)  {
  b2 = b;
  }
  if (co2 == c)  {
  co2 = c;
  }
  if (a3 == a)  {
  a3 = a;
  }
  if (b3 == b)  {
  b3 = b;
  }
  if (co3 == c)  {
  co3 = c;
  }
  if (a4 == a)  {
  a4 = a;
  }
  if (b4 == b)  {
  b4 = b;
  }
  if (co4 == c)  {
  co4 = c;
  }
  if (a5 == a)  {
  a5 = a;
  }
  if (b5 == b)  {
  b5 = b;
  }
  if (co5 == c)  {
  co5 = c;
  }
  
  fill (255);
  text ("Shots Fired:",464,595);  // Shots fired
  text (sf,567,595);
  
  
  if (sf >= 1)  {  // XP bar data
  xp = rscore*1.5/rsf;
  }
  fill (255,0,0); 
  noStroke();
  rectMode (CENTER);
  rect (300,10,xpX,xpY);
  rect (300,10,70,14.7);
  noFill();
  if (rsf >= 10)  {
  xpX = xp*valuexpm;
  }
  if (xpX >= 150)  {
  fill (random(255));
  stroke (random(255));
  rect (300,10,xpX,xpY);
  fill (255);
  textSize (14);
  text ("PRESS ENTER",252,15);
  textSize (16);
  xpX = 150;
  }
  if (xpX < 150)  {
  fill (255);
  textSize (14);
  text ("  X P  ",278,15);
  textSize (16);
  }
  if (sf == 0)  {
  c1 = false;
  c2 = false;
  c3 = false;
  c4 = false;
  c5 = false;
  }
  
  if (bomb)  {  // Effects when XP is full
  timer -= 1;
  c1 = true;
  c2 = true;
  c3 = true;
  c4 = true;
  c5 = true;
  score += 1;
  }
  if (timer == 0)  {
  timer = 50;
  xpX = 1;
  rscore = 0;
  rsf = 0;
  bomb = false;
  }
  
  if (pause == false)  {  // Game timer
  ptimer -= .01;
  }
  if (ptimer >= 10 && upgrade == false)  {
  text (ptimer,572,20);
  } else { 
  text (ptimer,582,20);
  }
  text ("Time:",527,20);
  if (ptimer <= .006)  {
  upgrade = true;
  }
  if (ptimer <= 6 && ptimer > 5 && upgrade == false && start == false)  {
  noFill();
  stroke (random(255));
  rectMode (CORNER);
  rect (523,2,75,22);
  rectMode (CENTER);
  noStroke();
  }
  if (ptimer <= 4 && ptimer > 3 && upgrade == false && start == false)  {
  noFill();
  stroke (random(255));
  rectMode (CORNER);
  rect (523,2,75,22);
  rectMode (CENTER);
  noStroke();
  }
  if (ptimer <= 2 && ptimer > 1 && upgrade == false && start == false)  {
  noFill();
  stroke (random(255));
  rectMode (CORNER);
  rect (523,2,75,22);
  rectMode (CENTER);
  noStroke();
  }
  
  if (score > 0 && sf == 0)  {  // Glitch fix
  score = 0;
  }
  
  if (upgrade)  {  // Upgrades menu
  background (a,b,c);
  textSize (30);  // Text, movement, and shapes
  text ("Upgrades",225,50);
  text ("Money:",220,530);
  text (score,340,530);
  rectMode(CORNER);
  noStroke();
  rect (275,565,50,30);
  textSize (20);
  fill (0);
  text ("GO!",281,587);
  textSize (16);
  fill (255);
  noStroke();
  rect (20,100,96,50);
  rect (136,100,96,50);
  rect (252,100,96,50);
  rect (372,100,96,50);
  rect (488,100,96,50);
  fill (0);
  text ("Better Aim",23,130);
  text ("Time",163,123);
  text ("Increase",148,138);
  text ("Slower",273,123);
  text ("Whites",271,138);
  text ("Slower",393,123);
  text ("Greens",391,138);
  text ("X P",523,123);
  text ("Multiplier",498,138);
  fill (255);
  rect (20,170,96,250);
  rect (136,170,96,250);
  rect (252,170,96,250);
  rect (372,170,96,250);
  rect (488,170,96,250);
  fill (0);
  text ("Cost:",46,200);
  text ("Cost:",162,200);
  text ("Cost:",278,200);
  text ("Cost:",398,200);
  text ("Cost:",514,200);
  stroke (0);
  noFill();
  ellipse (68,300,10,10);
  ellipse (68,300,30,30);
  line (68,230,68,370);
  line (38,300,98,300);
  textSize (25);
  text ("+10",timex,timey);
  timey += 2;
  fill (255);
  ellipse (283,whiteb1,15,15);
  ellipse (316,whiteb2,15,15);
  whiteb2 -= whiteb1s;
  whiteb1 -= whiteb2s;
  fill (0,255,0);
  ellipse (407,greenb1,15,15);
  ellipse (433,greenb2,15,15);
  greenb2 -= greenb1s;
  greenb1 -= greenb2s;
  noStroke();
  fill (255,0,0);
  rectMode (CENTER);
  rect (536,260,xpa1,xpb1);
  rect (536,295,xpa2,xpb2);
  xpa1 += 1;
  xpa2 += 2;
  fill (255);
  textSize (15);
  text ("X P",523,265);
  text ("X P",523,300);
  fill (random(255));
  stroke (random(255));
  rect (536,350,70,15);
  fill (255);
  text ("Bam!",518,355);
  if (aimtf == false)  {
  noFill();
  stroke (0);
  rectMode (CORNER);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-50);
  line (mouseX,mouseY,mouseX-50,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+50);
  line (mouseX,mouseY,mouseX+50,mouseY);
  }
  if (aimtf == true)  {
  noFill();
  stroke (0);
  rectMode (CORNER);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-1000);
  line (mouseX,mouseY,mouseX-1000,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+1000);
  line (mouseX,mouseY,mouseX+1000,mouseY);
  noStroke();
  }
  loop();
  }
  
  if (timey >= 390)  {  // Animation ifs
  timey = 250;
  }
  if (whiteb1 >= 390)  {
  whiteb2s = -whiteb2s;
  }
  if (whiteb2 >= 390)  {
  whiteb1s = -whiteb1s;
  }
  if (whiteb1 < 250)  {
  whiteb2s = -whiteb2s;
  }
  if (whiteb2 < 250)  {
  whiteb1s = -whiteb1s;
  }
  if (greenb1 >= 390)  {
  greenb2s = -greenb2s;
  }
  if (greenb2 >= 390)  {
  greenb1s = -greenb1s;
  }
  if (greenb1 < 250)  {
  greenb2s = -greenb2s;
  }
  if (greenb2 < 250)  {
  greenb1s = -greenb1s;
  }
  if (xpa2 >= 70)  {
  xpa1 = 1;
  xpa2 = 1;
  }
  
  if (mouseX>=15&&mouseX<=15+96+5&&mouseY>=95&&mouseY<=95+20+50+250+5&&upgrade==true&&aimtf==false)  {  // Green squares
  stroke (0,255,0);
  rect (15,95,106,330);
  } 
  if (mouseX>=131&&mouseX<=131+96+5&&mouseY>=95&&mouseY<=95+20+50+250+5&&upgrade==true)  {
  stroke (0,255,0);
  rect (131,95,106,330);
  } 
  if (mouseX>=247&&mouseX<=247+96+5&&mouseY>=95&&mouseY<=95+20+50+250+5&&upgrade==true)  {
  stroke (0,255,0);
  rect (247,95,106,330);
  } 
  if (mouseX>=367&&mouseX<=367+96+5&&mouseY>=95&&mouseY<=95+20+50+250+5&&upgrade==true)  {
  stroke (0,255,0);
  rect (367,95,106,330);
  } 
  if (mouseX>=483&&mouseX<=483+96+5&&mouseY>=95&&mouseY<=95+20+50+250+5&&upgrade==true)  {
  stroke (0,255,0);
  rect (483,95,106,330);
  }
  
  if (mouseX>=15&&mouseX<=15+96+5&&mouseY>=95&&mouseY<=95+20+50+250+5&&score < aim && upgrade == true)  {  // Red squares
  stroke (255,0,0);
  rect (15,95,106,330);
  }
  if (mouseX>=131&&mouseX<=131+96+5&&mouseY>=95&&mouseY<=95+20+50+250+5&&score < add10 && upgrade == true)  {
  stroke (255,0,0);
  rect (131,95,106,330);
  }
  if (mouseX>=247&&mouseX<=247+96+5&&mouseY>=95&&mouseY<=95+20+50+250+5&&score < whiteb && upgrade == true)  {
  stroke (255,0,0);
  rect (247,95,106,330);
  }
  if (mouseX>=367&&mouseX<=367+96+5&&mouseY>=95&&mouseY<=95+20+50+250+5&&score < greenb && upgrade == true)  {
  stroke (255,0,0);
  rect (367,95,106,330);
  }
  if (mouseX>=483&&mouseX<=483+96+5&&mouseY>=95&&mouseY<=95+20+50+250+5&&score < xpm && upgrade == true)  {
  stroke (255,0,0);
  rect (483,95,106,330);
  }
  
  if (mouseX>=275&&mouseX<=325&&mouseY>=565&&mouseY<=595&&upgrade==true)  {  // GO! button
  fill (0);
  rect (275,565,50,30);
  fill (255);
  textSize (20);
  text ("GO!",281,587);
  textSize (16);
  }
  
  if (aim < 100 && upgrade == true)  { // Writes costs 
  fill (0);
  textSize (16);
  text (aim,57,220);
  }
  if (aim >= 100 && upgrade == true)  {
  fill (255);
  textSize (16);
  text (aim,53,220);
  noFill();
  stroke (0);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-50);
  line (mouseX,mouseY,mouseX-50,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+50);
  line (mouseX,mouseY,mouseX+50,mouseY);
  }
  if (add10 < 100 && upgrade == true)  {
  fill (0);
  textSize (16);
  text (add10,172,220);
  }
  if (add10 >= 100 && upgrade == true)  {
  fill (0);
  textSize (16);
  text (add10,168,220);
  }
  if (upgrade)  {
  fill (0);
  textSize (16);
  text (whiteb,284,220);
  text (greenb,404,220);
  text (xpm,520,220);
  }
  
  if (aim >= 1000)  {  // Limits (of different things)
  aim = 1000;
  }
  if (add10 >= 1000)  {
  add10 = 1000;
  }
  if (whiteb >= 1000)  {
  whiteb = 1000;
  }
  if (greenb >= 1000)  {
  greenb = 1000;
  }
  if (xpm >= 1000)  {
  xpm = 1000;
  }
  if (score <= 0)  {
  score = 0;
  }
  if (speed >= 5)  {
  speed = 5;
  }
  if (gspeed >= 8)  {
  gspeed = 8;
  }
  if (speed > -2)  {
  speed = -2;
  }
  if (gspeed > -5)  {
  gspeed = -5;
  }
  if (rsf <= 0)  {
  rsf = 0;
  }
  if (sf <= 0)  {
  sf = 0;
  }
  
  if (speed >= 4 && score <= 40)  {  // The Dad Factor
  speed = -2;
  gspeed = -5;
  }
  
  if (restart==true&&aimtf==false&&start==false)  {  // Restart menu
  rectMode (CENTER);
  upgrade = false;
  fill (255);
  stroke (0);
  rect (300,300,300,300);
  stroke (0);
  fill (255);
  rect (300,300,70,50);
  rect (300,360,70,50);
  fill (0);
  textSize (16);
  text ("Are you sure you want to restart?",162,200);
  text ("Your progress will be lost.",190,230);
  text ("YES",284,306);
  text ("NO",289,366);
  noFill();
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-50);
  line (mouseX,mouseY,mouseX-50,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+50);
  line (mouseX,mouseY,mouseX+50,mouseY);
  }
  if (mouseX>=265&&mouseX<=335&&mouseY>=275&&mouseY<=325&&restart==true&&aimtf==false&&start==false)  {
  fill (0);
  stroke (255);
  rect (300,300,70,50);
  fill (255);
  text ("YES",284,306);
  noFill();
  stroke (0);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-50);
  line (mouseX,mouseY,mouseX-50,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+50);
  line (mouseX,mouseY,mouseX+50,mouseY);
  }
  if (mouseX>=265&&mouseX<=335&&mouseY>=335&&mouseY<=385&&restart==true&&aimtf==false&&start==false)  {
  fill (0);
  stroke (255);
  rect (300,360,70,50);
  fill (255);
  text ("NO",289,366);
  noFill();
  stroke (0);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-50);
  line (mouseX,mouseY,mouseX-50,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+50);
  line (mouseX,mouseY,mouseX+50,mouseY);
  }
  if (restart==true&&aimtf==true&&upgrade==false&&start==false)  {
  rectMode (CENTER);
  upgrade = false;
  fill (255);
  stroke (0);
  rect (300,300,300,300);
  stroke (0);
  fill (255);
  rect (300,300,70,50);
  rect (300,360,70,50);
  fill (0);
  textSize (16);
  text ("Are you sure you want to restart?",162,200);
  text ("Your progress will be lost.",190,230);
  text ("YES",284,306);
  text ("NO",289,366);
  noFill();
  stroke (0);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-1000);
  line (mouseX,mouseY,mouseX-1000,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+1000);
  line (mouseX,mouseY,mouseX+1000,mouseY);
  noStroke();
  }
  if (mouseX>=265&&mouseX<=335&&mouseY>=275&&mouseY<=325&&restart==true&&aimtf==true&&upgrade==false&&start==false)  {
  fill (0);
  stroke (255);
  rect (300,300,70,50);
  fill (255);
  text ("YES",284,306);
  noFill();
  stroke (0);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-1000);
  line (mouseX,mouseY,mouseX-1000,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+1000);
  line (mouseX,mouseY,mouseX+1000,mouseY);
  noStroke();
  }
  if (mouseX>=265&&mouseX<=335&&mouseY>=335&&mouseY<=385&&restart==true&&aimtf==true&&upgrade==false&&start==false)  {
  fill (0);
  stroke (255);
  rect (300,360,70,50);
  fill (255);
  text ("NO",289,366);
  noFill();
  stroke (0);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-1000);
  line (mouseX,mouseY,mouseX-1000,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+1000);
  line (mouseX,mouseY,mouseX+1000,mouseY);
  noStroke();
  }
 
  rectMode (CENTER);  // Help box that slides down
  fill (255);
  noStroke();
  rect (helpx,helpy,100,250);
  fill (0);
  textSize (16);
  text ("HELP",helpx-18,helpy+123);
  text ("p to pause",helpx-44,helpy+90);
  text ("r to restart",helpx-44,helpy+60);
  if (mouseX>=helpx-50&&mouseX<=helpx+50&&mouseY>=helpy&&mouseY<=helpy+125)  {
  helpy += 5;
  }
  if (helpy >= -30)  {
  helpy = -30;
  }
  if (mouseX<helpx-50&&mouseY>helpy+125||mouseX<helpx-50&&mouseY<helpy+125)  {
  helpy -= 5;
  }
  if (mouseX>helpx+50&&mouseY>helpy+125||mouseX>helpx+50&&mouseY<helpy+125)  {
  helpy -= 5;
  }
  if (mouseX>helpx-50&&mouseX<helpx+50&&mouseY>helpy+125)  {
  helpy -= 5;
  }
  if (helpy <= -109)  {
  helpy = -109;
  }
  
  if (start == true)  {  // Starting menu
  background (a,b,c);
  speed = -2;
  gspeed = -5;
  textAlign (CENTER);
  fill (255);
  textSize (40);
  text ("Bullet",300,60);
  rect (300,150,200,100);
  rect (300,280,200,100);
  rect (300,410,200,100);
  textSize (25);
  fill (0);
  text ("PLAY",300,156);
  text ("HELP",300,286);
  text ("CHEATS",300,416);
  if (mouseX >= 200 && mouseX <= 400 && mouseY >= 100 && mouseY <= 200)  {  // Highlights the boxes
  fill (0);
  rect (300,150,200,100);
  fill (255);
  text ("PLAY",300,156);
  }
  if (mouseX >= 200 && mouseX <= 400 && mouseY >= 230 && mouseY <= 330)  {
  textSize (25);
  fill (0);
  rect (300,280,200,100);
  fill (255);
  text ("HELP",300,286);
  }
  if (mouseX >= 200 && mouseX <= 400 && mouseY >= 360 && mouseY <= 460)  {
  fill (0);
  rect (300,410,200,100);
  fill (255);
  text ("CHEATS",300,416);
  }
  valuexpm = 70;
  xp = 1;
  xpX = 1;
  xpY = 15;
  aim = 50;
  add10 = 70;
  whiteb = 100;
  greenb = 130;
  xpm = 150;
  textSize (30);
  fill (255);
  text ("By Trevor Phillips",300,550);
  fill (0,255,0);
  ellipse (x1,y1,15,15);
  fill (255);
  ellipse (x2,y2,15,15);
  ellipse (x3,y3,15,15);
  ellipse (x4,y4,15,15);
  ellipse (x5,y5,15,15);
  x1 += gspeed;
  x2 += speed;
  x3 += speed;
  x4 += speed;
  x5 += speed;
  noFill();
  stroke (0);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-50);
  line (mouseX,mouseY,mouseX-50,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+50);
  line (mouseX,mouseY,mouseX+50,mouseY);
  }
  
  if (instructions1)  {  // The instructions, page 1
  background (a,b,c);
  fill (255);
  textAlign (CENTER);
  textSize (40);
  text ("Instructions",300,60);
  textSize (25);
  text ("Hit the targets as they move by",300,120);
  text ("Use your mouse to aim, and click to fire",300,170);
  text ("They will get faster after each round",300,220);
  text ("If you hit them you will get money",300,270);
  text ("The green is worth more, because it is faster",300,320);
  text ("P to pause",300,370);
  text ("R to restart",300,420);
  textSize (10);
  fill (255);
  text ("1/3",300,570);
  noStroke();
  rect (300,500,100,50);
  textSize (17);
  fill (0);
  text ("Next",300,505);
  if (mouseX >= 250 && mouseX <= 350 && mouseY >= 475 && mouseY <= 525)  {
  fill (0);
  rect (300,500,100,50);
  fill (255);
  text ("Next",300,505);
  }
  fill (0,255,0);
  ellipse (x1,y1,15,15);
  fill (255);
  ellipse (x2,y2,15,15);
  ellipse (x3,y3,15,15);
  ellipse (x4,y4,15,15);
  ellipse (x5,y5,15,15);
  x1 += gspeed;
  x2 += speed;
  x3 += speed;
  x4 += speed;
  x5 += speed;
  noFill();
  stroke (0);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-50);
  line (mouseX,mouseY,mouseX-50,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+50);
  line (mouseX,mouseY,mouseX+50,mouseY);
  if (glitchfix3 == true && aimtf == true)  {
  noFill();
  stroke (0);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-1000);
  line (mouseX,mouseY,mouseX-1000,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+1000);
  line (mouseX,mouseY,mouseX+1000,mouseY);
  }
  }
  if (instructions2)  {
  background (a,b,c);
  fill (255);
  textAlign (CENTER);
  textSize (40);
  text ("Instructions",300,60);
  textSize (25);
  text ("You can get X P by playing well",300,120);
  text ("If you hit more targets than you miss...",300,170);
  text ("The X P bar will start flashing",300,220);
  text ("Then press ENTER to get a big money bonus",300,270);
  text ("This can really help you out",300,320);
  text ("X P",300,390);
  fill (random(255));
  stroke (random(255));
  rect (300,390,200,50);
  fill (255);
  textSize (38);
  text ("X P",300,405);
  textSize (10);
  fill (255);
  text ("2/3",300,570);
  noStroke();
  rect (300,500,100,50);
  textSize (17);
  fill (0);
  text ("Next",300,505);
  if (mouseX >= 250 && mouseX <= 350 && mouseY >= 475 && mouseY <= 525)  {
  fill (0);
  rect (300,500,100,50);
  fill (255);
  text ("Next",300,505);
  }
  fill (0,255,0);
  ellipse (x1,y1,15,15);
  fill (255);
  ellipse (x2,y2,15,15);
  ellipse (x3,y3,15,15);
  ellipse (x4,y4,15,15);
  ellipse (x5,y5,15,15);
  x1 += gspeed;
  x2 += speed;
  x3 += speed;
  x4 += speed;
  x5 += speed;
  noFill();
  stroke (0);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-50);
  line (mouseX,mouseY,mouseX-50,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+50);
  line (mouseX,mouseY,mouseX+50,mouseY);
  if (glitchfix3 == true && aimtf == true)  {
  noFill();
  stroke (0);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-1000);
  line (mouseX,mouseY,mouseX-1000,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+1000);
  line (mouseX,mouseY,mouseX+1000,mouseY);
  }
  }
  if (instructions3)  {
  background (a,b,c);
  fill (255);
  textAlign (CENTER);
  textSize (40);
  text ("Instructions",300,60);
  textSize (25);
  text ("Finally, there is the Upgrades menu",300,120);
  text ("It appears after each time session",300,170);
  text ("Buy things to help you out in the next round",300,220);
  text ("They do get more expensive, though",300,270);
  text ("*You can only buy the aim upgrade once",300,320);
  text ("Good Luck!",300,370);
  textSize (10);
  fill (255);
  text ("3/3",300,570);
  noStroke();
  rect (300,500,100,50);
  textSize (17);
  fill (0);
  text ("Back",300,505);
  if (mouseX >= 250 && mouseX <= 350 && mouseY >= 475 && mouseY <= 525)  {
  fill (0);
  rect (300,500,100,50);
  fill (255);
  text ("Back",300,505);
  }
  fill (0,255,0);
  ellipse (x1,y1,15,15);
  fill (255);
  ellipse (x2,y2,15,15);
  ellipse (x3,y3,15,15);
  ellipse (x4,y4,15,15);
  ellipse (x5,y5,15,15);
  x1 += gspeed;
  x2 += speed;
  x3 += speed;
  x4 += speed;
  x5 += speed;
  noFill();
  stroke (0);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-50);
  line (mouseX,mouseY,mouseX-50,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+50);
  line (mouseX,mouseY,mouseX+50,mouseY);
  if (glitchfix3 == true && aimtf == true)  {
  noFill();
  stroke (0);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-1000);
  line (mouseX,mouseY,mouseX-1000,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+1000);
  line (mouseX,mouseY,mouseX+1000,mouseY);
  }
  }
  
  if (cheats)  {  // CHEATS!!!
  background (a,b,c);
  fill (255);
  textAlign (CENTER);
  textSize (40);
  text ("Cheats",300,60);
  textSize (25);
  text ("Well, what are they?",300,120);
  noStroke();
  rect (300,500,100,50);
  textSize (17);
  fill (0);
  text ("Back",300,505);
  if (mouseX >= 250 && mouseX <= 350 && mouseY >= 475 && mouseX <= 525)  {
  fill (0);
  rect (300,500,100,50);
  fill (255);
  text ("Back",300,505);
  }
  if (cheat11 == true && cheat12 == true && cheats == true)  {
  textSize (25);
  fill (255);
  text ("37!",300,200);
  text ("Unlimited Money",300,250);
  fill (225);
  rect (100,225,50,20);
  rect (500,225,50,20);
  fill (0);
  textSize (18);
  text ("ON",100,231);
  text ("OFF",500,231);
  }
  if (cheat21 == true && cheat22 == true && cheats == true)  {
  textSize (25);
  fill (255);
  text ("Trevor Phillips!",300,340);
  text ("Always slow targets",300,390);
  fill (225);
  rect (100,365,50,20);
  rect (500,365,50,20);
  fill (0);
  textSize (18);
  text ("ON",100,371);
  text ("OFF",500,371);
  }
  if (cheat1 == true && cheat11 == true && cheat12 == true)  {
  fill (0);
  rect (100,225,50,20);
  fill (255);
  rect (500,225,50,20);
  fill (255);
  textSize (18);
  text ("ON",100,231);
  fill (0);
  text ("OFF",500,231);
  }
  if (cheat1 == false && cheat11 == true && cheat12 == true)  {
  fill (255);
  rect (100,225,50,20);
  fill (0);
  rect (500,225,50,20);
  fill (0);
  textSize (18);
  text ("ON",100,231);
  fill (255);
  text ("OFF",500,231);
  }
  if (cheat2 == true && cheat21 == true && cheat22 == true)  {
  fill (0);
  rect (100,365,50,20);
  fill (255);
  rect (500,365,50,20);
  fill (255);
  textSize (18);
  text ("ON",100,371);
  fill (0);
  text ("OFF",500,371);
  }
  if (cheat2 == false && cheat21 == true && cheat22 == true)  {
  fill (255);
  rect (100,365,50,20);
  fill (0);
  rect (500,365,50,20);
  fill (0);
  textSize (18);
  text ("ON",100,371);
  fill (255);
  text ("OFF",500,371);
  }
  noStroke();
  fill (0,255,0);
  ellipse (x1,y1,15,15);
  fill (255);
  ellipse (x2,y2,15,15);
  ellipse (x3,y3,15,15);
  ellipse (x4,y4,15,15);
  ellipse (x5,y5,15,15);
  x1 += gspeed;
  x2 += speed;
  x3 += speed;
  x4 += speed;
  x5 += speed;
  noFill();
  stroke (0);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-50);
  line (mouseX,mouseY,mouseX-50,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+50);
  line (mouseX,mouseY,mouseX+50,mouseY);
  }
  
  if (glitchfix)  {
  instructions2 = true;
  }
  if (glitchfix2)  {
  instructions3 = true;
  }
  if (start == false)  {
  textAlign (LEFT);
  }
  
  if (restart == true)  {  // Removes the restart menu
  unrestart = true;
  }
  
  if (cheat1)  {  // Cheat effects
  score = 10000;
  }
  if (cheat2)  {
  speed = -2;
  gspeed = -5;
  }
  
  if (pause)  {  // The pause menu
  background (a,b,c);
  bullet = false;
  textSize (40);
  textAlign (CENTER);
  fill (255);
  text ("Paused",300,60);
  rect (300,150,200,100);
  rect (300,280,200,100);
  rect (300,410,200,100);
  fill (0);
  textSize (25);
  text ("RESUME",300,156);
  text ("HELP",300,286);
  text ("QUIT",300,416);
  textSize (30);
  fill (255);
  text ("(P to unpause)",300,550);
  if (mouseX >= 200 && mouseX <= 400 && mouseY >= 100 && mouseY <= 200)  {  // Highlights the boxes
  fill (0);
  rect (300,150,200,100);
  fill (255);
  text ("RESUME",300,156);
  }
  if (mouseX >= 200 && mouseX <= 400 && mouseY >= 230 && mouseY <= 330)  {
  textSize (25);
  fill (0);
  rect (300,280,200,100);
  fill (255);
  text ("HELP",300,286);
  }
  if (mouseX >= 200 && mouseX <= 400 && mouseY >= 360 && mouseY <= 460)  {
  fill (0);
  rect (300,410,200,100);
  fill (255);
  text ("QUIT",300,416);
  }
  noStroke();
  fill (0,255,0);
  ellipse (x1,y1,15,15);
  fill (255);
  ellipse (x2,y2,15,15);
  ellipse (x3,y3,15,15);
  ellipse (x4,y4,15,15);
  ellipse (x5,y5,15,15);
  x1 += gspeed;
  x2 += speed;
  x3 += speed;
  x4 += speed;
  x5 += speed;
  if (aimtf == false)  {
  noFill();
  stroke (0);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-50);
  line (mouseX,mouseY,mouseX-50,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+50);
  line (mouseX,mouseY,mouseX+50,mouseY);
  }
  if (aimtf)  {
  noFill();
  stroke (0);
  ellipse (mouseX,mouseY,50,50);
  ellipse (mouseX,mouseY,10,10);
  line (mouseX,mouseY,mouseX,mouseY-1000);
  line (mouseX,mouseY,mouseX-1000,mouseY);
  line (mouseX,mouseY,mouseX,mouseY+1000);
  line (mouseX,mouseY,mouseX+1000,mouseY);
  }
  }
  if (pause)  {
  unpause = true;
  }
}

void mousePressed()
{
  if (y == 650 && upgrade == false && start == false && pause == false && !instructions1 && !instructions2 && !instructions3)  {  // Puts the bullet back at the top of the screen
  bullet = true;
  redraw();
  y = -40;
  sf += 1;
  rsf += 1;
  text (sf,570,595);
  }
 
  if (!bullet && upgrade == false && start == false && pause == false && !instructions1 && !instructions2 && !instructions3)  {  // Bullet stuff :-)
  bullet = true;
  redraw();
  y = -40;
  sf += 1;
  rsf += 1;
  text (sf,570,595);
  }
  
  if (mouseX >= 200 && mouseX <= 400 && mouseY >= 100 && mouseY <= 200 && start == true&&!cheats&&!instructions1&&!instructions2&&!instructions3)  {  // STARTS THE GAME!! W00t!!
  start = false;
  bullet = false;
  sf = 0;
  rsf = 0;
  if (cheat11 == false)  {
  score = 0;
  }
  if (cheat12 == false)  {
  score = 0;
  }
  ptimer = addtime;
  addtime = 30;
  speed = -2;
  gspeed = -5;
  x1 = random(630,710);  // Targets x-coordinate
  x2 = random(630,710);
  x3 = random(630,710);
  x4 = random(630,710);
  x5 = random(630,710);
  y1 = random(500,600);  // Targets y-coordinate
  y2 = random(600);
  y3 = random(600);
  y4 = random(600);
  y5 = random(600);
  restart = false;
  unrestart = false;
  pause = false;
  unpause = false;
  }
  
  if (mouseX >= 200 && mouseX <= 400 && mouseY >= 360 && mouseY <= 460 && start == true && !instructions1 && !instructions2 && !instructions3)  {  // Cheats button
  cheats = true;
  }
  if (cheats == true && cheat11 == true && cheat12 == true && mouseX >= 75 && mouseX <= 125 && mouseY >= 215 && mouseY <= 235)  {  // ON / OFF buttons
  cheat1 = true;
  }
  if (cheats == true && cheat11 == true && cheat12 == true && mouseX >= 475 && mouseX <= 525 && mouseY >= 215 && mouseY <= 235)  {
  cheat1 = false;
  }
  if (cheats == true && cheat21 == true && cheat22 == true && mouseX >= 75 && mouseX <= 125 && mouseY >= 355 && mouseY <= 375)  {
  cheat2 = true;
  }
  if (cheats == true && cheat21 == true && cheat22 == true && mouseX >= 475 && mouseX <= 525 && mouseY >= 355 && mouseY <= 375)  {
  cheat2 = false;
  }
  
  if (mouseX >= 250 && mouseX <= 350 && mouseY >= 475 && mouseY <= 525 && instructions1 == true && start == true)  {  // "Next" button
  glitchfix = true;
  }
  if (mouseX >= 250 && mouseX <= 350 && mouseY >= 475 && mouseY <= 525 && instructions2 == true && start == true)  {
  glitchfix2 = true;
  }
  if (mouseX >= 250 && mouseX <= 350 && mouseY >= 475 && mouseY <= 525 && instructions3 == true && start == true && glitchfix3 == false)  {
  instructions1 = false;
  instructions2 = false;
  instructions3 = false;
  glitchfix = false;
  glitchfix2 = false;
  start = true;
  }
  if (mouseX >= 250 && mouseX <= 350 && mouseY >= 475 && mouseX <= 525 && instructions3 == true && start == true && glitchfix3 == true)  {
  pause = true;
  start = false;
  instructions1 = false;
  instructions2 = false;
  instructions3 = false;
  glitchfix = false;
  glitchfix2 = false;
  glitchfix3 = false;
  }
  
  
  if (mouseX >= 250 && mouseX <= 350 && mouseY >= 475 && mouseX <= 525 && cheats == true)  {
  cheats = false;
  }
  
  if (mouseX >= 200 && mouseX <= 400 && mouseY >= 230 && mouseY <= 330 && start == true && !cheats && !instructions1 && !instructions2 && !instructions3)  {  // Instructions page
  instructions1 = true;
  }
  
  if (mouseX>=275&&mouseX<=325&&mouseY>=565&&mouseY<=595&&upgrade==true)  {  // GO! button
  upgrade = false;
  ptimer = 30;
  bullet = false;
  background (a,b,c);
  a += color1;
  b += color2;
  c += color3;
  x1 += gspeed;
  x2 += speed;
  x3 += speed;
  x4 += speed;
  x5 += speed;
  speed -= 1;
  speed = speed;
  gspeed -= 1;
  gspeed = gspeed;
  ptimer = addtime;
  }
  
  if (mouseX >= 200 && mouseX <= 400 && mouseY >= 100 && mouseY <= 200 && pause == true)  {  // Pause buttons
  pause = false;
  unpause = false;
  }
  if (mouseX >= 200 && mouseX <= 400 && mouseY >= 230 && mouseY <= 330 && pause == true)  {
  instructions1 = true;
  start = true;
  pause = false;
  cheats = false;
  glitchfix3 = true;
  }
  if (mouseX >= 200 && mouseX <= 400 && mouseY >= 360 && mouseY <= 460 && pause == true)  {
  cheats = false;
  pause = false;
  start = true;
  }
  
  if (mouseX>=15&&mouseX<=15+96+5&&mouseY>=95&&mouseY<=95+20+50+250+5&&score >= aim && upgrade == true)  {  // Initiates upgrade effects
  aim = aim*2;
  score -= aim/2;
  textSize (30);
  text (score,340,530);
  aimtf = true;
  }
  if (mouseX>=131&&mouseX<=131+96+5&&mouseY>=95&&mouseY<=95+20+50+250+5&&score >= add10 && upgrade == true)  {
  add10 = add10*2;
  text (add10,172,220);
  score -= add10/2;
  textSize (30);
  text (score,340,530);
  addtime += 10;
  addtime = addtime;
  }
  if (mouseX>=247&&mouseX<=247+96+5&&mouseY>=95&&mouseY<=95+20+50+250+5&&score >= whiteb && upgrade == true)  {
  whiteb = whiteb*2;
  text (whiteb,284,220);
  score -= whiteb/2;
  textSize (30);
  text (score,340,530);
  speed = -2;
  }
  if (mouseX>=367&&mouseX<=367+96+5&&mouseY>=95&&mouseY<=95+20+50+250+5&&score >= greenb && upgrade == true)  {
  greenb = greenb*2;
  text (greenb,404,220);
  score -= greenb/2;
  textSize (30);
  text (score,340,530);
  gspeed = -5;
  }
  if (mouseX>=483&&mouseX<=483+96+5&&mouseY>=95&&mouseY<=95+20+50+250+5&&score >= xpm && upgrade == true)  {
  xpm = xpm*2;
  text (xpm,520,220);
  score -= xpm/2;
  textSize (30);
  text (score,340,530);
  valuexpm += 10;
  valuexpm = valuexpm;
  }
  
  if (mouseX>=265&&mouseX<=335&&mouseY>=275&&mouseY<=325&&restart==true&&start==false)  {  // Yes, restart button
  color1 = 1;
  color2 = 2;
  color3 = 3;
  a = 0;
  b = 0;
  c = 0;
  loop();
  background (a,b,c);
  a += color1;
  b += color2;
  c += color3;
  speed = -2;
  gspeed = -5;
  sf = 0;
  score = 0;
  rsf = 0;
  rscore = 0;
  x1 = random(630,710);
  x2 = random(630,710);
  x3 = random(630,710);
  x4 = random(630,710);
  x5 = random(630,710);
  y1 = random(500,600); 
  y2 = random(600);
  y3 = random(600);
  y4 = random(600);
  y5 = random(600);
  xp = 1;
  c1 = false;
  c2 = false;
  c3 = false;
  c4 = false;
  c5 = false;
  aimtf = false;
  upgrade = false;
  ptimer = addtime;
  addtime = 30;
  restart = false;
  unrestart = false;
  bullet = false;
  sf -= 1;
  sf = sf;
  rsf -= 1;
  rsf = rsf;
  valuexpm = 70;
  xp = 1;
  xpX = 1;
  xpY = 15;
  aim = 50;
  add10 = 70;
  whiteb = 100;
  greenb = 130;
  xpm = 150;
  }
  if (mouseX>=265&&mouseX<=335&&mouseY>=335&&mouseY<=385&&restart==true)  {  // No, restart button
  restart = false;
  unrestart = false;
  cheats = false;
  bullet = false;
  sf -= 1;
  sf = sf;
  rsf -= 1;
  rsf = rsf;
  }
}

void keyPressed()
{
  if (keyCode == ENTER && xpX == 150)  {  // Releases the bomb
  bomb = true;
  }
  
  if (key == 'r')  {  // Restart button
  restart = true;
  }
  if (key == 'r' && unrestart == true)  {
  restart = false;
  unrestart = false;
  }
  
  if (cheats == true && key == '3' && cheat12 == false)  {  // Cheats
  cheat11 = true;
  }
  if (cheats == true  && key == '7' && cheat11 == true)  {
  cheat12 = true;
  }
  if (cheats == true && key == 't' && cheat22 == false)  {
  cheat21 = true;
  }
  if (cheats == true && key == 'p' && cheat21 == true)  {
  cheat22 = true;
  }
 
  if (start == false && key == 'p')  {  // Pause button
  pause = true;
  }
  if (start == false && key == 'p' && unpause == true)  {
  pause = false;
  unpause = false;
  }
}





