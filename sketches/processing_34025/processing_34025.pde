
int imageGridSize = 48;
int fontSize = 14;
int noCols = 50;
int noRows = 25;
int screenX = fontSize * noCols;
int screenY = fontSize * noRows;

PGraphics gLayer1;
PGraphics gLayer2;
PGraphics gLayer3;
PGraphics gLayer3a;
PImage piBlack;

PImage combo;
PImage[] imgArray = new PImage[38];
PImage[] imgArrayBlur = new PImage[38];

void setup()
{

  size(700, 350, P2D); // needed for export to applet! change if u alter cols, rows, fontSize
  //size(screenX, screenY, P2D); // use if running from processing
  colorMode(RGB, 255, 255, 255, 255);
  gLayer1 = createGraphics(screenX, screenY, P2D);
  gLayer2 = createGraphics(screenX, screenY, P2D);
  gLayer3 = createGraphics(screenX, screenY, P2D);
  gLayer3a = createGraphics(screenX, screenY, P2D);
  gLayer1.background(0);
  gLayer2.background(0);
  gLayer3.background(0);
  gLayer3a.background(0);
  combo  = createImage(screenX, screenY, ARGB);     // for blending
  piBlack  = createImage(screenX, 6, RGB);     // for blank part of scroll 
  piBlack.copy(gLayer1.get(), 0, 0, width, 6, 0, 0, width, 6); // initialise using existing black color

  splitCharsUp();
  createLayer3();     
  frameRate(15);
  background(0);
}

void draw()
{
  updateLayer1();  //falling words
  updateLayer2();  //falling letters
  updateLayer3();  //background text
  scroll3();
  combo.copy(gLayer3a.get(), 0, 0, width, height, 0, 0, width, height);
  combo.blend(gLayer2.get(), 0, 0, width, height, 0, 0, width, height, SCREEN);  
  combo.blend(gLayer1.get(), 0, 0, width, height, 0, 0, width, height, SCREEN);
  image(combo, 0, 0);    // copy gLayer1 onto screen
}

void scroll3()
{
  int vOffset = frameCount - (int)(frameCount / height) * height;
  gLayer3a.beginDraw();
  gLayer3a.image(gLayer3.get(0, height - vOffset, width, height), 0, 0);  
  gLayer3a.image(gLayer3.get(0, 0, width, height), 0, vOffset);  
  gLayer3a.endDraw();
}

void updateLayer1()    // draw vertical chars
{
  gLayer1.beginDraw();
  gLayer1.image(gLayer1.get(), 0, 2);  // scroll down
  gLayer1.image(piBlack.get(0, 0, width, 2), 0, 0);
  int  curCol = (int)random(noCols);
  int n = (int)random(8);   // the ammount of backfill chars
  int sr = (int)random(noRows);  // starting row
  int lr = sr - n; 
  if (lr < 0) lr = 0;
  for (int i = sr; i >= lr  ; i--)  // step backwards through rows
  {
    int r = (int)random(38);  // the character to use - differs each time
    gLayer1.image(imgArray[r], curCol * fontSize, i * fontSize);
    float intensity = float(sr - i ) /  float(sr - lr);
    gLayer1.fill(0, 100 - 100 * intensity);
    gLayer1.rect(curCol * fontSize, i * fontSize, fontSize, fontSize);
  }   
  gLayer1.fill(0, 0.001);  // fade  
  gLayer1.rect(0, 0, width, height); 
  gLayer1.endDraw();
}

void updateLayer2()   //intermediate layer of some chars
{
  gLayer2.beginDraw();
  gLayer2.image(gLayer2.get(), 0, 3);  // scroll down
  gLayer2.image(piBlack.get(0, 0, width, 3), 0, 0);
  int tot = (int)random(8 );
  for (int x = 0; x<tot; x++)
  {
    int i = (int)random(noCols);
    int j = (int)random(noRows);
    int r = (int)random(38);
    gLayer2.image(imgArrayBlur[x], i * fontSize, j * fontSize);
    int alpha = getFillAplpha(20, 70);
    gLayer2.fill(0, alpha);  // fade original (255 is full fade 0 is none)
    gLayer2.rect(i * fontSize, j * fontSize, fontSize, fontSize);
  }
  gLayer2.fill(0, 2);  // for fading...
  gLayer2.rect(0, 0, width, height);
  gLayer2.endDraw();
}

void createLayer3()  // background layer of full screen chars
{
  gLayer3.beginDraw();
  for (int i = 0; i < noCols; i++)
    for (int j = 0; j < noRows; j++)
    {
      int r = (int)random(38);  // the character to use - differs each time
      gLayer3.image(imgArrayBlur[r], i * fontSize, j * fontSize);
    }
  gLayer3.fill(0, 100 );  // fade original (255 is full fade 0 is none)
  gLayer3.rect(0, 0, width, height);  // whole screen
  gLayer3.endDraw();
}

void updateLayer3()   // change some of the chars on the background
{
  gLayer3.beginDraw();
  int tot = noRows ;  // the # of chars to change each time
  for (int x = 0; x < tot; x++)
  {
    int i = (int)random(noCols);
    int j = (int)random(noRows);
    int r = (int)random(38);
    gLayer3.image(imgArrayBlur[r], i * fontSize, j * fontSize);
    int alpha = getFillAplpha(20, 120);
    gLayer3.fill(0, alpha);  // fade original (255 is full fade 0 is none)
    gLayer3.rect(i * fontSize, j * fontSize, fontSize, fontSize);
  }
  gLayer3.endDraw();
}

void splitCharsUp()
{
  // break original image down into individual characters
  PImage origImage = loadImage("Matrix.png");
  for (int i = 0; i < 19; i++)
    for (int j = 0; j < 2; j++)
    {
      int imgIndex  = j * 19 + i;
      imgArray[imgIndex] = createImage(fontSize, fontSize, ARGB);
      imgArray[imgIndex].copy(origImage, i * imageGridSize, j * imageGridSize, imageGridSize, imageGridSize, 0, 0, fontSize, fontSize);
      imgArrayBlur[imgIndex] = createImage(fontSize, fontSize, ARGB);
      imgArrayBlur[imgIndex].copy(origImage, i * imageGridSize, j * imageGridSize, imageGridSize, imageGridSize, 0, 0, fontSize, fontSize);
      imgArrayBlur[imgIndex].filter(BLUR, 1);
    }
}

int getFillAplpha(int imin, int imax)
{
  int r = (int)lerp( imin, imax, random(1));
  return r;
}



