
float treeXPosition = 600.0;
int launchPosition = -1;
int altitude = 0;
int explosionPosition = -1;
int pig1Position = (int) random (100, 700);
int pig2Position = (int) random (100, 700);
int birdAltitude = (int)random(25, 400);
int poop = birdAltitude;
int birdPosition = -1;
int birdPositionMax = 800;
int score = 0;
int cPosition = 0;
int poopPosition = -1;
int gameOver = 0;
void keyPressed() {
  if (key == ' ') {
    explosionPosition = cPosition;
    if ((explosionPosition >= (pig1Position - 50)) && (explosionPosition <= (pig1Position + 50))) {
      pig1Position = 900;
    }
    if ((explosionPosition >= (pig2Position - 50)) && (explosionPosition <= (pig2Position + 50))) {
      pig2Position = 900;
    }
    //setup ();
    fill (252, 98, 8);
    ellipse (explosionPosition, 575, 100, 100);
    //frameRate (.1);
  }
  else if ((key == 'f') && (launchPosition < 0)) {
    launchPosition = cPosition;
    altitude = 555;
    rect (mouseX, 565, 15, 15);
  }
   
  else {
    explosionPosition = -1;
  }
}
void drawTree(float xPosition)
{
  fill (0, 0, 0);
  rect (xPosition, 475, 20, 125);
  fill (0, 255, 0);
  ellipse (xPosition + 10, 500, 100, 100);
}
void mine () {
  int mineSpawn1 = (int) random (800);
  rect (mineSpawn1, 590, 20, 10);
}
void setup()
{
  noCursor ();
  size (800, 600);
  background(0, 0, 300);
  drawTree(100);
  fill (0, 255, 0);
  ellipse (400, 450, 100, 100);
  fill (0, 0, 0);
  rect (390, 500, 20, 200);
  fill (255, 255, 255);
  ellipse (200, 200, 100, 50);
  ellipse (250, 200, 100, 50);
  ellipse (225, 175, 75, 35);
  fill (0, 255, 0);
  fill (0, 0, 0);
  rect (treeXPosition, 475, 20, 125);
  fill (0, 255, 0);
  ellipse (treeXPosition + 10, 500, 100, 100);
  rect (0, 595, 800, 15);
  drawPiggy (pig1Position);
  drawPiggy (pig2Position);
  fill (249, 250, 8);
  ellipse (775, 0, 125, 125);
  drawCloud (600, 200, 90, 60);
}
 
void draw () {
if (explosionPosition != -1) {
    return;
  }
  creeper(cPosition);
  if (key == 'd' && keyPressed) {
    if (cPosition < pig1Position && cPosition < pig2Position)
    {
      cPosition = cPosition + 5;
    }
  }
  if (key == 'a' && keyPressed)
  {
    cPosition = cPosition - 5;
  }
  if ((poopPosition < 0) && (cPosition <= birdPosition)) {
    poopPosition = birdPosition;
    poop = birdAltitude;
  }
   
 
 
  if (launchPosition >= 0) {
    float r = random (225);
    float g = random (225);
    float b = random (225);
    fill (r, g, b);
    ellipse (launchPosition, altitude, 20, 20);
    altitude = altitude - 5;
    if (altitude < 0) {
      launchPosition = -1;
    }
  }
  if (birdPosition >= birdPositionMax) {
    birdPosition = 0;
    birdAltitude= (int)random(20, 80);
    birdAltitude= birdAltitude*5;
    if (poop > 600) {
      poopPosition = -1;
    }
  }
 
  fill (birdPosition/4, 0, 0);
  ellipse (birdPosition, birdAltitude, 50, 50);
  fill (225, 225, 225);
  rect (birdPosition + 10, birdAltitude - 10, 8, 8);
  rect (birdPosition - 10, birdAltitude - 10, 8, 8);
  birdPosition = birdPosition + 5;
  if (launchPosition >= ((birdPosition - 50)) && ((launchPosition <= (birdPosition + 50)) && ((altitude == (birdAltitude)))))
  {
    fill (255, 0, 0);
    ellipse (birdPosition, birdAltitude, 100, 100);
    birdAltitude = birdAltitude -50;
    birdPosition = 0;
    altitude = -40;
    score = score + 1;
  }
 
    
  if (score == 3) {
    fill (0);
    textSize (50);
    text("SSSSSssss... good jawb!!!", 100, 300);
    text("To continue hit another bird", 100, 350);
  }
  if (poopPosition >= 0) {
 
    ellipse (poopPosition, poop, 20, 20);
    poop = poop + 3;
  }
  if (((poopPosition <= (cPosition + 10)) && (poopPosition >= (cPosition - 1)) && (poop >= 540)) && (poop <= 590)) {
    gameOver = gameOver + 1;
    cPosition = 700000;
  }
  if (gameOver >= 1) {
    textSize (50);
    text ("Game Over", 200, 300);
}
}
 
void creeper (float cPosition) {
  setup ();
  fill(0, 255, 0);
  rect (cPosition, 550, 12, 40);
  rect (cPosition - 3, 587, 8, 8);
  rect (cPosition + 10, 587, 8, 8);
  rect (cPosition - 2, 540, 20, 20);
  fill (0, 0, 0);
  rect (cPosition + 3, 545, 3, 5);
  rect (cPosition + 10, 545, 3, 5);
  rect (cPosition + 5, 555, 6, 3);
}
void drawCloud(float xPosition, float yPosition, float cloudwidth, float cloudheight)
{
  fill (255, 255, 255);
  ellipse (xPosition, yPosition, cloudwidth, cloudheight);
  ellipse (xPosition + 25, yPosition, cloudwidth - 5, cloudheight - 5);
}
void drawPiggy (float xPos)
{
  if (xPos >= 0) {
    fill (239, 141, 240);
    rect (xPos, 575, 30, 15);
    rect (xPos + 1, 587, 5, 8);
    rect (xPos + 25, 587, 5, 8);
    rect (xPos + 28, 575, 10, 10);
    fill (0, 0, 0);
    rect (xPos + 33, 577, 3, 3);
    rect (xPos + 34, 581, 4, 2);
  }
}
