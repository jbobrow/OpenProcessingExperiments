
float v = 0.00;
float inc = 0.3;
int i = 0;
int o = 510;
PImage[] word = new PImage[6];
PImage img;

void setup()
{ 
  size(510, 434);
  img = loadImage("bg.png"); 
  image(img, 0, 0);
  noStroke();
  for (int i=0; i<word.length; i++)
  {
    word[i]=loadImage(i+".png");
  }
  noiseSeed(0);
}

void draw()
{
  frameRate(10);
  int m = millis(); 
  int r = m%6;

  float n = noise(v) * 70.0;
  smooth();

  pushMatrix();
  scale(0.5);
  image(word[r], i, 80+n);
  popMatrix();
  i+=20;

  pushMatrix();
  scale(0.5);
  translate(510, 0);
  image(word[r], o, 80+n);
  popMatrix();
  o-=20;

  v+=inc;

  if (i > width && o < width)
  {
    i = 0;
    o = width;
    image(img, 0, 0);
  }
}



