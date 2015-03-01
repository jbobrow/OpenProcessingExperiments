
//Stefan Joseph scjoseph
//Copyright July 2015 CMU PGSS

float x = 0;
float y = 0;
float dx;
float dy;
float r, g, b;
float easycoeff = 0.1;
void setup()
{
size (400,400);
smooth();
noStroke();
}

void draw()
{
  //if frameCount >= 
  dx = mouseX - x;
  x= x+ dx*easycoeff;
  dy = mouseY - y;
  y= y + dy*easycoeff;
  fill(0, 150, 155, 10);
  rect(0, 0, width, height);
  fill(100, 100, 100);
  ellipse(x, y, 100, 100);
  
}


