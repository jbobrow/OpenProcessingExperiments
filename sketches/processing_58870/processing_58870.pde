
//copyright Victoria Adams
//HW12 4.17.2012
//men's 50 freestyle world records, statistics from http://en.wikipedia.org/wiki/World_record_progression_50_metres_freestyle

int [] y = {0, 1, 5, 6, 7, 8, 9, 10, 20, 28, 29};
int [] n = {6, 1, 2, 1, 2, 3, 1, 2, 1, 4, 2};
String [] c = {"USA x 6", "USA", "Switzerland & USA", "USA", "USA x 2",
  "USA x 2 & South Africa", "USA", "USA x 2", "Russia", "Australia x 3 & France",
  "Brazil & France"};
color col;

void setup ()
{
  background (0);
  size (600, 300);
  smooth ();
}

void draw ()
{
  background (0);
  years ();
  drawCircles ();
  countryNames ();
}

void years ()
{
  text ("1980", 7, 270);
  text ("2009", 540, 270);
}

void drawCircles ()
{
  for (int i = 0; i < y.length; i++)
  {
    circle (y[i]*20, height/2, (n[i])*10);
  }
}

void countryNames ()
{
      rectMode(CORNER);
      fill (0);
      rect (0, 0, 400, 50);
  for (int i = 0; i < y.length; i++)
  {
    if (dist (y[i]*20, height/2, mouseX, mouseY) < 10)
    {
      fill (200);
      textSize (20);
      text (c[i], 30, 30);
    }
    else 
    {

    }
  }
}

void circle (int x, int y, int d)
{
  fill (62, 206, 202, 60);
  ellipse (x, y, d, d);
}
