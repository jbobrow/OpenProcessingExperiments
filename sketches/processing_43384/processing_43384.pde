
float[ ][ ] points;
boolean dragging;
int point_being_dragged;
float number_of_points = 10.0;

void setup ( )
{
  size (400, 400);
  background (0);
  dragging = false;
  points = new float[(int)number_of_points][2];
  for (int i = 0; i < number_of_points; i++)
  {
    points [i][0] = 100 * sin(i/number_of_points * TWO_PI) + 200;
    points [i][1] = 100 * cos(i/number_of_points * TWO_PI) + 200;
  }
}

void draw ( ) //runs constantly
{
  background (0);
  if (mousePressed && dragging)
  {
    points [point_being_dragged] [0] = mouseX;
    points [point_being_dragged] [1] = mouseY;
  }
  else
  {
    dragging = false;
  }
  stroke (255);
  strokeWeight(1);
  noFill();
  beginShape ();
  for (int i = 0; i < number_of_points; i++)
  {
    vertex (points [i][0], points [i][1]);
  }
  endShape (CLOSE);
  strokeWeight (3);
  beginShape (POINTS);
  for (int i = 0; i < number_of_points; i++)
  {
    vertex (points [i][0], points [i][1]);
  }
  endShape ( );

}

void mousePressed ( ) //runs once when mouse clicked
{
  for (int i = 0; i < number_of_points; i++)
  {
    if ((abs(points [i][0] - mouseX) < 5)
    && (abs(points [i][1] - mouseY) < 5))
    {
      dragging = true;
      point_being_dragged = i;
      return;
    }
  }
}

