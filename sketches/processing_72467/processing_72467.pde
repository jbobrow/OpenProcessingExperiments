
void drawThing(int x, int y, int width, int height, int colour)
{
  noStroke();
  fill(colour, 160, 160);
  
  //Triangle 1
  triangle(x, y,                    //Top left corner
           x + 600, y + height,           //Bottom left corner
           x + 600 + width, y + height);  //Bottom right corner
           
  //Triangle 2
  triangle(x + width, y,            //Top right corner
           x + 600 + width, y + height,   //Bottom right corner
           x, y);                   //Top left corner
}

void drawBackground(int width, int height)
{
  int colour = 0;
  
  for(int i = 0; i < height; i++)
  {
    colorMode(HSB, height);
    stroke(i);
    strokeWeight(1);
    line(0, i, width, i);
  } 
}

void drawBoxGrid(int width, int height)
{
  colorMode(RGB, 600);
  
  for(int x = 0; x < 600; x += width)
  {
    for(int y = 0; y < 600; y += height)
    {
      fill(255, 255, 255, 200);
      stroke(y, y, x, 255);
      rect(x, y, width, height);
    }
  }
}

void setup()
{
  noLoop();
  smooth();
  size(600, 600);
  
  background(0);
  colorMode(HSB);
  
  //Draw bg
  drawBackground(600, 600);
  colorMode(HSB, 255);
  
  //Draw triangles
  for(int i = -600; i < 600; i += 20)
  {
    drawThing(i, 0, 18, 600, round((i + 600) / 4.7));
  }
  
  drawBoxGrid(25, 25);
  
  colorMode(RGB, 255);
  
  //Text BG
  noStroke();
  fill(0, 0, 0, 180);
  rect(130, 100, 350, 250);
  
  int l = 10;
  for(int i = 0; i < l; i++)
  {
    colorMode(RGB, 255);
    fill(0, 0, 0, 8);
    rect(130 - i, 100 - i, 350 + (i * 2), 250 + (i * 2));
  }
  
  //Text
  fill(255, 255, 255, 255);
  textSize(50);
  text("Group 7!", 150, 150);
  
  textSize(30);
  text("Adam Findlay", 170, 220);
  text("Stuart MacPherson", 170, 260);
  text("Thomas Stackhouse", 170, 300);
  text("Daniel Kochaniuk", 170, 340);
}

