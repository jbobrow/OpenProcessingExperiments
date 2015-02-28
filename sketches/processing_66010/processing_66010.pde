
int strokeWeightVar,prevMouseX,prevMouseY,selectorX1;
int selector = 3;
float R = 255;
float G = 255;
float B = 255;

void setup()
{
  size(700,500);
  frameRate(3000);
  template();
  background(0);
}

void draw()
{
  if (mousePressed == true)
  {
    line(prevMouseX,prevMouseY,mouseX,mouseY);
  }
  template();
  prevMouseX = mouseX;
  prevMouseY = mouseY;
}

void mousePressed()
{
  if ((mouseX > 10) && (mouseX < 60) && (mouseY > 10) && (mouseY < 60))
  {
    R = 255;
    G = 0;
    B = 0;
    selector = 0;
  }
  if ((mouseX > 70) && (mouseX < 130) && (mouseY > 10) && (mouseY < 60))
  {
    R = 0;
    G = 255;
    B = 0;
    selector = 1;
  }
  if ((mouseX > 140) && (mouseX < 190) && (mouseY > 10) && (mouseY < 60))
  {
    R = 0;
    G = 0;
    B = 255;
    selector = 2;
  }
  if ((mouseX > 200) && (mouseX < 250) && (mouseY > 10) && (mouseY < 60))
  {
    R = 255;
    G = 255;
    B = 255;
    selector = 3;
  }
  if ((mouseX > 260) && (mouseX < 310) && (mouseY > 10) && (mouseY < 60))
  {
    background(0);
    template();
  }
}

void template()
{
  fill(0);
  noStroke();
  rect(0,0,310,70);
  noFill();
  
  stroke(255);
  strokeWeightVar = 2;
  strokeWeight(strokeWeightVar);
  //Red
  fill(255,0,0);
  rect(10,10,50,50);
  //Green
  fill(0,255,0);
  rect(70,10,50,50);
  //Blue
  fill(0,0,255);
  rect(130,10,50,50);
  //White
  fill(255);
  rect(190,10,50,50);
  //Clear
  noFill();
  rect(250,10,50,50);
  line(250,60,300,10);
  strokeWeightVar = 10;
  strokeWeight(strokeWeightVar);
  stroke(R,G,B);
  
  if (selector == 0)
  {
    selectorX1 = 10;
  }
  if (selector == 1)
  {
    selectorX1 = 70;
  }
  if (selector == 2)
  {
    selectorX1 = 130;
  }
  if (selector == 3)
  {
    selectorX1 = 190;
  }
  
  stroke(255,255,0);
  strokeWeight(5);
  rect(selectorX1,10,50,50);
  strokeWeight(strokeWeightVar);
  stroke(R,G,B);
}

