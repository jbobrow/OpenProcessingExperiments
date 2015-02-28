
//*To view the original sketch visit: http://www.openprocessing.org/sketch/35608

Cell[][] oldB, newB;
int levels, old_levels;
float scaleRange, old_scaleRange, xb, yb; 
 
PImage img;

void setup()
{
  size(800, 800);
  img = loadImage ("area.jpg");
  levels = 8;
  scaleRange = 0.12;
  old_levels = levels;
  old_scaleRange = scaleRange;
}
 
void draw()
{
  xb = mouseX;
  yb = mouseY;
 levels = round( ( xb / 800 ) * 10 );
  scaleRange = mouseY * 10 / ( 8 * 5 );
  scaleRange = scaleRange / 1000;
  println(xb + ":" + levels + " " + yb + ":" + scaleRange);
  if ((old_levels != levels) || (old_scaleRange != scaleRange))
  {
    background(255);
    image (img, -250, 0);
    int level=0;
    int n=2;
    oldB = new Cell[n][n];
    oldB[0][0] = new Cell(120, 275);
    oldB[0][1] = new Cell(450, 600);
    oldB[1][0] = new Cell(675, 520);
    oldB[1][1] = new Cell(600, 600);
 
    //  println (oldB[1][1].x + " " + oldB[1][1].y);
 
    // calculate result 
    while (level<levels)
    {
      n=2*n-1;
      newB = new Cell[n][n];
      for (int i=0; i<n; i++) {
        for (int j=0; j<n; j++) {
          if (((i%2) == 0) && ((j%2) == 0)) {
            int ii = i/2;
            int jj = j/2;
            newB[i][j] = new Cell(oldB[ii][jj].x, oldB[ii][jj].y);
          }
          else if (((i%2) == 0) && ((j%2) == 1)) {
            int ii = i/2;
            int jj = (j-1)/2;
            float x=( oldB[ii][jj].x + oldB[ii][jj+1].x ) / 2;
            float y=( oldB[ii][jj].y + oldB[ii][jj+1].y ) / 2;
            float d= sqrt( sq(oldB[ii][jj].x - oldB[ii][jj+1].x) + sq(oldB[ii][jj].y - oldB[ii][jj+1].y) );
            float rng = d*scaleRange;
            float xu = random(-rng, rng);
            float yu = random(-rng, rng);
            //            print("p[" + ii + "][" + jj + "]=(" + oldB[ii][jj].x + "," + oldB[ii][jj].y + ") p[");
            //            println(ii + "][" + (jj+1) + "]=(" + oldB[ii][jj+1].x + "," + oldB[ii][jj+1].y + ")");
            //            println(x + " " + y + " " + d + " " + rng + " " + xu + " " + yu);
            newB[i][j] = new Cell(x+xu, y+yu);
          }
          else if (((i%2) == 1) && ((j%2) == 0)) {
            int ii = (i-1)/2;
            int jj = j/2;
            float x=( oldB[ii][jj].x + oldB[ii+1][jj].x ) / 2;
            float y=( oldB[ii][jj].y + oldB[ii+1][jj].y ) / 2;
            float d= sqrt( sq(oldB[ii][jj].x - oldB[ii+1][jj].x) + sq(oldB[ii][jj].y - oldB[ii+1][jj].y) );
            float rng = d*scaleRange;
            float xu = random(-rng, rng);
            float yu = random(-rng, rng);
            newB[i][j] = new Cell(x+xu, y+yu);
          }
          else if (((i%2) == 1) && ((j%2) == 1)) {
            int ii = (i-1)/2;
            int jj = (j-1)/2;
            float x=( oldB[ii][jj].x + oldB[ii+1][jj+1].x ) / 2;
            float y=( oldB[ii][jj].y + oldB[ii+1][jj+1].y ) / 2;
            float d= sqrt( sq(oldB[ii][jj].x - oldB[ii+1][jj+1].x) + sq(oldB[ii][jj].y - oldB[ii+1][jj+1].y) );
            float rng = d * scaleRange * 0.7;
            float xu = random(-rng, rng);
            float yu = random(-rng, rng);
            newB[i][j] = new Cell(x+xu, y+yu);
          }
        }
      }
      level ++;
      oldB = newB;
      println(level);
    }
 
    // draw result
    println("draw init");
    for (int i=0; i<n; i++) {
      for (int j=0; j<n; j++) {
        if ((i<n-1) && (j<n-1)) {
          line( oldB[i][j].x, oldB[i][j].y, oldB[i][j+1].x, oldB[i][j+1].y);
          line( oldB[i][j].x, oldB[i][j].y, oldB[i+1][j].x, oldB[i+1][j].y);
        }
        else if ((i == (n-1)) && (j<n-1)) {
          line( oldB[i][j].x, oldB[i][j].y, oldB[i][j+1].x, oldB[i][j+1].y);
        }
        else if ((i<n-1) && (j == (n-1))) {
          line( oldB[i][j].x, oldB[i][j].y, oldB[i+1][j].x, oldB[i+1][j].y);
        }
      }
    }
    old_levels = levels;
    old_scaleRange = scaleRange;
    println("call");
  }
}
 
 
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x, y;   // x,y location
 
  // Cell Constructor
  Cell(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }
}


