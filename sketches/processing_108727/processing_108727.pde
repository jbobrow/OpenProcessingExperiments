
// Michael Lautermilch
// Lab 1, Initials

void setup()
{
  size(500, 300);
  background(255);
  strokeWeight(7);
}
int r = 0, g = 100, b = 200;
void draw()
{
  if (r < 255)
    r++;
  else
    r = 0;
  if (g < 255)
    g += 2;
  else
    g = 0;
  if (b < 255)
    b += 3;
  else
    b = 0;
  color strokeColor = color(r, g, b);
  stroke(strokeColor);
  noFill();
  strokeCap(PROJECT);
  
  line(width * 50 / 500, height * 275 / 300, width * 70 / 500, height * 25 / 300);
  line(width * 70 / 500, height * 25 / 300, width * 100 / 500, height * 150 / 300);
  line(width * 100 / 500, height * 150 / 300, width * 130 / 500, height * 25 / 300);
  line(width * 130 / 500, height * 25 / 300, width * 150 / 500, height * 275 / 300);
  
  line(width * 200 / 500, height * 25 / 300, width * 200 / 500, height * 275 / 300);
  arc(width * 200 / 500, height / 2, width * 200 / 500, height * 250 / 300, radians(270), radians(450));
  
  line(width * 350 / 500, height * 25 / 300, width * 350 / 500, height * 275 / 300);
  line(width * 350 / 500, height * 275 / 300, width * 450 / 500, height * 275 / 300);
  
  textAlign(CENTER);
  fill(0);
  text("by Michael Lautermilch", width * 430 / 500, height * 292 / 300);
}
