
PImage pic, rp;
int ratioWidth = 20;
int ratioHeight;
boolean useRect = true;

void setup()
{

  pic = loadImage("david.jpg");
  size(pic.width, pic.height);

  float imgRatio = float(height) / float(width);
  ratioHeight = round (ratioWidth * imgRatio);

  image(pic, 0, 0);

  pixelate(ratioWidth, ratioHeight);
}

public void pixelate(int rW, int rH)
{

  rp = pic;
  rp.resize(rW, rH);

  for (int i=0; i<width; i+=rW)
    for (int j=0; j<height; j+=rH)
    {
      color c = avgColor(i, 
      j, 
      rW, 
      rH);

      fill(c);
      rect(i, j, rW, rH);
      image(rp, i, j);
      blendColor(i, j, rW, rH, c);
    }
}


void draw()
{
}



public void blendColor(int x, int y, int w, int h, color m)
{

  int cR=0, cG=0, cB=0;

  for (int i=x; i<x+w; i++)
    for (int j=y; j<y+h; j++)
    {
      color c=  get(i, j);
      cR += ((c >> 16) & 0xFF) + ((m >> 16) & 0xFF); 
      cG += ((c >> 8) & 0xFF) + ((m >> 8) & 0xFF);  
      cB += (c & 0xFF) + (m & 0xFF);         
      cR /=  2;
      cG /=  2;
      cB /=  2;


      set(i, j, color(cR-50, cG-50, cB-50));
    }
}



public color avgColor(int x, int y, int w, int h)
{

  int cR=0, cG=0, cB=0;

  for (int i=x; i<x+w; i++)
    for (int j=y; j<y+h; j++)
    {
      color c=  get(i, j);
      cR += (c >> 16) & 0xFF; 
      cG += (c >> 8) & 0xFF;  
      cB += c & 0xFF;
    }

  cR /=  w*h;
  cG /=  w*h;
  cB /=  w*h;

  return color(cR, cG, cB);
}


void keyPressed() {

  if (key == 'z') {
    image(pic, 0, 0);
    ratioWidth++;
    setup();
  } 
  else
    if (key == 'x') {
      image(pic, 0, 0);
      ratioWidth--;
      setup();
    }
}



