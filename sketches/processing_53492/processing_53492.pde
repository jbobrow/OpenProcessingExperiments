
/* This is a template for bus-tops contest on OpenProcessing.org.
 *  Bus-Tops (http://bus-tops.com) is a public art project
 *  in London where we have placed 30 monochromatic red LED screens
 *  on the roofs of bus shelters across the city. Sketches from
 *  OpenProcessing Collections will be selected to be exhibited
 *  on these screens.
 *  For contest information and example sketches and submission:
 *  http://www.openprocessing.org/collections/?collectionID=1337
 */
 
boolean gCollideWall = false;
 
static final int WIDTH = 512;
static final int HEIGHT = 160;
 
int fadeStartFrame = 20;
int fadeFrame = 20;
 
PGraphics gGraphics;
PFont gFont;
int gFrame = 0;
int gLastFrame = 0;
int gPrevLogo = -1;
 
class Particle
{
  float mColor;
  float mX;
  float mY;
  float mVX;
  float mVY;
 
 
  void update(boolean forward)
  {
    if (forward)
    {
      mX += mVX;
      mY += mVY;
    }
    else
    {
      mX -= mVX;
      mY -= mVY;
    }
 
    if (gCollideWall)
    {
      if (mX <= 0)
      {
        mX = 0 - ( mX - 0 );
        mVX *= -1;
      }
 
      if (mX >= WIDTH)
      {
        mX = WIDTH - ( mX - WIDTH );
        mVX *= -1;
      }
 
      if (mY <= 0)
      {
        mY = 0 - ( mY - 0 );
        mVY *= -1;
      }
 
      if (mY >= HEIGHT)
      {
        mY = HEIGHT - ( mY - HEIGHT );
        mVY *= -1;
      }
    }
  }
 
  void draw()
  {
 
//    stroke(mColor, 0, 0, 255); //LEDs are on the scale of red
//    stroke(255, 0, 0, mColor); //LEDs are on the scale of red
    //    point(round(mX), round(mY));
//    point(mX, mY);
 
    noStroke();
    fill(mColor, 0, 0, mColor/2); //LEDs are on the scale of red
    int radius = 4;
    ellipse(mX, mY, radius, radius);

//    stroke(mColor, 0, 0, 120); //LEDs are on the scale of red
//    stroke(255, 0, 0, mColor/2); //LEDs are on the scale of red
    //    line(round(mX), round(mY), round(mX - mVX), round(mY - mVY));
//    line(mX, mY, mX - mVX/2, mY - mVY/2);
 
//    stroke(mColor, 0, 0, 100); //LEDs are on the scale of red
//    stroke(255, 0, 0, mColor/3); //LEDs are on the scale of red
    //    line(round(mX), round(mY), round(mX - mVX), round(mY - mVY));
//    line(mX - mVX/2, mY - mVY/2, mX - mVX, mY - mVY);
 
    /*
    stroke(mColor,0,60); //LEDs are on the scale of red
     point(round(mX)-1, round(mY));
     point(round(mX)+1, round(mY));
     point(round(mX), round(mY)+1);
     point(round(mX), round(mY)-1);
     */
 
/*
    stroke(255,0,0, 60); //LEDs are on the scale of red
     point(round(mX)-1, round(mY));
     point(round(mX)+1, round(mY));
     point(round(mX), round(mY)+1);
     point(round(mX), round(mY)-1);
     */
  }
};
 
List gParticleList = null;
 
//---------------------------------------------------------------------
 
public void setup() {
  //do not change, this is fixed for LED screens.
  size(512, 160, P2D);
  //do not change, this is the refresh rate of LEDs.
  frameRate(8);  
 
  gGraphics = createGraphics(512, 160, P2D);
  gFont = loadFont("HelveticaNeue-CondensedBold-64.vlw");
  gParticleList = new ArrayList();
 
  createLogo();
 
  println("gParticleList.size()" + gParticleList.size());
  smooth();
}
 
void draw() {
  background(0); //keep background black (LEDs are brightness based)
 
  //  fill(0,0,0,50);
  //  rect(0,0,width,height);
 
  stroke(255, 0, 0); //LEDs are on the scale of red
  fill(255, 0, 0);   //LEDs are on the scale of red
 
  //----DO WHATEVER YOU LIKE BELOW-----
  //(do not make it interactive, since people won't be able to use mouse/keyboard on a bus stop----
 
 
 
  updateAllParticle(1);
 
  // draw all Particles
  for (int i=0; i<gParticleList.size(); i++) { 
    Particle aParticle = (Particle)gParticleList.get(i);  
    aParticle.draw();
  }
 
  if (gFrame < - fadeStartFrame)
  {
    float ratio = (-fadeStartFrame - gFrame)/(fadeFrame*1.f);
    stroke(0, 0, 0, 255.f*ratio);
    fill(0, 0, 0, 255.f*ratio);
 
    rect(0, 0, width, height);
  }
 
  if (gFrame > gLastFrame + fadeStartFrame)
  {
    float ratio = (gFrame - (gLastFrame + fadeStartFrame))/(fadeFrame*1.f);
    stroke(0, 0, 0, 255.f*ratio);
    fill(0, 0, 0, 255.f*ratio);
 
    rect(0, 0, width, height);
 
    if (gFrame >= gLastFrame + fadeStartFrame + fadeFrame)
    {
      createLogo();
    }
  }
}
 
void createOffscreenGraphics(int x, int y, int fontSize, String text, int idx, int len, int bgColor, int textColor)
{
  String s1 = text.substring(0, idx);
  String s2 = text.substring(idx, idx + len);
 
  println(s1);
  println(s2);
 
  gGraphics.beginDraw();
  gGraphics.background(bgColor);
  gGraphics.noStroke();
  gGraphics.fill(textColor);
  gGraphics.textFont(gFont, fontSize);
  gGraphics.text(s2, x + gGraphics.textWidth(s1), y);
  gGraphics.endDraw();
}
 
void updateAllParticle(int step)
{
  boolean forward = step > 0;
  int loopNum = abs(step);
  for (int i = 0; i < loopNum; ++i)
  {
    for (int j = 0; j < gParticleList.size(); j++) { 
      Particle aParticle = (Particle)gParticleList.get(j);  
      aParticle.update(forward);
    }
    gFrame += forward ? 1 : -1;
  }
}
 
void createParticleAtOffscreenGraphics(int aColor, int vx, int vy)
{
  for (int y = 0; y < gGraphics.height; ++y)
  {
    for (int x = 0; x < gGraphics.width; ++x)
    {
      if (red(gGraphics.get(x, y)) > 128 /*&& (int)random(5) == 0*/)
      {
        final float maxSpeed = 10.f;
        final float minSpeed = 0.f;//5
        float dir;
        Particle aParticle = new Particle();
        dir = ((int)random(2) == 0)?1.f:-1.f;
        aParticle.mColor = constrain((int)(aColor), 0, 255);
        aParticle.mVX = (random(maxSpeed-minSpeed)-minSpeed)*dir + vx;
        dir = ((int)random(2) == 0)?1.f:-1.f;
        aParticle.mVY = (random(maxSpeed-minSpeed)-minSpeed)*dir + vy;
        aParticle.mX = x;
        aParticle.mY = y;
        gParticleList.add(aParticle);
      }
    }
  }
}
 
void removeParticleAtNotOffscreenGraphics()
{
  int removedNum = 0;
  for (int i=gParticleList.size() - 1; i >= 0; i--)
  { 
    Particle aParticle = (Particle)gParticleList.get(i);  
    if (red(gGraphics.get( round(aParticle.mX), round(aParticle.mY) )) <= 128
    /*&& (int)random(2) == 0*/      )
    {
      gParticleList.remove(aParticle);
      ++removedNum;
    }
  }
 
  println(removedNum);
}
 
void createLogo2()
{
  gFrame = 0;
  gParticleList = new ArrayList();
 
  gCollideWall = true;
  String text = "BUS-TOPS";
  String text2 = "LONDON";
  String text3 = "2012";
  int textFrame = 2;
 
  for ( int i = 0; i < text.length(); ++i)
  {
    createOffscreenGraphics(30, 80, 70, text, i, 1, 0, 255);
    createParticleAtOffscreenGraphics(255, 3, 4);
    updateAllParticle(textFrame);
  }
 
  updateAllParticle(textFrame*2);
  createOffscreenGraphics(320, 150, 80, text3, 0, text3.length(), 0, 255);
  createParticleAtOffscreenGraphics(255, -10, -3);
 
 
  updateAllParticle(textFrame*10);
  createOffscreenGraphics(30, 110, 100, text2, 0, text2.length(), 255, 0);
  for (int i = 0; i < 2; ++i)
  {
    removeParticleAtNotOffscreenGraphics();
    updateAllParticle(1);
  }
 
  gLastFrame = gFrame;
  updateAllParticle(-gFrame - fadeStartFrame - fadeFrame);
}
 
void createLogo3()
{
  gFrame = 0;
  gParticleList = new ArrayList();
 
  gCollideWall = false;
  String text = "BUS-TOPS";
  String text2 = "BUS-STOP";
 
  createOffscreenGraphics(50, 110, 80, text, 0, text.length(), 0, 255);
  createParticleAtOffscreenGraphics(255, 0, 0);
 
  updateAllParticle(10);
  createOffscreenGraphics(50, 110, 80, text2, 0, text2.length(), 255, 0);
  for (int i = 0; i < 3; ++i)
  {
    removeParticleAtNotOffscreenGraphics();
    updateAllParticle(1);
  }
 
  gLastFrame = gFrame;
  updateAllParticle(-gFrame - fadeStartFrame - fadeFrame);
}
 
void createLogo4()
{
  gFrame = 0;
  gParticleList = new ArrayList();
 
  gCollideWall = false;
  String text = "BUS-TOPS";
  String text2 = "BUS-STOP";
 
  int textFrame = 1;
 
  createOffscreenGraphics(130, 130, 60, text, 0, text.length(), 0, 255);
  createParticleAtOffscreenGraphics(255, 10, -5);
 
  updateAllParticle(5);
  createOffscreenGraphics(40, 100, 60, text2, 0, text2.length(), 255, 0);
  for (int i = 0; i < 2; ++i)
  {
    removeParticleAtNotOffscreenGraphics();
    updateAllParticle(1);
  } 
  updateAllParticle(-2);
  createOffscreenGraphics(40, 100, 60, text2, 0, text2.length(), 0, 255);
  createParticleAtOffscreenGraphics(255/2, -15, 0);
 
  gLastFrame = gFrame;
  updateAllParticle(-gFrame - fadeStartFrame - fadeFrame);
}
 
void createLogo()
{
  int nextLogo = -1;
  while(true)
  {
    nextLogo = (int)random(3);
    if(nextLogo != gPrevLogo)break;
  }
  switch(nextLogo)
   {
   case 0:
   createLogo2();
   break;
   case 1:
   createLogo3();
   break;
   case 2:
   createLogo4();
   break;
   }
    
   gPrevLogo = nextLogo;
}


