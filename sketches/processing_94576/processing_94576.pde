
// Josh Newby
// Copright Josh Newby 2013 Pittsburgh PA
// HW 9 Drawing with an Array

int [] xarray = {50, 120, 80, 300, 100, 140, 6, 20, 39, 10};
int [] yarray = {200, 300, 350, 120, 88, 34, 12, 75, 180, 400};
int [] zarray = {22, 12, 31, 30, 39, 10, 26, 22, 15, 13};
int [] col = {color(random(255), random(255), random(255)),
              color(random(255), random(255), random(255)),
              color(random(255), random(255), random(255)),
              color(random(255), random(255), random(255)),
              color(random(255), random(255), random(255)),
              color(random(255), random(255), random(255)),
              color(random(255), random(255), random(255)),
              color(random(255), random(255), random(255)),
              color(random(255), random(255), random(255)),
              color(random(255), random(255), random(255)),};
int [] deltax = {int (random (-5, 5)), int (random (-5, 5)), int (random (-5, 5)), int (random (-5, 5)), int (random (-5, 5)), 
                 int (random (-5, 5)), int (random (-5, 5)), int (random (-5, 5)), int (random (-5, 5)), int (random (-5, 5)), };
int [] deltay = {int (random (-5, 5)), int (random (-5, 5)), int (random (-5, 5)), int (random (-5, 5)), int (random (-5, 5)), 
                 int (random (-5, 5)), int (random (-5, 5)), int (random (-5, 5)), int (random (-5, 5)), int (random (-5, 5)), };

void setup ()
{
  size (400, 400);
  noStroke ();
  smooth ();
}

void draw ()
{
  background (0);
  circles ();
  moveCircles ();
}

void circles ()
{
  for (int i = 0; i < xarray.length; i = i + 1)
  {
    fill(col[i]);
    ellipse (xarray[i], yarray[i], zarray[i], zarray[i]);
  }
}

void moveCircles ()
{
 for (int i = 0; i < 10; i = i + 1)
 {
 xarray[i] = xarray[i] + deltax [i];
 yarray[i] = yarray[i] + deltay [i];
 
 if (xarray[i] > width || yarray[i] > height)
 {
   deltax [i] = -1 * deltax [i];
   deltay [i] = -1 * deltay [i];
 }
 
  if (xarray[i] < 0 || yarray[i] < 0)
 {
   deltax [i] = -1 * deltax [i];
   deltay [i] = -1 * deltay [i];
 }
 }
}
