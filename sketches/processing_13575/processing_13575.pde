
PImage test;
PFont font;
int offset;
int[] testPixels;
int[] offsets = {1,1,1};
void setup()
{
  font = createFont("stats.vlw",12);
  textFont(font);
  test = loadImage("data/picture.jpg");
  testPixels = new int[test.height*test.width];
  size(test.width,test.height+30);
  offset = 0;
  for(int i=0;i<testPixels.length;i++)
    testPixels[i] = -1;
  test.loadPixels();
  int it = 0;
  for(int i=0;i<test.pixels.length;i++)
  {
    color c = test.pixels[i];
    int a = c >> 24 & 0xFF;
    int r = c >> 16 & 0xFF;
    int g = c >> 8 & 0xFF;
    int b = c & 0xFF;
    if(b>r && b>g && b>125)
    {
      testPixels[it] = i;
      it++;
    }
  }
  test.updatePixels();
  fill(0);
}

void draw()
{
  background(205);
  test.loadPixels();
  for(int i=0;testPixels[i]>=0;i++)
  {
    color c = test.pixels[testPixels[i]];
    int a = c >> 24 & 0xFF;
    int r = c >> 16 & 0xFF;
    int g = c >> 8 & 0xFF;
    int b = c & 0xFF;
    if(i<test.pixels.length/4+offset)
      r+=offsets[0];
    if(i<2*test.pixels.length/4+offset)
      g+=offsets[1];
    if(i<3*test.pixels.length/4+offset)
      b+=offsets[2];
    if(r<0) r=255;
    if(g<0) g=255;
    if(b<0) b=255;
    a = a << 24;
    r = r << 16;
    g = g << 8;
    test.pixels[testPixels[i]] = a | r | g | b;
  }
  test.updatePixels();
  image(test,0,0);
  offset+=test.width;
  textSize(12);
  text("R offset: "+offsets[0]+", G offset: "+offsets[1]+", B offset: "+offsets[2],15,height-10);
  text("Press R to reset",250,height-10);
  textSize(8);
  text("+         Q                   W                      E",5,height-22);
  text("-          A                   S                      D",5,height-2);
  println(frameRate);
}

void keyReleased()
{
  switch(key)
  {
    case 'q': offsets[0]++; break;
    case 'a': offsets[0]--; break;
    case 'w': offsets[1]++; break;
    case 's': offsets[1]--; break;
    case 'e': offsets[2]++; break;
    case 'd': offsets[2]--; break;
    case 'r': test = loadImage("data/picture.jpg"); break;
  }
}

