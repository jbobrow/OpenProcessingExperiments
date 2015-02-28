
boolean overRed = false;
boolean overOrange = false;
boolean overYellow = false;
boolean overGreen = false;
boolean overBlue = false;
boolean overPurple = false;
boolean overPink = false;
boolean overBlack = false;
boolean overWhite = false;
boolean overTwo = false;
boolean overSix = false;
boolean overTen = false;
boolean overTwenty = false;

void setup()
{
  size(600,600);
  background(255);
  //red
  stroke(255, 0, 0);
  fill(255, 0, 0);
  rect(30, 30, 20, 20);
  //orange
  stroke(255, 173, 0);
  fill(255, 173, 0);
  rect(60, 30, 20, 20);
  //yellow
  stroke(255, 255, 0);
  fill(255, 255, 0);
  rect(90, 30, 20, 20);
  //green
  stroke(0, 255, 0);
  fill(0, 255, 0);
  rect(120, 30, 20, 20);
  //blue
  stroke(0, 0, 255);
  fill(0, 0, 255);
  rect(150, 30, 20, 20);
  //purple
  stroke(175, 0, 255);
  fill(175, 0, 255);
  rect(180, 30, 20, 20);
  //pink!!!
  stroke(255, 100, 200);
  fill(255, 100, 200);
  rect(210, 30, 20, 20);
  //whiteeraser
  stroke(0);
  fill(255);
  rect(300, 30, 40, 20);
  //black
  stroke(0);
  fill(0);
  rect(240, 30, 20, 20);
  //size 2
  strokeWeight(2);
  point(440, 40);
  //size 6
  strokeWeight(6);
  point(480, 40);
  //size 10
  strokeWeight(10);
  point(520, 40);
  //size 20
  strokeWeight(20);
  point(560, 40);
  strokeWeight(2);
  stroke(0);
}

void draw()
{
  text("Choose different colors and brush sizes, and also use the eraser! Funny thing: you can erase the palette, \nso you'll just have to guess at it, but you can not erase this, try as you might! :)", 10, 70);
  //Test if cursor is over red
  if(mouseX > 30 && mouseX < 50 && mouseY > 30 && mouseY < 50)
  {
    overRed = true;
  }
    else
    {
      overRed = false;
    }
  //Test orange
  if(mouseX > 60 && mouseX < 80 && mouseY > 30 && mouseY < 50)
  {
    overOrange = true;
  }
    else
    {
      overOrange = false;
    }
  //Test yellow
  if(mouseX > 90 && mouseX < 110 && mouseY > 30 && mouseY < 50)
  {
    overYellow = true;
  }
    else
    {
      overYellow = false;
    }
  //Test green
  if(mouseX > 120 && mouseX < 140 && mouseY > 30 && mouseY < 50)
  {
    overGreen = true;
  }
    else
    {
      overGreen = false;
    }
  //Test blue
  if(mouseX > 150 && mouseX < 170 && mouseY > 30 && mouseY < 50)
  {
    overBlue = true;
  }
    else
    {
      overBlue = false;
    }
  //Test purple
  if(mouseX > 180 && mouseX < 200 && mouseY > 30 && mouseY < 50)
  {
    overPurple = true;
  }
    else
    {
      overPurple = false;
    }
  //Test pink!
  if(mouseX > 210 && mouseX < 230 && mouseY > 30 && mouseY < 50)
  {
    overPink = true;
  }
    else
    {
      overPink = false;
    }
  //Test black
  if(mouseX > 240 && mouseX < 260 && mouseY > 30 && mouseY < 50)
  {
    overBlack = true;
  }
    else
    {
      overBlack = false;
    }
  //Test whiteeraser
  if(mouseX > 300 && mouseX < 340 && mouseY > 30 && mouseY < 50)
  {
    overWhite = true;
  }
    else
    {
      overWhite = false;
    }
  //Test size 2
  if(mouseX > 430 && mouseX < 470 && mouseY > 30 && mouseY < 50)
  {
    overTwo = true;
  }
    else
    {
      overTwo = false;
    }
  //Test size 6
  if(mouseX > 470 && mouseX < 490 && mouseY >30 && mouseY < 50)
  {
    overSix = true;
  }
    else
    {
      overSix = false;
    }
  //Test size 10
  if(mouseX > 510 && mouseX < 530 && mouseY > 30 && mouseY < 50)
  {
    overTen = true;
  }
    else
    {
      overTen = false;
    }
  //Test size 20
  if(mouseX > 550 && mouseX < 570 && mouseY > 30 && mouseY < 50)
  {
    overTwenty = true;
  }
    else
    {
      overTwenty = false;
    }
}

void mouseDragged()
{
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void mousePressed()
{
  if(overRed)
  {
    stroke(255, 0, 0);
  }
  if(overOrange)
  {
    stroke(255, 173, 0);
  }
  if(overYellow)
  {
    stroke(255, 255, 0);
  }
  if(overGreen)
  {
    stroke(0, 255, 0);
  }
  if(overBlue)
  {
    stroke(0, 0, 255);
  }
  if(overPurple)
  {
    stroke(175, 0, 255);
  }
  if(overPink)
  {
    stroke(255, 100, 200);
  }
  if(overBlack)
  {
    stroke(0);
  }
  if(overWhite)
  {
    stroke(255);
    strokeWeight(30);
  }
  if(overTwo)
  {
    strokeWeight(2);
  }
  if(overSix)
  {
    strokeWeight(6);
  }
  if(overTen)
  {
    strokeWeight(10);
  }
  if(overTwenty)
  {
    strokeWeight(20);
  }
}
