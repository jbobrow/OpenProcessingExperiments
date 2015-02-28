
//bugs
//[x] the reset tool doesn't stop resetting until another button is pressed
//[x] the stroke/no stroke feature for shapes does not work right for the D button color. Keeps the color constant
//[x] starting stroke and constance of stroke
//[x] crazyBallz color is buggy
int r = 0;
int g = 0;
int b = 0;
int painttoy = 2;
int rainbow = 0;
int strokel = 0;


void strokel()
{
  if (strokel == 0)
  {
    noStroke();
  }
  else
  {
    stroke(0);
    strokeWeight(1);
  }
}

void crazyBallz()
{
  int ballX = mouseX;
  int ballY = mouseY;
  int directionx = 0;
  int directiony = 0;
  int re = r;
  int gr = g;
  int bl = b;
  if (rainbow==1)
  {
    fill(re, gr, bl);
  }
  else
  {
    fill(r, g, b);
  }
  for (int i=0;i<1000;i++)
  {
    //color selector

      ellipse(ballX, ballY, 20, 20);
    //direction controllers
    if (ballX>600)
    {
      directionx = 1;
    }
    if (ballX<0)
    {
      directionx = 0;
    }
    if (ballY>600)
    {
      directiony = 1;
    }
    if (ballY<0)
    {
      directiony = 0;
    }
    if (directionx==0)
    {
      ballX+=int(random(1, 10));
    }
    if (directionx==1)
    {
      ballX-=int(random(1, 8));
    }
    if (directiony==0)
    {
      ballY+=int(random(1, 6));
    }
    if (directiony==1)
    {
      ballY-=int(random(1, 4));
    }
  }
  fill(r, g, b);
}

void ocd()
{
  int ballX = mouseX;
  int ballY = mouseY;
  int directionx = 0;
  int directiony = 0;
  int re = r;
  int gr = g;
  int bl = b;
  fill(r, g, b);
  for (int i=0;i<300;i++)
  {
    //color selector

      ellipse(ballX, ballY, 20, 20);
    //direction controllers
    if (ballX>600)
    {
      directionx = 1;
    }
    if (ballX<0)
    {
      directionx = 0;
    }
    if (ballY>600)
    {
      directiony = 1;
    }
    if (ballY<0)
    {
      directiony = 0;
    }
    if (directionx==0)
    {
      ballX+=5;
    }
    if (directionx==1)
    {
      ballX-=5;
    }
    if (directiony==0)
    {
      ballY+=5;
    }
    if (directiony==1)
    {
      ballY-=5;
    }
  }
}

void setup()
{
  size(600, 600);
  background(255);
  noStroke();
  frameRate(30);
}
//master control function for the entire project
void draw()
{
  keyPressed();
  print(key);
  //color control
  if (key=='w')
  {
    r = 255;
    g = 0;
    b = 0;
    rainbow = 0;
  }
  if (key=='a')
  {
    r = 0;
    g = 255;
    b = 0;
    rainbow = 0;
  }
  if (key=='s')
  {
    r = 0;
    g = 0;
    b = 255;
    rainbow = 0;
  }
  if (key=='d')
  {
    rainbow = 1;
  }
  if (key=='c')
  {
    r = 255;
    g = 255;
    b = 255;
    rainbow = 0;
  }
  if (key=='q')
  {
    r = 0;
    g = 0;
    b = 0;
    rainbow = 0;
  }
  //shape border
  if (key=='b')
  {
    strokel = 1;
  }
  if (key=='n')
  {
    strokel = 0;
  }
  //clean the canvas
  if (key=='r')
  {
    fill(255);
    rect(0, 0, 600, 600);
    key=char(painttoy);
  }
  //paint toy selection controls
  if (key=='1')
  {
    painttoy=1;
  }
  if (key=='2')
  {
    painttoy=2;
  }
  if (key=='3')
  {
    painttoy=3;
  }
  if (key=='4')
  {
    painttoy=4;
  }
  if (key=='5')
  {
    painttoy=5;
  }
  if (key=='6')
  {
    painttoy=6;
  }
  if (key=='7')
  {
    painttoy=7;
  }
  if (key=='8')
  {
    painttoy=8;
  }
  if (key=='9')
  {
    painttoy=9;
  }
}
//draws the shapes to screen

void mouseDragged()
{
  //set stroke
  strokel();
  //rainbow controls
  if (rainbow==1)
  {
    r = mouseX;
    g = mouseY;
    b = mouseX+mouseY;
    if (r>255)
    {
      r = r - 255;
    }
    if (g>255)
    {
      g = g - 255;
    }
    if (b>255)
    {
      b = b - 255;
    }
  }
  //fill shapes
  fill(r, g, b);
  //paint toy drawer
  if (painttoy==1)
  {
    strokeWeight(1);
    stroke(r, g, b);
    point(mouseX, mouseY);
  }
  if (painttoy==2)
  {
    ellipse(mouseX, mouseY, 15, 15);
  }
  if (painttoy==3)
  {
    ellipse(mouseX, mouseY, 30, 30);
  }
  if (painttoy==4)
  {
    ellipse(mouseX, mouseY, 45, 45);
  }
  if (painttoy==5)
  {
    rect(mouseX-7, mouseY-7, 15, 15);
  }
  if (painttoy==6)
  {
    rect(mouseX-15, mouseY-15, 30, 30);
  }
  if (painttoy==7)
  {
    rect(mouseX-22, mouseY-22, 45, 45);
  }
}


void mousePressed()
{
  //set stroke
  strokel();
  //rainbow controls
  if (rainbow==1)
  {
    r = mouseX;
    g = mouseY;
    b = mouseX+mouseY;
    if (r>255)
    {
      r = r - 255;
    }
    if (g>255)
    {
      g = g - 255;
    }
    if (b>255)
    {
      b = b - 255;
    }
  }
  //fill shapes
  fill(r, g, b);
  //paint toy drawer
  if (painttoy==1)
  {
    strokeWeight(1);
    stroke(r, g, b);
    point(mouseX, mouseY);
  }
  if (painttoy==2)
  {
    ellipse(mouseX, mouseY, 15, 15);
  }
  if (painttoy==3)
  {
    ellipse(mouseX, mouseY, 30, 30);
  }
  if (painttoy==4)
  {
    ellipse(mouseX, mouseY, 45, 45);
  }
  if (painttoy==5)
  {
    rect(mouseX-7, mouseY-7, 15, 15);
  }
  if (painttoy==6)
  {
    rect(mouseX-15, mouseY-15, 30, 30);
  }
  if (painttoy==7)
  {
    rect(mouseX-22, mouseY-22, 45, 45);
  }

  if (painttoy==8)
  {
    ocd();
  }
  if (painttoy==9)
  {
    crazyBallz();
  }
}


