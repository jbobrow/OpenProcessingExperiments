
int parameter = 50;
int x = 0;
int y = 0;
void setup()
{
  size(500, 500);
  colorMode (RGB); 
  frameRate (10); 
  background(150, 30, 56);
}


void draw()
{
  stroke(255);
  for (int x = 0; x < width; x += parameter) {
  for (int y = 0; y < height; y += parameter){ 
  if (mousePressed == true){ 
  stroke (0); }
  line(x + 50, y + 50, x, y+ 50); 
  line(x, y, x, y+ 50); 
   
  }
}

}

