
void setup()
{
  size(600,600); // determines size of the graphic
 
  placement();  
}

void draw()
{
}

void placement()
{
  for (int x=0; x<width;x+=40) // for loop to make a grid big enough to cover the entire x-axis of the graphic
  { 
    for (int y=0; y< height; y+=40) // for loop to make a grid big enough to cover the entire Y-axis of the graphic
      {
        noStroke();
        fill(700,102,00); // fill function to generate a colour for the shape
        rect(x,y,40,40); // creation of a rectangle
        randomTriangle(x, y);  //calls randomTriangle method
        randomEllipse(x,y);
    }
}
}

void randomTriangle(int x, int y)
{
  if(random(1001) > 600) // generates random number and if it's over 600 and below 1001 then it's going to do the following:
  {
   fill(10,60,00);
   triangle(x,y, x+40, y, x+40, y+40); // creates triangle
   ellipse(x,y, 70,30); // creates elipse 
  }
}

  void randomEllipse(int x, int y)
  {
    if(random(1001) > 820) // generates random number and if it's over 600 and below 1001 then it's going to do the following:
  {
    fill(random(55)+200);
    ellipse(x,y, x+10,x+30); // creates elipse 
  }
  }
