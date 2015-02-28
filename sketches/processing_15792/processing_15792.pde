
/*
 * by Feng Li
 * 11/3/10
 */

// keypress tracking
boolean wPressed, aPressed, sPressed, dPressed;
Bubble[] b;

// coordinates
int x, y;
int u, v;
float Y;
float prizeX, prizeY;
float prizeX2, prizeY2;
float prizeX3, prizeY3;

// other stuff
int screenNumber;
int aScore, bScore;
int speed;
PFont font;
PImage clover;
PImage cover;
PImage horse;
PImage leaf;
int startTime;

void setup()
{
  size(750, 750);
  //colorMode(RGB, 255, 255, 255, 100);
  //fill(0);
  smooth();
  noStroke();
  
  {
  smooth();
  stroke(240);
  fill(255,50);

  b = new Bubble[400];
  for(int i=0; i<400; i++)
  {
    b[i] = new Bubble();
    b[i].x = random(-width,width*2);
    b[i].y = random(-height,height*2);
    b[i].d = (int)random(10,20);
    b[i].v = (int)random(1,10);
    b[i].c = color(255, 255, 0);
  }
    b[88].c = color(0,255,127);
    for(int j=0; j<36; j++)
    {
   
  b[j].c = color(255, 0, 0);
    }
}
  rectMode(CENTER);
  font = loadFont("Broadway-45.vlw");
  clover = loadImage("clover.gif");
  cover = loadImage("cover.gif");
  horse = loadImage("horse.gif");
  leaf = loadImage("leaf.gif");
  textFont(font, 32);

  x = y = width/4;
  u = v = 3*width/4;
  prizeX = prizeY = width/2;
  prizeX2 = prizeY2 = width/3;
  prizeX3 = prizeY3 = width/4;
  screenNumber = 0;
}

void draw()
{
   println(Y);
Y = Y+1;
if (Y > 300)
{
  Y=0;
}

  background(0,mouseX,mouseY);
  background (0);
  //background(random(0,255), random(0,255), random(0,255));
  //colorMode(RGB, 255, 255, 255, 100);
  fill(0);
  if (screenNumber == 0)
  {

    image(cover,0,0);
    displayInstructions();
     if(mousePressed)
  {
    screenNumber = 1;
      startTime = millis();
      println(startTime);
    }
  }
  else if (screenNumber == 1)
  {

    movePlayers();
    drawPlayers();
    
    checkPrize();
    drawPrize();
    
    
    setSpeedLevel();
    displayScore();
     int m = millis();
    int timeLimit = startTime+60000;
    int timeRemaining = timeLimit - m;
    int secondsRemaining = timeRemaining/1000;

    text(secondsRemaining, 610,40);
    if (secondsRemaining <= 0) screenNumber =3;
  }
  else if (screenNumber == 2)
  {
    
    displayWinner();
  }
  else if (screenNumber == 3)
  {
    displayTimeout();
  }
  
  for(int i=0; i<b.length; i++)
  {
    b[i].move();
    b[i].show();
  }
}

class Bubble
{
  float x, y;
  int d, v;
  color c;

  void show()
  {
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(x,y, d,d);
    fill(c);
  }
 
void move()
  {
    x += ( mouseX - width/2  ) * 0.01 * v;
    y += ( mouseY - height/2 ) * 0.01 * v;
  }
}


void displayWinner()
{
  aScore = 0;
  bScore = 0;
  fill(0, 200, 0);
  text("You win XD", 50, 100);
  if (mousePressed) screenNumber = 0;
}

void displayTimeout()
{
  fill(0, 200, 0);
  image (leaf, 220, 200);
  if (keyCode ==ENTER) 
  {screenNumber = 0; 
  }
}

void displayInstructions()
{
  fill(255);
  text("Click to START!!!", 250, 100);
  if (mousePressed) screenNumber = 1;
}

void displayScore()
{
  fill(255);
  text("Score: " + aScore, 10, 40);
  text("Time: ", 500, 40);
  text("Goal:>50 ", 250, 50); 
  
  if(aScore > 50)
  {
    screenNumber=0;
  }
  if(aScore>50 && mousePressed)
  {
    screenNumber=1;
    aScore=0;
  }
}

void setSpeedLevel()
{
  speed = 15;
  if(aScore>50 || bScore>40) speed = 8;
}

void drawPrize()
{
  fill(0,200,0);
  image( clover, prizeX-5, prizeY-5);
  image( clover, prizeX-55, prizeY-55);

}


void checkPrize()
{
  if(abs(x - prizeX) < 15 && abs(y - prizeY) < 15)
  {
    aScore += 5;
    placePrizeRandomly();
  }
  if(abs(u - prizeX) < 15 && abs(v - prizeY) < 15)
  {
    bScore += 15;
    
  placePrizeRandomly();
}

  prizeY = prizeY +1;
   prizeY2 = prizeY +3;
  if(prizeY > height) prizeY = 0;
}

void placePrizeRandomly()
{
  prizeX = random(width);
  prizeY = random(height);
}

void drawPlayers()
{
  
  fill(128);
    image(horse, x-40,y-38, 80,90); 
 
     fill(255, 40);
  ellipse(x,y, 20,20);
    fill(40,205,50);
  ellipse(X+150,Y+486, 5, 26);
  fill(255, 200,147);
  ellipse(X+200, Y+306, 5, 26);
  fill(238, 130,238);
  ellipse(X+380, Y+200, 5, 26);
  fill(255,255,0);
  ellipse(X+480, Y+100, 5, 26);
  fill(0,255,255);
  ellipse(X+150, Y+260, 5, 26);
  fill(255,140,0);
  ellipse(X+190,Y+230,5,26);
  fill(100, 149, 237);
  ellipse(X+90, Y+100, 5, 26);
  fill(124, 252, 0);
  ellipse(X+300, Y+260, 5, 30);
  fill(160, 32, 240);
  ellipse(X+210, Y+100, 6, 26);
  fill(238, 130, 238);
  ellipse(X+550, Y+150, 5, 25);
  fill(147, 112, 219);
  ellipse(X+475, Y+200, 6, 26);
  fill(124, 252, 0);
  ellipse(X+19, Y+20, 6, 20);
 
  fill(40,205,50);
  ellipse(X+150, Y+86, 5, 26);
  fill(255,20,147);
  ellipse(X+300, Y+206, 5, 26);
  fill(238,130,238);
  ellipse(X+280, Y+300, 5, 26);
  fill(0,255,255);
  ellipse(X+100, Y+300, 5, 26);
  fill(255,255,0);
  ellipse(X+150, Y+260, 5, 26);
  fill(255, 140,0);
  ellipse(X+190,Y+230,5,26);
 
fill(40,205,50);
ellipse(X+50, Y+86, 5, 26);
fill(255,20,147);
ellipse(X+300, Y+206, 5, 26);
fill(238,130,238);
ellipse(X+480, Y+300, 5, 26);
fill(255,255,0);
ellipse(X+590, Y+200, 5, 26);
fill(0,255,255);
ellipse(X+250, Y+260, 5, 26);
fill(0, 250, 127);
ellipse(X+800, Y+100, 5, 26);
fill(148, 0, 211);
ellipse(X+300, Y+150, 5, 26);
fill(255, 0, 0);
ellipse(X+420, Y+150, 5, 26);
fill(755, 0, 140);
}
{
  String message = "shinning";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

}

void movePlayers()
{
  if (wPressed) y -= speed;
  if (aPressed) x -= speed;
  if (sPressed) y += speed;
  if (dPressed) x += speed;
 
}

void keyPressed()
{
  if (key == 'w') wPressed = true;
  if (key == 'a') aPressed = true;
  if (key == 's') sPressed = true;
  if (key == 'd') dPressed = true;
 
}

void keyReleased()
{
  if (key == 'w') wPressed = false;
  if (key == 'a') aPressed = false;
  if (key == 's') sPressed = false;
  if (key == 'd') dPressed = false;
}



