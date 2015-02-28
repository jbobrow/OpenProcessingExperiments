
float maxDistance;
float gridScale = 50;
float circleScale = 100.0;
float colourInc = 0.05;

void setup()
{
  size(500,500);
  frameRate(24);
  smooth();
  noStroke();
  maxDistance = dist(0, 0, width, height);
}

//set initial colour values
float R = random(0, 255);
float G = random(0, 255);
float B = random(0, 255);

float newR = R;
float newG = G;
float newB = B;

void draw()
{
  //fade to the new colour selected on mouse click
  if(R != newR)
  {
    int diff = int(newR - R);
    R = R + (diff * colourInc);
  }
  
  if(G != newG)
  {
    int diff = int(newG - G);
    G = G + (diff * colourInc);
  }
  
  if(B != newB)
  {
    int diff = int(newB - B);
    B = B + (diff * colourInc);
  }
  
  //draw the background to clear the screen
  background(255);
  
  //draw the grid of circles
  for (int i = 0; i <= width; i += gridScale)
  {
    for (int j = 0; j <= height; j += gridScale)
    {
      float mouseDist = dist(mouseX, mouseY, i, j);
      float diameter = (mouseDist / maxDistance) * circleScale;
      
      //colour is current RGB values
      fill(R, G, B);
      ellipse(i, j, diameter, diameter);
    }
  }
}

//pick a new random colour on mouse click
void mousePressed()
{
  newR = random(0, 255);
  newG = random(0, 255);
  newB = random(0, 255);
};


