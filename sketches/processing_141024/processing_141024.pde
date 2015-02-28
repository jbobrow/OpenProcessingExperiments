
//this sketch displays random patterns composed of 4 symmetrical black and white mosaics

void setup()
{
  size(800, 800);
  background(0);
  noLoop();
  noStroke();
}

void draw()
{
  int[][] tab=new int[8][8];  //2D array used to store the pattern
  for (int i=0; i<8;i++)
  {
    for (int j=0;j<8;j++)
    {
      tab[i][j]=round(random(1));  //makes each array value either 0 or 1
      if (tab[i][j]==0)
      {
        fill(0);  //if value is 0 the fill with black
      }
      else
      {
        fill(255);  //else fill with white
      }
      rect(i*50, j*50, 50, 50);  //draws the top left pattern
      rect(width-50-i*50, j*50, 50, 50);  //draws the top right pattern
      rect(i*50, height-50-j*50, 50, 50);  //draws the bottom left pattern
      rect(width-50-i*50, height-50-j*50, 50, 50);  //draws the bottom right pattern
    }
  }
}

void mouseClicked()
{
  redraw();  //creates a new pattern each time you click
}

