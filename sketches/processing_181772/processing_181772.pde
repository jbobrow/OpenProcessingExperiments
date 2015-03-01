
int yellow;
int yellowRectX = 0;
int yellowRectY = 0;
int yellowRectSize = 20;
int red;
int redRectX = 20;
int redRectY = 0;
int redRectSize = 20;
int green;
int greenRectX = 40;
int greenRectY = 0;
int greenRectSize = 20;
int blue;
int blueRectX = 60;
int blueRectY = 0;
int blueRectSize = 20;
int black;
int blackRectX = 80;
int blackRectY = 0;
int blackRectSize = 20;
int lightGrey;
int lightGreyRectX = 100;
int lightGreyRectY = 0;
int lightGreyRectSize = 20;
int white;
int whiteRectX = 120;
int whiteRectY = 0;
int whiteRectSize = 20;
int randomRectX=140;
int randomRectY = 0;
int randomRectSize = 20;
color currentColor;
boolean typeIsRect;

void cleanSlate() {
  background(255);
}

void setup()
{
  size(640,480);
  background(255);
  frameRate(60);
  yellow = color(255,255,0);
  red = color(255,0,0);
  green = color(0,255,0);
  blue = color(0,0,255);
  black = color(0);
  white = color(255);
  lightGrey = color(200);
  currentColor = color(0);
  typeIsRect = true;
}

void draw()
{
  stroke(0,20,20);
  strokeWeight(1);
  smooth();
  fill(yellow);
  rect(yellowRectX,yellowRectY,yellowRectSize,yellowRectSize);
  fill(red);
  rect(redRectX, redRectY, redRectSize, redRectSize);
  fill(green);
  rect(greenRectX, greenRectY, greenRectSize, greenRectSize);
  fill(blue);
  rect(blueRectX, blueRectY, blueRectSize, blueRectSize); 
  fill(black);
  rect(blackRectX, blackRectY, blackRectSize, blackRectSize);
  fill(lightGrey);
  rect(lightGreyRectX, lightGreyRectY,lightGreyRectSize, lightGreyRectSize);
  fill(white);
  rect(whiteRectX, whiteRectY, whiteRectSize, whiteRectSize);
  fill(yellow);
  ellipse(10,30,20,20);
  fill(red);
  ellipse(30,30,20,20);
  fill(green);
  ellipse(50,30,20,20);
  fill(blue);
  ellipse(70,30,20,20);
  fill(black);
  ellipse(90,30,20,20);
  fill(lightGrey);
  ellipse(110,30,20,20);
  fill(white);
  ellipse(130,30,20,20);
  stroke(0);
  fill(random(255), random(255), random(255));
  rect(140, 0, 40, 40);
  if (mousePressed && mouseButton == LEFT) {
    noStroke();
    fill(currentColor);
    if (typeIsRect)
    {
      if ((mouseX>140) && (mouseY>20) && (mouseX<190) && (mouseY<70))
      {
        rect(mouseX-25,mouseY-25,50,50);
      }
      else
      {
        rect(mouseX-10,mouseY-10,20,20);
      }
    }
    else
    {
      ellipse(mouseX,mouseY,20,20);
    }
  }
}

void mousePressed(){
if(mousePressed && mouseButton == RIGHT)
{
if ((mouseX>yellowRectX) && (mouseY>yellowRectY) && (mouseX<yellowRectX + yellowRectSize) && (mouseY<yellowRectY + yellowRectSize))
  {
    typeIsRect = true;
    currentColor = color(yellow);
  }
  if ((mouseX>20) && (mouseY>0) && (mouseX<40) && (mouseY<20))
  {
    typeIsRect = true;
    currentColor = color(red);
  }
  if ((mouseX>40) && (mouseY>0) && (mouseX<60) && (mouseY<20))
  {
    typeIsRect = true;
    currentColor = color(green);
  }
  if ((mouseX>60) && (mouseY>0) && (mouseX<80) && (mouseY<20))
  {
    typeIsRect = true;
    currentColor = color(blue);
  }
  if ((mouseX>80) && (mouseY>0) && (mouseX<100) && (mouseY<20))
  {
    typeIsRect = true;
    currentColor = color(black);
  }
  if ((mouseX>100) && (mouseY>0) && (mouseX<120) && (mouseY<20))
  {
    typeIsRect = true;
    currentColor = color(lightGrey);
  }
  if ((mouseX>120) && (mouseY>0) && (mouseX<140) && (mouseY<20))
  {
    typeIsRect = true;
    currentColor = color(white);
  }
 
  if ((mouseX>0) && (mouseY>20) && (mouseX<20) && (mouseY<40))
  {
    typeIsRect = false;
    currentColor = color(yellow);
  }
  if ((mouseX>20) && (mouseY>20) && (mouseX<40) && (mouseY<40))
  {
    typeIsRect = false;
    currentColor = color(red);
  }
  if ((mouseX>40) && (mouseY>20) && (mouseX<60) && (mouseY<40))
  {
    typeIsRect = false;
    currentColor = color(green);
  }
  if ((mouseX>60) && (mouseY>20) && (mouseX<80) && (mouseY<40))
  {
    typeIsRect = false;
    currentColor = color(blue);
  }
  if ((mouseX>80) && (mouseY> 20) && (mouseX<100) && (mouseY<40))
  {
    typeIsRect = false;
    currentColor = color(black);
  }
  if ((mouseX>100) && (mouseY>20) && (mouseX<120) && (mouseY<40))
  {
    typeIsRect = false;
    currentColor = color(lightGrey);
  }
  if ((mouseX>120) && (mouseY>20) && (mouseX<140) && (mouseY<40))
  {
    typeIsRect = false;
    currentColor = color(white);
  }
  if ((mouseX>140) && (mouseY>0) && (mouseX<180) && (mouseY<40))
  {
    background(random(255), random(255), random(255));
  }
}
}

void keyPressed() {
  if (key == ' ') {
    cleanSlate();
  }
}


