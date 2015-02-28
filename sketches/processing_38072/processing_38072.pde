
size (500, 500);
background (0);
noStroke();
smooth();

int rows = 500;
int cols = 500;
for(int c=9; c<cols; c += 50)
{
  int i = 0;
  for(int r=9; r < rows; r += 50)
  {
    fill(40, 190, 187, 10*i);
    ellipse(r, c+10, i+9, i+9);
    i += 3;
  }
}

                
                
