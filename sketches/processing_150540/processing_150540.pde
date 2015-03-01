
void setup ()
{
  size (600, 200);
  smooth();
}

void draw ()
{
  background (#57385c);
  
  float d = map (mouseX, 0, width,10, 400 );
  
  fill (#ffedbc);
  noStroke ();
  ellipse (width/2, height/2, d, d);
}
