
//Using a mouse event to "toggle" between two states

boolean fillGreen = false;
void setup()
{
  size(300,300);
  smooth();
}
void draw()
{
  if(fillGreen)
  {
    fill(0,255,0, 100); //the fill values is slightly transparent
  }                    //so there's a little big of a "fade" 
  else                 //Remove the alpha value and see what happens. 
  {
    fill(255,0,0, 100);
  }

  rect(50,50, 200,200);
}

void mousePressed()
{
  fillGreen = !fillGreen; //flip the state of the fillGreen boolean. 
}


