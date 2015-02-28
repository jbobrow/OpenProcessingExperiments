
class Channel
{
  color colour;    // color of dots to plot
  int dataPos;     // where does next data point go?
  int startPos;    // where do we start plotting?
  int nPoints;     // number of points currently in the array
  int nSamples;    // number of samples (copy this from parent)
  float [ ] points;  // the data points to plot
  private float prevX;    // remember previous point
  private float prevY;
  private Stripchart parent;
  boolean visible;  // allows you to hide or show a channel
  int line_weight = 1;
  Channel(Stripchart parent, color c)
  {
    nPoints = 0;
    dataPos = 0;
    startPos = 0;
    this.parent = parent;
    nSamples = parent.nSamples;
    points = new float[parent.nSamples];
    colour = c;
    visible = true;
  }
  Channel(Stripchart parent, color c, int line_weight)
  {
    this(parent, c);
    this.line_weight = line_weight;
  }

  void addData(float value)
  {
    points[dataPos] = value;    
    dataPos = (dataPos + 1) % nSamples; // wrap around when array fills
    /*
     * If the array isn't full yet, add to the end of the array
     * Otherwise, the start point for plotting moves through
     * the array.
     */
    if (nPoints < nSamples)
    {
      nPoints++;
    }
    else
    {
      startPos = (startPos + 1) % nSamples;
    }
  }

  void display()
  {
    int arrayPos;
    float yPos;

    for (int i = 0; i < nPoints; i++)
    {
      arrayPos = (startPos + i) % nSamples;
      if (parent.period > 0 && arrayPos % parent.period == 0)
      {
        stroke(192);
        strokeWeight(line_weight);
        line(nSamples - nPoints + i, Stripchart.VSPACE, 
        nSamples - nPoints + i, parent.h - Stripchart.VSPACE);
      }
      if (visible)
      {
        stroke(colour);
        strokeWeight(line_weight);
        yPos = Stripchart.VSPACE +
          parent.h * (1.0 - (points[arrayPos] - parent.minValue) /
          (parent.maxValue - parent.minValue));

        // Draw a point for the first item, then connect all the other points with lines
        if (i == 0)
        {
          point(nSamples - nPoints + i, yPos);
        }
        else
        {
          line(prevX, prevY, nSamples - nPoints + i, yPos);
        }
        prevX = nSamples - nPoints + i;
        prevY = yPos;
      }
    }
  }

  void toggle()
  {
    visible = ! visible;
  }
}

