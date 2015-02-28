
double cx, cy;
PFont font;
Vector lines = new Vector();

void setup()
{
  font = loadFont("Tahoma-48.vlw");
  textFont(font, 48);
  
  size(780, 550);
    
  cx = width * 0.5;
  cy = height * 0.5;
  
  create_initial_lines();
  subdivide_to_pixels();
  
  noLoop();
}

void create_initial_lines()
{
  double[] x = new double[3];
  double[] y = new double[3];

  double r = Math.min(cx, cy) * 10.0 / 11.0;

  double pi = Math.PI;

  for (int i=0; i < 3; i++)
  {
    double a = pi * 0.5 - i * 2.0 * pi / 3.0;

    x[i] = cx + r * Math.cos(a);
    y[i] = cy - r * Math.sin(a);
  }

  for (int i=0; i < x.length; i++)
  {
    int ni = (i + 1) % x.length;

    lines.add(new Line(x[i], y[i], x[ni], y[ni]));
  }
}

void subdivide_to_pixels()
{
  if (lines.size() > 0)
    while (((Line)lines.elementAt(0)).Length() > 1.0)
      subdivide_all();
}

void subdivide_all()
{
  Vector new_lines = new Vector();

  for (int i=0; i < lines.size(); i++)
  {
    Line line = (Line)lines.elementAt(i);
    
    line.Subdivide(new_lines);
  }

  lines = new_lines;
}

double clamp(double value, double min, double max)
{
  if (value < min)
    return min;
  if (value > max)
    return max;

  return value;
}

void zoom_into(double x, double y)
{
  x = clamp(cx + (x - cx) * 1.05, 0, width - 1);
  y = clamp(cy + (y - cy) * 1.05, 0, height - 1);

  for (int i=0; i < lines.size(); i++)
    ((Line)lines.elementAt(i)).ZoomInto(x, y);
}

void discard_off_screen_lines()
{
  for (int i = lines.size() - 1; i >= 0; i--)
  {
    Line line = (Line)lines.elementAt(i);
    
    if (((line.X1 >= 0.0) && (line.X1 < width) && (line.Y1 >= 0.0) && (line.Y1 < height))
     || ((line.X2 >= 0.0) && (line.X2 < width) && (line.Y2 >= 0.0) && (line.Y2 < height)))
      continue;

    lines.removeElementAt(i);
  }
}

void draw()
{
  background(255);

  stroke(0);
  fill(0);
  
  if (lines.size() == 0)
    text("Oops!", 10, 50);
  
  for (int i=0; i < lines.size(); i++)
  {
    Line line = (Line)lines.elementAt(i);
    
    line((float)line.X1, (float)line.Y1, (float)line.X2, (float)line.Y2);
  }
}

void mousePressed()
{
  if (lines.size() > 0)
    zoom_into(mouseX, mouseY);
  else
    create_initial_lines();

  discard_off_screen_lines();
  subdivide_to_pixels();
  
  redraw();
}

static class Line
{
  public double X1;
  public double Y1;
  public double X2;
  public double Y2;

  public double Length()
  {
    double dx = X2 - X1;
    double dy = Y2 - Y1;

    return Math.sqrt(dx * dx + dy * dy);
  }

  public void ZoomInto(double x, double y)
  {
    X1 = x + (X1 - x) * 1.2;
    Y1 = y + (Y1 - y) * 1.2;
    X2 = x + (X2 - x) * 1.2;
    Y2 = y + (Y2 - y) * 1.2;
  }

  public Line() {}

  public Line(double x1, double y1, double x2, double y2)
  {
    X1 = x1;
    Y1 = y1;
    X2 = x2;
    Y2 = y2;
  }

  public void Subdivide(Vector output)
  {
    double X5 = this.X2;
    double Y5 = this.Y2;

    double dx = X5 - X1;
    double dy = Y5 - Y1;

    double X2 = X1 + dx * 0.3333333333333333;
    double Y2 = Y1 + dy * 0.3333333333333333;

    double X4 = X5 - dx * 0.3333333333333333;
    double Y4 = Y5 - dy * 0.3333333333333333;

    double X3 = (X2 + X4) * 0.5 + (Y4 - Y2) * 1.7320508075688772935274463415059 * 0.5;
    double Y3 = (Y2 + Y4) * 0.5 - (X4 - X2) * 1.7320508075688772935274463415059 * 0.5;

    output.add(new Line(X1, Y1, X2, Y2));
    output.add(new Line(X2, Y2, X3, Y3));
    output.add(new Line(X3, Y3, X4, Y4));
    output.add(new Line(X4, Y4, X5, Y5));
  }
}


