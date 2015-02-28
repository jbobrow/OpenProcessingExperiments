

// Lissablobs
 
int blobSize = 64;
float xangle = 0;
float yangle = 0;
float xanginc = 0.047;
float yanginc = 0.033;
float attenuation = 2.5;
int fade = 16;
int numFrames = 2;

PGraphics[] frames = new PGraphics[numFrames];
int pg=0;

void setup()
{
  size(400,400);
  background(0);
  for (int n = 0; n < frames.length; n++)
    frames[n] = createGraphics(width, height, JAVA2D);
}

void draw()
{
  int halfheight = height / 2;
  int halfwidth  = width  / 2;
  float attheight = height / attenuation;
  float attwidth  = width  / attenuation;
  float x1 = halfheight + (attheight * (sin(yangle)));
  float y1 = halfwidth  + (attwidth  * (cos(xangle)));
  float x2 = halfheight + (attheight * (cos(yangle)));
  float y2 = halfwidth  + (attwidth  * (sin(xangle)));
  float x3 = halfheight + (attheight * (cos(yangle + PI)));
  float y3 = halfwidth  + (attwidth  * (sin(xangle + PI)));
  
  frames[pg].beginDraw();
  frames[pg].noStroke();
  frames[pg].smooth();
  frames[pg].fill(0, fade);
  frames[pg].rect(0, 0, width, height);
  frames[pg].fill(#37F59B);
  frames[pg].ellipse(x1, y1, blobSize, blobSize);
  frames[pg].fill(#FA53D6);
  frames[pg].ellipse(x2, y2, blobSize, blobSize);
  frames[pg].fill(#F5D94A);
  frames[pg].ellipse(x3, y3, blobSize, blobSize);
  frames[pg].endDraw();
  image(frames[pg], 0, 0);
  pg = (pg + 1) % frames.length;

  xangle += xanginc;
  yangle += yanginc;
  if(xangle > TWO_PI) xangle=0;
  if(yangle > TWO_PI) yangle=0;
}


