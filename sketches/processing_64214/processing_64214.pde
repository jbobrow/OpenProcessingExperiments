
float rad;  // The point size of the dots that make up the flower

void setup()
{
  size(400,400);          // Make the window 400 pixels wide and tall
  background(0);          // Black backgrounds
  colorMode(HSB);         // Use hue, saturation and brightness for color
  
}

void draw()
{
  if (mousePressed == true)
  {
    draw_flower();        // call function to draw a flower
  }
}

void draw_flower()        // I wrote this function
{
  stroke(random(255),255,255);    // choose a random bright color
  rad = random(20);               // choose a random flower size
  strokeWeight(rad);
  float x = mouseX;              // save the current mouse position
  float y = mouseY;
  point(x,y);                   // draw the flower
  point(x+rad*cos(radians(72)), y+rad*sin(radians(72)));
  point(x+rad*cos(radians(144)), y+rad*sin(radians(144)));
  point(x+rad*cos(radians(216)), y+rad*sin(radians(216)));
  point(x+rad*cos(radians(288)), y+rad*sin(radians(288)));
  point(x+rad*cos(radians(0)), y+rad*sin(radians(0)));
  
}

