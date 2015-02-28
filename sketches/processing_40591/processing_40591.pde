
//Homework 8
//copyright Christina Lee October 2011 Pittsburgh, PA 15289

PImage mike, thomas;
PFont font;
float x1, y1, x2, y2, deltaXThom, deltaYThom, collisionPoint;
int deltaX, deltaY, collisionCount, distance;

void setup() {
  size(500, 500);
  noCursor();
  noStroke();
  smooth();
  x1 = width/2;
  y1 = height/2;
  x2 = random(0, width);
  y2 = random(0, height);
  deltaX = 0;
  deltaY = 0;
  deltaXThom = random(2, 4);
  deltaYThom = random(2, 4);
  mike = loadImage("face.png");
  thomas = loadImage("thomas.png");
  font = loadFont("helvetica.vlw");
  imageMode(CENTER);
  frameRate(60);
  distance = int(dist(x1, y1, x2, y2));
}

void draw()
{ 
  setting();
  collision();
  warning();
  drawMike();
  drawSomething();
  information();
  moveSomething();
}

void drawMike()
{
  image(mike, x1, y1, mike.width/2, mike.height/2);
  x1 = x1 + deltaX;
  y1 = y1 + deltaY;
}

void drawSomething()
{ 
  image(thomas, x2, y2);
}

void collision()
{ 
  collisionPoint = dist(x1, y1, x2, y2);
  if (collisionPoint < mike.width/4 + thomas.width/2 && collisionPoint < mike.height/4 + thomas.height/2 )
  {  dramatize();
    x1 = width/2;
    y1 = height/2;
    x2 = random(0, width);
    y2 = random(0, height);
    deltaX = 0;
    deltaY = 0;
    deltaXThom = random(2, 4);
    deltaYThom = random(2, 4);
    collisionCount = collisionCount + 1;
 
  }
}

void dramatize()
{ fill(0, 255, 0);
rect(0, 0, width, height);
fill(0, 0, 0);
textFont(font, 48);
text("HIT!!!!", 200, 150);
frameRate(1);

}

void information()
{ 
  fill(0);
  textFont(font, 12);
  text("Horizontal Speed: " + deltaX, 20, 50);
  text("Vertical Speed: " + deltaY, width-130, 50);
  text("Collisions: " + collisionCount , 20, height-50);
  text("Elapsed Time: " + millis()/1000, width-130, height-50);
}

void warning()
{ 
  if (x1 > width+(mike.width)/4 || x1 < 0-(mike.width)/4 ||
    y1 > height+(mike.height)/4 || y1 < 0-(mike.height)/4)
  { distance = int(dist(x1, y1, x2, y2));
    fill(255, 0, 255);
    rect(0, 0, width, height);
    stroke(0, 255, 0);
    strokeWeight(3);
    line(x1, y1, width/2, height/2);
    fill(0);
    textFont(font, 20);
    text("WARNING! YOU ARE OFF THE SCREEN!", 65, 100);
    text("Distance: " + distance, 160, 200);
  }
}


void moveSomething() {
  x2 = x2 + deltaXThom;
  y2 = y2 + deltaYThom;
  if (x2 > width || x2 < 0 )
  { 
    deltaXThom = -deltaXThom;
  }
  if (y2 > width || y2 < 0 )
  {
    deltaYThom = -deltaYThom;
  }
}


void keyPressed()
{ 
  if (keyCode == RIGHT )
  { 
    deltaX = deltaX+1;
  }
  if (keyCode == LEFT)
  {
    deltaX = deltaX - 1;
  }
  if (keyCode == DOWN)
  { 
    deltaY = deltaY+1;
  }
  if (keyCode == UP)
  { 
    deltaY = deltaY-1;
  }
  if (key == ' ')
  { 
    deltaX = 0;
    deltaY = 0;
    x1 = width/2;
    y1 = height/2;
  }
}

void setting()
{ frameRate(60);
  noStroke();
  fill(random(255), random(255), random(255), 100);
  rect(0, 0, width, height);
}


