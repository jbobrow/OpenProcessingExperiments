
float lastX = 0, lastY = 0;

void setup ()
{
  size (600, 200);
  smooth();
  noLoop();
  
  frameRate (15);
  
  background (#57385c);
}

void draw ()
{
  // transparent background
  fill (#ffedbc, 10);
  noStroke();
  rect (0, 0, width, height);
  
  // Line
  stroke (#57385c, 200);
  strokeWeight ((abs (mouseX-pmouseX) + abs (mouseY-pmouseY)) / 4);
  line (mouseX, mouseY, pmouseX, pmouseY);
}

void mouseReleased ()
{
 background (#ffedbc);
  redraw ();
}

void mouseMoved ()
{
  redraw ();
}


