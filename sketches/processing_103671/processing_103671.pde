
float treeXPosition = 600.0;
int launchPosition = -1;
int altitude = 0;
int explosionPosition = -1;
int pig1Position = 200;
int pig2Position = 250;
int birdAltitude = 0;
int birdPosition = -1;
int birdPositionMax = 800;
void keyPressed() {
  if (key == ' ') {
    explosionPosition = mouseX;
    if ((explosionPosition >= (pig1Position - 100)) && (explosionPosition <= (pig1Position + 100))) {
      pig1Position = -1;
    }
    if ((explosionPosition >= (pig2Position - 100)) && (explosionPosition <= (pig2Position + 100))) {
      pig2Position = -1;
    }
    setup ();
    fill (252, 98 ,8);
    ellipse (explosionPosition, 575, 100, 100);
    //frameRate (.1);
  } else if ((key == 'l') && (launchPosition < 0)) {
    launchPosition = mouseX;
    altitude = 555;
    
  
  } else {
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
  if (explosionPosition == -1) {
    creeper(mouseX);
    // boom(mouseX);
  } 
  if (launchPosition >= 0) {
   fill (225, 0, 0);
    ellipse (launchPosition, altitude, 20, 20);
   altitude = altitude - 5;
    if (altitude < 0) {
     launchPosition = -1;
    } 
  }
    if (birdPosition >= birdPositionMax) {
     birdPosition = 0;
    } 
    
    fill (0, 0, 0);
    ellipse (birdPosition, 300, 50, 50);
    fill (225, 225, 225);
    rect (birdPosition + 10, 290, 8, 8);
    rect (birdPosition - 10, 290, 8, 8);
    birdPosition = birdPosition + 5;
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
