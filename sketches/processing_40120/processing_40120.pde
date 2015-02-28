
//HW7 - Computing for arts with Processing
//Copyright Ziad Ewais (zewais) - 09/30/2011 - CMU

float x, y, xCol, yCol, w, h, deltaX, deltaY, deltaYCol, deltaXCol, speed;
int numCol;
PImage img;

void setup()
{
  size(500, 500);
  x = (width / 2) - (w / 2);
  y = (height / 2) - (h / 2);
  w = 30;
  h = 30;
  xCol = 0;
  yCol = 0;
  deltaX = 0;
  deltaY = 0;
  deltaXCol = random(2, 4);
  deltaYCol = random(2, 4);
  speed = 3;
  textSize(16);
  textAlign(CENTER, CENTER);
  numCol = 0;
  img = loadImage("bullet.png");
}

void draw()
{
  textSize(16);
  frameRate(60);
  bg();
  initials(x, y, w, h);
  moveInitials();
  drawCollider();
  resetInitials();
  collisionDetection();
  catchInitials();
  showData();
}

void showData()
{
  fill(0,255,0);
  text("Collisions\n" + numCol, 440, 30);
  text("Time\n" + millis() / 1000 , 350 , 30);
  text("Vertical Speed\n" + (int)deltaY, 230 , 30);
  text("Horizontal Speed\n" + (int)deltaX, 80, 30);
  text("Level: " + (int)(numCol / 10 + 1), 50, 460);
}

void catchInitials()
{
  if(x < -w || x > width || y < -h || y > height)
  {
    stroke(255,0,0);
    strokeWeight(3);
    line(width / 2, height / 2, x, y);
    fill(255,0,0);
    text("WARNING\nThe initials are off the screen by\n" + (int)(dist(x,y,xCol,yCol) - width / 2) + "\nPixels", width / 2, 400);
    
  }
}

void dramatize()
{
  frameRate(2);
  fill(255,0,0);
  rect(0,0,width,height);
  fill(0);
  text("HIT!", width/2, height / 2);
  bg();
}

void collisionDetection()
{
  if(dist(x,y,xCol,yCol) < w)
  {
    numCol++;
    dramatize();
    x = (width / 2) - (w / 2);
    y = (height / 2) - (h / 2);
    deltaX = 0;
    deltaY = 0;
    xCol = 0;
    yCol = 0;
    deltaXCol = random(2, 4) + (numCol/10);
    deltaYCol = random(2, 4) + (numCol/10);
  }
}

void resetInitials()
{
  if (keyPressed && key == 32)
  {
    x = (width / 2) - (w / 2);
    y = (height / 2) - (h / 2);
    deltaX = 0;
    deltaY = 0;
  }
}

void drawCollider()
{
  image(img, xCol, yCol, 30, 30);

  xCol = xCol + deltaXCol;
  yCol = yCol + deltaYCol;

  if (xCol < 0 || xCol > width - 20)
  {
    deltaXCol = -deltaXCol;
  }
  if (yCol < 0 || yCol > height - 20)
  {
    deltaYCol = -deltaYCol;
  }
}

void bg()
{
  noStroke();
  fill(0, 50);
  rect(0, 0, width, height);
}

void moveInitials()
{
  x = x + deltaX;
  y = y + deltaY;

  
}

void keyPressed()
{
  if (keyCode == UP && deltaY > -speed)
  {
    deltaY = deltaY - .2;
  }

  if (keyCode == DOWN && deltaY < speed)
  {
    deltaY = deltaY + .2;
  }

  if (keyCode == LEFT && deltaX > -speed)
  {
    deltaX = deltaX - .2;
  }

  if (keyCode == RIGHT && deltaX < speed)
  {
    deltaX = deltaX + .2;
  }
}


void initials(float x, float y, float w, float h)
{
  smooth();
  stroke(255, 177, 52);
  strokeWeight(.5);
  fill(255, 0, 0);
  beginShape();

  curveVertex(x, y + .1 * h);
  curveVertex(x, y + .1 * h); 
  curveVertex(x + .15 * w, y + .12 * h);
  curveVertex(x + .3 * w, y + .1 * h);
  curveVertex(x + .4 * w, y + .12 * h);
  curveVertex(x + .3 * w, y + .25 * h);
  curveVertex(x + (1.0 / 6) * w, y + .6 * h);
  curveVertex(x + .11 * w, y + .9 * h);
  curveVertex(x + .40 * w, y + .9 * h);
  curveVertex(x + .42 * w, y + .95 * h);
  curveVertex(x + .40 * w, y + h);
  curveVertex(x + .05 * w, y + h);
  curveVertex(x - .05 * w, y + .92 * h);
  curveVertex(x + .20 * w, y + .25 * h);
  curveVertex(x + (1.0 / 6) * w, y + .22 * h);
  curveVertex(x, y + .22 * h);
  curveVertex(x, y + .1 * h);
  curveVertex(x, y + .1 * h); 

  endShape();

  //E

  fill(255, 100, 50);
  beginShape();

  curveVertex(x + .65 * w, y + .1 * h);
  curveVertex(x + .65 * w, y + .1 * h);
  curveVertex(x + .8 * w, y + .15 * h);
  curveVertex(x + w, y + .1 * h);
  curveVertex(x + 1.05 * w, y + .4 * h);
  curveVertex(x + .8 * w, y + .3 * h);
  curveVertex(x + .8 * w, y + .5 * h);
  curveVertex(x + .9 * w, y + .5 * h);
  curveVertex(x + .95 * w, y + .45 * h);
  curveVertex(x + .95 * w, y + .65 * h);
  curveVertex(x + .8 * w, y + .6 * h);
  curveVertex(x + .8 * w, y + .8 * h);
  curveVertex(x + .8 * w, y + .9 * h);
  curveVertex(x + w, y + .8 * h);
  curveVertex(x + 1.05 * w, y + .9 * h);
  curveVertex(x + w, y + h);
  curveVertex(x + .7 * w, y + h);
  curveVertex(x + .65 * w, y +  .85 * h);
  curveVertex(x + .65 * w, y + .1 * h);
  curveVertex(x + .65 * w, y + .1 * h);

  endShape();

  //H

  fill(255, 255, 0);
  beginShape();

  curveVertex(x + .3 * w, y);
  curveVertex(x + .4 * w, y);
  curveVertex(x + .4 * w, y + .5 * h);
  curveVertex(x + .6 * w, y + .5 * h);
  curveVertex(x + .6 * w, y);
  curveVertex(x + .7 * w, y);
  curveVertex(x + .7 * w, y + h);
  curveVertex(x + .6 * w, y + h);
  curveVertex(x + .6 * w, y + .7 * h);
  curveVertex(x + .4 * w, y + .7 * h);
  curveVertex(x + .4 * w, y + h);
  curveVertex(x + .3 * w, y + h);
  curveVertex(x + .3 * w, y);
  curveVertex(x + .4 * w, y);
  curveVertex(x + .4 * w, y);


  endShape();
}


