
/* Cianobatteri
 * Just another Conway's game of life implementation,
 * strongly based on "2D CA Glider" by Alasdair Turner,
 * but with circles and colors that reminds me Cyanobacteria.
 * Writed by Francesco Aggazio, licensed under Creative Commons
 * Attribution-Share Alike 3.0 license.
 * Work: http://openprocessing.org/visuals/?visualID=7160
 * License: http://creativecommons.org/licenses/by-sa/3.0/
 */



int c = 50;
int cx; int cy;
int s = 500 / c;
boolean [][] cells;
boolean [][] nextcells;


void setup() 
{ 
  size(500,500);
  cells = new boolean [c][c];
  nextcells = new boolean [c][c];
  for (int i = 0; i < c; i++)
  {
    for (int j = 0; j < c; j++)
    {
      cells[i][j] = false;
    }
  }
  noStroke();
  smooth();
  frameRate(6);
}


void draw()
{
  background(0);
  color colore = 0x80000000;
  for (int i = 0; i < c; i++)
  {
    for (int j = 0; j < c; j++)
    {
      if (cells[i][j] == true)
      {
        int incol = 0;
        for (int m = -1; m <= 1; m++)
        {
          for (int n = -1; n <= 1; n++)
          {
            if (!(m == 0 && n == 0))
            {
              if (cells[(i+m+c)%c][(j+n+c)%c] == true)
              {
                incol++;
              }
            }
          }
        }
        if (incol < 3)
        {
          colore = 0x8030a236;//5dd463;
        }
        else if (incol == 3)
        {
          colore = 0x80256a6a;
        }
        else if (incol > 3)
        {
          colore = 0x805dd463;//8ed46a;
        }
        fill(colore);
        ellipse((i * s) + (s / 2), (j * s) + (s / 2), s * 2, s * 2);
      }
      // count up how many alive around us
      int number = 0;
      for (int m = -1; m <= 1; m++)
      {
        for (int n = -1; n <= 1; n++)
        {
          if (!(m == 0 && n == 0))
          {
            if (cells[(i+m+c)%c][(j+n+c)%c] == true)
            {
              number++;
            }
          }
        }
      }
      // counted up... now set state of cell for next generation
      if (number < 2 || number > 3)
      {
        nextcells[i][j] = false;
      }
      else if (number == 3)
      {
        nextcells[i][j] = true;
      }
      else
      {
        nextcells[i][j] = cells[i][j];
      }
    }
  }   
  for (int i = 0; i < c; i++)
  {
    for (int j = 0; j < c; j++)
    {
      cells[i][j] = nextcells[i][j];
    }
  }
}


void mousePressed()
{
  cx = int(mouseX / s);
  cy = int(mouseY / s);
  if (cells[cx][cy] == true)
  {
    cells[cx][cy] = false;
  }
  else
  {
    cells[cx][cy] = true;
  }
}


void mouseDragged()
{
  if (mouseX < width && mouseX > 0 && mouseY < height && mouseY > 0)
  {
  cx = int(mouseX / s);
  cy = int(mouseY / s);
  cells[cx][cy] = true;
  }
}

