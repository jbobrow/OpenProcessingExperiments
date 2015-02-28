
float thisScale=2.1, thisRotation=0, rcountAdd=.1, scountAdd=.2;
color thisColor= color(0);

void setup()
{
  size(800, 800);
  background(255);
  fill(thisColor);
}

void draw()
{

  noStroke();
  if (keyPressed)
  {
    if (keyCode==RIGHT)
    {
      thisRotation+=rcountAdd;
    }
    if (keyCode==LEFT)
    {
      thisRotation-=rcountAdd;
    }
    if (keyCode==UP)
    {
      thisScale+=scountAdd;
    }
    if (keyCode==DOWN&&thisScale>.1)
    {
      thisScale-=scountAdd;
    }
  }
  if (mousePressed)
  {
    if (mouseButton==RIGHT/*&&dist(40,40,mouseX,mouseY)<=40*/)
    {
      thisColor=get(mouseX, mouseY);
    }
    if (mouseButton==LEFT)
    {
      fill(red(thisColor), green(thisColor), blue(thisColor));
      pushMatrix();
      translate(mouseX, mouseY);
      scale(thisScale);
      rotate(thisRotation);
      triangle(-5, 10, 0, 0, 5, 10);
      popMatrix();
    }
  }
    
  colorMode(HSB,360,100,100);
  for (int c=0;c<360;c++)
  {
    pushMatrix();
    translate(40, 40);
    rotate(radians(c));
    strokeWeight(2);
    stroke(c, 100, 100);
    line(0, 0, 0, 40);
    popMatrix();
  }
  colorMode(RGB);
}



