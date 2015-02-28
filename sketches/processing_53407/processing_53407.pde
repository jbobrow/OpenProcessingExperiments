
PFont font;

void setup()
{
  size(300, 300);
  smooth();
  font = loadFont("StencilStd-72.vlw");
}

void draw()
{
  if (mousePressed == true)
  {
    background(0);
  }

  else
  {
    background(255);
  }
  textFont(font);
  fill(0);
  text("ON", width/2-50, height/2-50 );
  fill(255);
  text("OFF", width/2-50, height/2+80 );
}


