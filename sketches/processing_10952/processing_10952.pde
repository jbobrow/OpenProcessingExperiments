
void setup()
{
  size(200,200);
}

void draw() {
  loadPixels();
  int d=0;
  for(int a=0;a<400;a++) {
    int p=int(random(width*height));
    d+=brightness(pixels[p]);
    pixels[p]=color(random(255));
  }
  updatePixels();
  filter(THRESHOLD,0.79);
  filter(BLUR);
  if(d/400<100)
    filter(DILATE);
  else filter(OPAQUE);
  if(d/400<76)
  {
    filter(BLUR,2);
    filter(INVERT);
  }
}

void mouseClicked()
{
  filter(BLUR,2);
  filter(INVERT);
}

void keyPressed()
{
  filter(BLUR,2);
  filter(INVERT);
}

