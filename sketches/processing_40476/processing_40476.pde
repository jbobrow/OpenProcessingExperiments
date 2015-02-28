
// Homework 8
// 51-757 Computing for the Arts with Processing
// October 4, 2011
// Copyright Molly Nix October 2011 Pittsburgh, PA 15232

// IMPORTANT PIXEL POINTS
float poptartX, poptartY, nyanX, nyanY;
float poptartChangeInX, poptartChangeInY;
float nyanChangeInX, nyanChangeInY;
float nyanWidth, nyanHeight, poptartWidth, poptartHeight;
int collisionCount;

PFont font;
PImage nyanCat, popTart, glowyNyan;

// Nyan colors
color bluebg = color(0, 52, 102);
color nyanred = color(251, 3, 0);
color nyanorange = color(255, 153, 0);
color nyanyellow = color(255, 244, 15);
color nyangreen = color(51, 255, 2);
color nyanblue = color(0, 155, 255);
color nyanpurple = color(104, 50, 255);
color lightpink = color(255, 152, 255);
color darkpink = color(241, 50, 154);
color nyantan = color(255, 211, 145);
color nyangrey = color(136, 143, 149);
color black = color(0, 0, 0);
color white = color(255, 255, 255);

String nyanChangeInXtext;
String nyanChangeInYtext;

void setup( ) 
{
  size( 450, 450);
  smooth();
  imageMode(CENTER);
  collisionCount = 0;
  nyanCat = loadImage("nyan.gif");
  popTart = loadImage("poptart.gif");
  glowyNyan = loadImage("glowy_nyan.png");
  nyanWidth = 50;
  nyanHeight = nyanWidth*.63;
  poptartWidth = 32;
  poptartHeight = poptartWidth*.86153846;
  nyanX = 225;
  nyanY = 225;
  poptartX = random(poptartWidth/2, width-poptartWidth/2);
  poptartY = random(poptartHeight/2, height-poptartHeight/2);
  poptartChangeInX = random(.5, 4);
  poptartChangeInY = random(.5, 4);
  nyanChangeInX = 0;
  nyanChangeInY = 0;
  font = loadFont("PixelFont.vlw");
  textFont(font);
}

void draw() 
{
  background(bluebg);
  drawNyan();
  drawPoptart();
  movePoptart();
  moveNyan();
  checkIfNyanOnScreen();
  checkCollision();
  showStats();
}



//DRAW MOVEMENT
void drawNyan() 
{
  frameRate(60);
  image(nyanCat, nyanX, nyanY, nyanWidth, nyanHeight);
}


void drawPoptart() {
  image(popTart, poptartX, poptartY, poptartWidth, poptartHeight);
}


void movePoptart() 
{
  poptartX = poptartX + poptartChangeInX; 
  poptartY = poptartY + poptartChangeInY;
  if ( poptartX > width - (poptartWidth/2) )
  {
    poptartChangeInX = -poptartChangeInX;
  }
  if ( poptartX < (poptartWidth/2) )
  {
    poptartChangeInX = -poptartChangeInX;
  }

  if (poptartY < poptartHeight/2) 
  {
    poptartChangeInY = -poptartChangeInY;
  }

  if (poptartY > height - poptartHeight/2) {
    poptartChangeInY = -poptartChangeInY;
  }
}

void moveNyan () {
  nyanX = nyanX+nyanChangeInX;
  nyanY = nyanY+nyanChangeInY;
}


void keyPressed() {
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      nyanChangeInY = nyanChangeInY-1;
    }
    else if (keyCode == DOWN)
    {
      nyanChangeInY = nyanChangeInY+1;
    }
    else if (keyCode == LEFT )
    {
      nyanChangeInX = nyanChangeInX-1;
    }
    else if (keyCode == RIGHT)
    {
      nyanChangeInX = nyanChangeInX+1;
    }
  }
  else if (key == ' ')
  {
    nyanChangeInY = 0;
    nyanChangeInX = 0;
    nyanX = width/2;
    nyanY = height/2;
  }
}

void checkIfNyanOnScreen()
{
  if ((nyanX > width+(nyanWidth/2)) || 
    (nyanX < 0-(nyanWidth/2)) || 
    (nyanY > height+(nyanHeight/2)) || 
    (nyanY < 0-(nyanHeight/2))) 
  {
    rectMode(CENTER);
    strokeWeight(1);
    stroke(nyantan);
    line(nyanX, nyanY, poptartX, poptartY);
    stroke(lightpink);
    strokeWeight(6);
    fill(darkpink);
    rect(width/2, height/2, 370, 110);
    noStroke();
    fill(white);
    textAlign(CENTER);
    textSize(16);
    text("OH NOEZ!!! " + 
      "\nNYAN IZ GONE!!!", width/2, height/2-23);
    textSize(8);
    text("Nyan is " + (int)(dist(nyanX, nyanY, poptartX, poptartY)) +  " pixels away from the poptart", width/2, height/2+20);
    text("press space to return Nyan to center", width/2, height/2+35);
  }
}

void checkCollision()
{
  if (dist(nyanX, nyanY, poptartX, poptartY) < nyanWidth/2) {
    celebrateCollision();
    poptartX = random(poptartWidth/2, width-poptartWidth/2);
    poptartY = random(poptartHeight/2, height-poptartHeight/2);
    poptartChangeInX = random(.5, 4);
    poptartChangeInY = random(.5, 4);
    collisionCount++;
  }
}

void celebrateCollision()
{
  frameRate(.75);
  rectMode(CORNER);
  noStroke();
  fill(nyanred);
  rect(0, nyanY+(0*(nyanHeight/6))-(nyanHeight/2), nyanX, nyanHeight/6);
  fill(nyanorange);
  rect(0, nyanY+(1*(nyanHeight/6))-(nyanHeight/2), nyanX, nyanHeight/6);
  fill(nyanyellow);
  rect(0, nyanY+(2*(nyanHeight/6))-(nyanHeight/2), nyanX, nyanHeight/6);
  fill(nyangreen);
  rect(0, nyanY+(3*(nyanHeight/6))-(nyanHeight/2), nyanX, nyanHeight/6);
  fill(nyanblue);
  rect(0, nyanY+(4*(nyanHeight/6))-(nyanHeight/2), nyanX, nyanHeight/6);
  fill(nyanpurple);
  rect(0, nyanY+(5*(nyanHeight/6))-(nyanHeight/2), nyanX, nyanHeight/6);
  stroke(white);
  strokeWeight(4);
  image(glowyNyan, nyanX, nyanY, nyanWidth+20, nyanHeight+20);
  noStroke();
  rectMode(CENTER);
  stroke(lightpink);
  strokeWeight(4);
  fill(darkpink);
  rect(nyanX, nyanY-50, 130, 40);
  noStroke();
  fill(white);
  textAlign(CENTER);
  textSize(16);
  text("NOMZ +1", nyanX, nyanY-42);
}


void showStats()
{
  fill(white);
  textSize(8);
  textAlign(LEFT);
  if (nyanChangeInX < 0) {
    nyanChangeInXtext = int(abs(nyanChangeInX)) + " pixels/frame left";
  }
  else if (nyanChangeInX > 0) {
    nyanChangeInXtext = int(abs(nyanChangeInX)) + " pixels/frame right";
  }
  else if (nyanChangeInX == 0) {
    nyanChangeInXtext = "0 pixels/frame horizontal";
  }
  if (nyanChangeInY < 0) {
    nyanChangeInYtext = int(abs(nyanChangeInY)) + " pixels/frame up";
  }
  else if (nyanChangeInY > 0) {
    nyanChangeInYtext = int(abs(nyanChangeInY)) + " pixels/frame down";
  }
  else if (nyanChangeInY == 0) {
    nyanChangeInYtext = "0 pixels/frame vertical";
  }
  text( "NOMZ SCORE: " + collisionCount + "\n" + (millis()/1000)/60 + ":" + ((millis()/1000)/10)%6 + (millis()/1000)%10, 10, 15);
  fill(black);
  text("NYAN SPEED:\n" + nyanChangeInXtext + "\n" + nyanChangeInYtext, 10, height-30);
}


