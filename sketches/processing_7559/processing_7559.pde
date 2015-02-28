
// Keith O'Hara <kohara@bard.edu>
// Feb 10 2010
// CMSC 117
//
// string art: making curves from straight lines
//

void setup()
{
  size(300, 300);
  smooth();
}

void draw()
{
  background(64);
  for (int i = 0; i < 300; i = i + 1 + mouseX/5 )
  {
    line(0, i, width-i, 0);
  } 
}



