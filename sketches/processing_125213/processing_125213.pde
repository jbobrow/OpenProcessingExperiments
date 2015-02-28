
PImage snowman;  

void setup()
{
  size(500, 700);
  background(255, 255, 255);
  snowman = loadImage("snowman2.jpg");
  textAlign(CENTER);
  fill(0);
  text("Press the space bar to open coloring page",width/2,25);
}

void draw()
{
  noStroke();
}
void keyPressed()
{
  if (key==' ')
  {
    image(snowman, 0,0,width, height);
  }
  
  if (key=='r')
  {
    fill(255, 0, 0);
  }

  if (key=='b')
  {
    fill(0, 0, 255);
  }
  if (key=='p')
  {
    fill(140,26,198);
  }
  if (key=='g')
  {
    fill(13,100,27);
  }
  if (key=='y')
  {
    fill(248,252,13);
  }
  if (key=='o')
  {
    fill(255,102,13);
  }
  

}

void mouseDragged()
{
  ellipse(mouseX, mouseY, 15, 15);

}



