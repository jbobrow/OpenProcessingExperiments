
void setup ()
{
  size (600, 200);
  smooth();
  noLoop();
 
  background (#57385c);
}
 
void draw ()
{
  float x = random (width);
  float y = random (height);
  float d = random (5, 30);
  stroke (255);
  strokeWeight (d/8);
  fill (#A75265);
  ellipse (x, y, d, d);
  
  line (x, y, x+d, y-d);
  ellipse (x+d, y-d, d/2, d/2);
  line (x+d, y-d*2, x+d, y-d);
  
  fill (255);
  noStroke();
  ellipse (x+d, y-d*2, d/3, d/3);
}
 
void keyPressed()
{
 background (#57385c); 
}
 
void mouseReleased()
{
    redraw();
}
