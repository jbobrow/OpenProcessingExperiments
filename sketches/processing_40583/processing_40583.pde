
// HW 8 - Computing for the Arts with Processing
// © Asa Foster 2011

int elapsed = 0;
int counter = 0;

// Character
PImage calvin, star, space;
int imgX = 220;
int imgY = 200;
float xValue = 0;
float yValue = 0;
float xPercent = 0;
float yPercent = 0;
float xLoc = 400;
float yLoc = 400;
float howFar = 0;

// Obstacles
float enemyX = random(20, width-20);
float enemyY = random(20, height-20);
float deltaX = random(1, 4);
float deltaY = random(1, 4);



//==========================================================================
void setup() {
  size(800, 800);
  smooth();
  imageMode (CENTER);
  rectMode  (CENTER);
  calvin = loadImage("CalvinBox.png");
  star = loadImage("starBlue.png");
  space = loadImage("space.jpg");

}

//==========================================================================

void draw() {
  background(0, 70, 140);
  screenGUI();
  calvin();
  enemy();
  collision();
  offScreen();
}

//==========================================================================

void screenGUI() {
  image(space, width/2, height/2, width, height);
  textAlign(LEFT);
  int elapsed = millis();
  fill(255);
  text("X:", 20, 20);
  text(int(xPercent) + " mph", 40, 20);
  text("Y:", 20, 40);
  text(int(yPercent) + " mph", 40, 40);
  text("TIME: " + elapsed/1000 + "s", 20, 60);
  text("COLLISIONS: " + counter, 20, 80);
}

//========================================================================== 

void calvin() {
  fill(255);
  image(calvin, xLoc, yLoc, imgX, imgY);

  xPercent = (xValue / 400) * 100;
  yPercent = (yValue / 400) * 100;

  xLoc = xLoc + (xPercent / 5);
  yLoc = yLoc - (yPercent / 5);
}

//==========================================================================

void offScreen() {

  if ((xLoc > width + (imgX/2)) ||
    (xLoc < 0 - (imgX/2))       ||
    (yLoc > height + (imgY/2))  ||
    (yLoc < 0 - (imgY/2))) {  
    stroke(255);
    strokeWeight(2);
    line(width/2, height/2, xLoc, yLoc);
    fill(20, 90, 160);
    ellipse(width/2, height/2, 100, 100);
    fill(255);

    howFar = int(dist(width/2, height/2, xLoc, yLoc)/100);
    textAlign (CENTER, CENTER);
    text(howFar + "m", width/2, height/2);
  }
} 

//==========================================================================

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      yValue += 20;
    } 
    else if (keyCode == DOWN) {
      yValue -= 20;
    } 
    else if (keyCode == LEFT) {
      xValue -= 20;
    } 
    else if (keyCode == RIGHT) {
      xValue += 20;
    }
  } 
  else {
    xLoc = width/2;
    yLoc = height/2;
    xValue = 0;
    yValue = 0;
    xPercent = 0;
    yPercent = 0;
    mouseX = 400;
    mouseY = 400;
  }
}

//==========================================================================

void enemy() {
  
  enemyX += deltaX;
  enemyY += deltaY;

  image(star, enemyX, enemyY);
  
  if ((enemyX > width) || (enemyX < 0)) {
    deltaX = -deltaX;

  }
  if ((enemyY > height) || (enemyY < 0)) {
    deltaY = -deltaY;
  }

  
}

//==========================================================================

void collision()
{
  if (dist(xLoc, yLoc, enemyX, enemyY) < imgX/2) {
    enemyX = random(0, width);
    enemyY = random(0, height);
    deltaX = random(.5, 4);
    deltaY = random(.5, 4);
    counter++;

    frameRate(.5);
    stroke(255);
    fill(20, 90, 160);
    strokeWeight(2);
    ellipse(xLoc, yLoc, 300, 300);
    ellipse(xLoc, yLoc, 285, 285);
    fill(255);
    textAlign (CENTER, CENTER);
    text("YOU DONE GOOFED", xLoc, yLoc);
  } else {
    frameRate(60);
  }
}

//==========================================================================


