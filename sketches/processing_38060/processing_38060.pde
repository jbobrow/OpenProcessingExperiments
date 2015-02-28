
size (500, 500);
background ( 0, 0, 0);
strokeWeight(1);
noStroke();

smooth();

int endx = 500;
int myDiameter = 100;

int rows = 10;
int cols =10;


for (int r=1; r<rows; r++)
{
  for (int c=1; c<cols; c++)
  {
 myDiameter =r;
  fill(17, 209, 169, 400-c*40);
  ellipse  (r*50, c*50, myDiameter*4, myDiameter*4);

}
}
                
                
