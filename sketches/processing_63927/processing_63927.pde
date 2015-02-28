

float x_value;    //  variable to store the x position
float y_value;    //  varible to store the y position

void setup()
{
  size(400,400);      // make screen 400x400 pixels
  background(0);      // black background
  x_value = random(400);  // rain starts at a rain x positio 
  y_value = 0;            // rain starts at the to of the screen
  strokeWeight(4);
  stroke(#5A8BEA);        //medium blue color
}




void draw()
{
  stroke(0);              // erase old point by making it black
  point(x_value,y_value);
  y_value += 20;          // make new point down 20 pixels from old point
  stroke(#5A8BEA);
  point(x_value,y_value);
  
  if (y_value >= 380)      // if near the bottom of the screen
  {
    x_value = random(400);    // choose a new random x positon to rain from
    y_value = 0;              // start again at the top of the screen
  }
  
}

