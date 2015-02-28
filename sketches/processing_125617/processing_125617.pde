
/* @pjs preload="markermouse.png"; */
/* @pjs preload="markermouse1.png"; */
/* @pjs preload="hintergrund.jpg"; */
/* @pjs preload="deko.png"; */

PImage img;
PImage markermouse;
PImage markermouse1;
PImage deko;

int pencolor;

void setup()
{
  size(1250, 700);

  img = loadImage("hintergrund.jpg");
  markermouse = loadImage("markermouse.png");
  markermouse1 = loadImage("markermouse1.png");
  deko = loadImage("markerdeko.png");

  rectMode(CENTER);
  smooth();
  frameRate(1000);
  
  cursor(markermouse,10,10);
  
  image(img, 0, 0);
  image(deko, 25, 130);
}


void draw()
{ 
  stroke(pencolor);

  pushMatrix();

  if (mousePressed && (mouseButton == LEFT))
  { 
    fill(pencolor);
    strokeWeight(10);
    line(mouseX, mouseY, pmouseX-15, pmouseY+40);
  }

  if (mousePressed && (mouseButton == RIGHT))
  { 
    fill(pencolor);
    strokeWeight(10);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  popMatrix();

  if (keyPressed)
  {
    if (key == 'w')
      pencolor = 255;
    else if (key == 'b')
      pencolor = 0;   
    else if (key == 'r')
      pencolor = #FF4040;   
    else if (key == 'm')
      pencolor = #5A63FF;
    else if (key == 'g')
      pencolor = #4FFF40;     
    else if (key == 'y')
      pencolor = #E8FF40;
    else if (key == 'p')
      pencolor = #FE1FFF;
    else if (key == 'd')
      pencolor = #7C7C7C;
    else if (key == 'd')
      pencolor = #7C7C7C;  

    if (keyPressed)
    {
      if (key == 'c')
        image(img, 0, 0);  
      image(deko, 25, 130);
    }
  }
}



