
// Keith O'Hara <kohara@bard.edu>
// Feb 10 2010
// CMSC 117
//
// string art: making curves from straight lines
//

void setup()
{
  size(255, 255);
  smooth();
}

void draw()
{
  background(64);
  for (int i = 0; i < 255; i = i + 1 + mouseX/2 )
  {
    stroke(0, i);
    line(0, i, width-i, 0);
    line(0, height-i, width-i, height);
    line(width, i, width-i, height);
    line(width, height-i, width-i, 0);
  } 
}



