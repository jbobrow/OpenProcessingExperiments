
float x = 0;
float y = 0;
float gridScale = 10;
float increment = 0.05;

void setup()
{
  size(500, 500);
  frameRate(24);
  noStroke();
  smooth();
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
  //fade to the new colour
  if(R != newR)
  {
    int diff = int(newR - R);
    R = R + (diff * increment);
  }
  
  if(G != newG)
  {
    int diff = int(newG - G);
    G = G + (diff * increment);
  }
  
  if(B != newB)
  {
    int diff = int(newB - B);
    B = B + (diff * increment);
  }
  
  background(255);
  fill(R, G, B);
  
  //draw the grid of lines
  for (int i = 0; i <= width; i += gridScale)
  {
    for (int j = 0; j <= height; j += gridScale)
    {
      float angle = atan2(mouseY-(y+j), mouseX-(x+i));
      pushMatrix();
      translate(x+i, y+j);
      rotate(angle);
      //line(0, 1-(lineLength/2), 0, 1+(lineLength/2));
      triangle(-3, 3, 0, 5, 3, -3);
      popMatrix();
    }
  }
  
}

void mousePressed()
{
  newR = random(0, 255);
  newG = random(0, 255);
  newB = random(0, 255);
};

//export image on key press
int img = 0;

void keyPressed()
{
  if (key == ENTER)
  {
    save("exports/still" + img + ".tiff");
    img++;
  }
}

