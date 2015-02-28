
PImage paletteImage;
color paintColor;
float x;
float y;
float ellipseX;
float center = 0;
float spiral = 10;
float radius = 0;
float angle = 0.0;
float s = 1;
float timer;
int currentBrush = 1;
import gifAnimation.*;
PImage[] animation;
Gif loopingGif1;
Gif loopingGif2;
Gif loopingGif3;
Gif loopingGif4;
Gif loopingGif5;
Gif loopingGif6;

void setup()
{
  clearScreen();
  loopingGif1 = new Gif(this, "walk.gif");
  loopingGif2 = new Gif(this, "bug.gif");
  loopingGif3 = new Gif(this, "fly.gif");
  loopingGif4 = new Gif(this, "spider.gif");
  loopingGif5 = new Gif(this, "spider2.gif");
  loopingGif6 = new Gif(this, "spider3.gif");
  loopingGif1.loop();
  loopingGif2.loop();
  loopingGif3.loop();
  loopingGif4.loop();
  loopingGif5.loop();
  size(800, 600);
  paletteImage = requestImage("palette.png");

}
  void clearScreen()
  {
    background(250);
    angle = 0;
    s = 1;
    fill(red(0), green(0), blue(0));
  }

void draw()
{
  if (mousePressed == true && mouseButton == RIGHT)
  {
    paintColor = get(mouseX, mouseY);
  }
  if (mousePressed == true && mouseButton == LEFT)
  {
    if (currentBrush == 1)
    {
      pushMatrix();
      fill(red(paintColor), green(paintColor), blue(paintColor));
      translate(mouseX, mouseY);
      rotate(angle);
      scale(s);
      noStroke();
      triangle(0,-10,-10,10,10,10);
      popMatrix();
    }
    if (currentBrush == 2)
    {
      pushMatrix();
      timer = timer + (0.0167 * 2);
      radius += 0.5;
      fill(red(paintColor), green(paintColor), blue(paintColor));
      translate(mouseX, mouseY);
      rotate(angle);
      scale(s);
      x = radius * cos(timer * (spiral + 50));
      y = radius * sin(timer * (spiral + 50));
      x += center;
      y += center;
      stroke(0);
      ellipse(0, 0, x + 50, y + 50);
      image(loopingGif1, -50, -50);
      loopingGif1.play();
      popMatrix();
    }
    if (currentBrush == 3)
    {
      image(loopingGif2, 600, 400);
      image(loopingGif3, 350, 500);
      image(loopingGif4, 350, 0);
      image(loopingGif5, 0, 400);
      pushMatrix();
      stroke(0);
      fill(red(paintColor), green(paintColor), blue(paintColor));
      translate(mouseX, mouseY);
      rotate(angle);
      scale(s);
      loopingGif2.play();
      loopingGif3.play();
      loopingGif4.play();
      ellipseX += 1;
      float waveSpeed = 15;
      float waveHeight = 200;
      float centerY = height;
      float angleTwo = radians(ellipseX * waveSpeed);  
      float offset = sin(angleTwo) * waveHeight;  
      float ellipseY = (centerY - 250) + offset;
      ellipse(0, 0, ellipseY , ellipseX);
      if (ellipseX >= 300)
      {
        ellipseX = 0;
      }
      popMatrix();
    }
    if (paletteImage.width > 0)
    {
      image(paletteImage, 0, 0, 250, 250);
    }
  }
}

void keyReleased()
{
  if (keyCode == '1')
  {
    currentBrush = 1;
    s = 1;
    angle = 0;
  }
  if (keyCode == '2')
  {
    currentBrush = 2;
    s = 1;
    angle = 0; 
  }
  if (keyCode == '3')
  {
    currentBrush = 3;
    s = 1;
    angle = 0;
  }
  if (keyCode == UP)
  {
    s +=  1.0;
  }
  if (keyCode == DOWN)
  {
    s -= 1.0;
  }
  if (keyCode == LEFT)
  {
    angle -= .5;
  }
  if (keyCode == RIGHT)
  {
    angle += .5;
  }
  if (keyCode == ' ')
  {
    clearScreen();
  }
}


