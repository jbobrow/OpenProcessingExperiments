
void setup()
{  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw()
{  //draw function loops 
  ellipse(50, 50, 80, 80);
}
