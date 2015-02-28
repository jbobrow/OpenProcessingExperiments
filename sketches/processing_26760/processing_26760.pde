
int [] ripple;
int index;
int lastIndex;

void setup()
{
  size(500,500);
  ripple = new int[width*height*2];
  index = 0;
  lastIndex = width*height;
  for(int i = 0; i < width*height*2; i++)
    ripple[i] = 0;
  background(0);
}

void draw()
{
  int i = index;
  index = lastIndex;
  lastIndex = i;
  updateRipples(lastIndex, index);
}

void keyPressed()
{
  if(key == ' ') {
    for(int i = 0; i < width*height*2; i++)
      ripple[i] = 0;
  }
}

void mouseReleased()
{
  createRipple(mouseX, mouseY);
}

void createRipple(int mx, int my)
{
  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      if(x > mx-3 && x < mx+3 && y > my-3 && y < my+3)
        ripple[y*width + x + index] = 255;
      else
        ripple[y*width + x + index] = 0;
    }
  }
}

void updateRipples(int src, int dest)
{
  loadPixels();
  for(int i = width; i < width*height - width; i++) {
      int s = i + src;
      int n = i + dest;
      ripple[n] = ((ripple[s-1] + ripple[s+1] + ripple[s-width] + ripple[s+width]) >> 1) - ripple[n];
      ripple[n] -= ripple[n] >> 5;
      pixels[i] = color(ripple[n]);
  }
  updatePixels();
}

