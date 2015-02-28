


int endX = 500;
int distance = 20;

size(500,500);
background(0);
noStroke();
smooth();

int rows=10;
int cols=10;
int myDiameter = 1;

for(int r=0; r<rows; r++)
{
 for(int c=1; c<cols; c++)
      {
      myDiameter = r;
      ellipse(c*50, r*50, myDiameter, myDiameter);
      }
    }



