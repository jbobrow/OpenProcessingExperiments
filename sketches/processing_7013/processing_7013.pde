
/**
 * Generic methods for drawing dashed lines. The parameters
 * are based on the SVG definition of stroke-dasharray.
 */
void setup( )
{
  float [ ] dashes = { 5, 3, 9, 4 };
  float [ ] odd_dashes = { 5, 3, 2 };
  size(200, 200);
  background(255);
  smooth();
  
  // test convenience method specifying dash and gap
  dashline(10, 30, 50, 100, 10, 5);

  // test method specifying two sets of dashes and gaps
  stroke(0, 128, 0);
  dashline(10, 50, 50, 120, dashes);
  
  /*
    test horizontal and vertical lines, with odd
    number of gaps and dashes
  */
  stroke(0, 0, 128);
  dashline(0, 10, width - 20, 10, odd_dashes);
  dashline(width / 2, 20, width / 2, height - 20, odd_dashes);
  
  /*
    test to see if dashed lines work when drawn in a
    "negative" direction
  */
  stroke(255, 0, 0);
  dashline(175, 145, 140, 95, 8, 3);
  dashline(190, 60, 140, 80, 5, 3);
}

/*
 * Draw a dashed line with given set of dashes and gap lengths.
 * x0 starting x-coordinate of line.
 * y0 starting y-coordinate of line.
 * x1 ending x-coordinate of line.
 * y1 ending y-coordinate of line.
 * spacing array giving lengths of dashes and gaps in pixels;
 *  an array with values {5, 3, 9, 4} will draw a line with a
 *  5-pixel dash, 3-pixel gap, 9-pixel dash, and 4-pixel gap.
 *  if the array has an odd number of entries, the values are
 *  recycled, so an array of {5, 3, 2} will draw a line with a
 *  5-pixel dash, 3-pixel gap, 2-pixel dash, 5-pixel gap,
 *  3-pixel dash, and 2-pixel gap, then repeat.
 */
void dashline(float x0, float y0, float x1, float y1, float[ ] spacing)
{
  float distance = dist(x0, y0, x1, y1);
  float [ ] xSpacing = new float[spacing.length];
  float [ ] ySpacing = new float[spacing.length];
  float drawn = 0.0;  // amount of distance drawn

  if (distance > 0)
  {
    int i;
    boolean drawLine = true; // alternate between dashes and gaps

    /*
      Figure out x and y distances for each of the spacing values
      I decided to trade memory for time; I'd rather allocate
      a few dozen bytes than have to do a calculation every time
      I draw.
    */
    for (i = 0; i < spacing.length; i++)
    {
      xSpacing[i] = lerp(0, (x1 - x0), spacing[i] / distance);
      ySpacing[i] = lerp(0, (y1 - y0), spacing[i] / distance);
    }

    i = 0;
    while (drawn < distance)
    {
      if (drawLine)
      {
        line(x0, y0, x0 + xSpacing[i], y0 + ySpacing[i]);
      }
      x0 += xSpacing[i];
      y0 += ySpacing[i];
      /* Add distance "drawn" by this line or gap */
      drawn = drawn + mag(xSpacing[i], ySpacing[i]);
      i = (i + 1) % spacing.length;  // cycle through array
      drawLine = !drawLine;  // switch between dash and gap
    }
  }
}

/*
 * Draw a dashed line with given dash and gap length.
 * x0 starting x-coordinate of line.
 * y0 starting y-coordinate of line.
 * x1 ending x-coordinate of line.
 * y1 ending y-coordinate of line.
 * dash - length of dashed line in pixels
 * gap - space between dashes in pixels
 */
void dashline(float x0, float y0, float x1, float y1, float dash, float gap)
{
  float [ ] spacing = { dash, gap };
  dashline(x0, y0, x1, y1, spacing);
}








