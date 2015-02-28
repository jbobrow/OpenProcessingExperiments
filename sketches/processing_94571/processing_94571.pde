
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
              
void setup ()
{
  size (400, 400);
  noStroke ();
  smooth ();
  background (random(0, 255), random(0, 255), random(0, 255));
  
  circles ();
  squares ();
}

void circles ()
{
  for (int i = 0; i < xarray.length; i = i + 1)
  {
    fill(col[i]);
    ellipse (xarray[i], yarray[i], zarray[i], zarray[i]);
  }
}

void squares ()
{
  for (int i = 0; i < xarray.length; i = i + 1)
  {
    fill(col[i]);
    rect (xarray[i], yarray[i], zarray[i], zarray[i]);
  }
}
