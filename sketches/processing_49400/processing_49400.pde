
int   x, y;
int   numberOfArcs = 7;
float startingPosition = - (TWO_PI / 6);
int   arcSize;
int   rotateClockwise = 1;
int   step = 40;
float start, stop;
float QUARTER_DEGREE = TWO_PI / 1440;

// j is a rotation iterator, increases by 1 every frame.
int j;
 
void setup()
{
    size(1024,1024);
    stroke(220);
    frameRate(30);
    noFill();
    ellipseMode(CENTER);
    strokeCap(SQUARE);
    smooth();
}
 
void draw()
{    
    
    background(255);
    
      for (int i = 1; i < numberOfArcs ; i++) {
          if (i % 2 == 0) {
            rotateClockwise = -1;
          }
          strokeWeight(5*i*i);
          x = width / 3;
          y = height / 3;
          arcSize = 100 + 4 * i * i * i;
          start = startingPosition * i + QUARTER_DEGREE * j * rotateClockwise;
          stop = startingPosition * i + TWO_PI - HALF_PI + QUARTER_DEGREE * j * rotateClockwise;
          arc(x, y, arcSize, arcSize, start, stop);
          rotateClockwise = 1;
      }
    
    j++;
}
 
     



