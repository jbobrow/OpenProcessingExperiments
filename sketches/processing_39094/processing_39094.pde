
// Masala Kaleidoscope - Jim Bumgardner
//
// Use 'm' to toggle mirrors
// 2-9 a-l to change mirror angle
//

import processing.opengl.*;

int    nbrSides = 7;

int    scopeRadius = 400;
int    scopeMargin = 8;

float  mirrorRadians = 0;
int    objectCellHeight = 0; 
int    objectCellWidth = 0;

PGraphics objectCell;
PGraphics wedgePG;

Boolean usesMirrors = true;

void setup() 
{
  // Use this for fullscreen...
  // size(screen.width, screen.height, OPENGL);
  size(scopeRadius*2+scopeMargin*2, scopeRadius*2+scopeMargin*2, OPENGL);
  // size(816, 816, OPENGL);
  smooth();
  SetupMirror();
  SetupCell();
}

// Change contents of this function for different graphics in object cell
// Use 'm' to see plain version of these graphics.
// Dimensions are ObjectCellWidth and ObjectCellHeight
static final int  kMaxSprites = 60;
static final int  kMaxTextures = 32;
static final int  kMinRoll = 720;
static final float kfSweepTime = 20;
static final float kSmallestSprite = 0.4;
static final float kLargestSprite = 0.9;
PImage  discs, masks;
Boolean bRegularPolys = false;

float  gfMaxSpinRate = 0;
static final float  kDamp = 0.85*0.85;
static final float  kSpeed = 0.3;

int    giSpriteType;
float  gfHueC=.5, gfLumC=.5, gfSatC=.5;
float  gfHueW=.5, gfLumW=.5, gfSatW=.5;

class Sprite 
{
  int      iSpriteType;
  PVector  vPos, vVel, vFce;
  float    fRadius;
  float    cycle;
  float    cycleStart;
  float    fSpinRate;
  float    fHue, fSat, fLum;
  float    roll;
  int      tx,ty;
  PGraphics    itsImage;
  
  Sprite(int i)
  {
    float r = i / (float) kMaxSprites;
    float a = random(mirrorRadians);
    float d = random(scopeRadius);
    vPos = new PVector(cos(a)*d, sin(a)*d, -r*.25);
    vVel = new PVector(0,0,0);
    vFce = new PVector(0,0,0);
    fRadius = random(kSmallestSprite, kLargestSprite);
    // println("X = " + vPos.x + " Y = " + vPos.y);
    cycle = r;
    itsImage = createGraphics(130, 130, P2D);
    randomize();
  }
  
  void randomize()
  {
    cycleStart = millis()*.001 - cycle*kfSweepTime;
    if (bRegularPolys)
    {
      fSpinRate = gfMaxSpinRate;
      iSpriteType= giSpriteType;
    }
    else {
      fSpinRate = random(gfMaxSpinRate);
      iSpriteType = (int) random(kMaxTextures);
    }
    // fSpinRate = constrain( fSpinRate, kMinRoll, fSpinRate);

    fHue = constrain(random(gfHueC-gfHueW/2, gfHueC+gfHueW/2), 0, 1);
    fSat = constrain(random(gfHueC-gfHueW/2, gfHueC+gfHueW/2), 0, 1);
    fLum = constrain(random(gfHueC-gfHueW/2, gfHueC+gfHueW/2), 0, 1);
    // !! convert to RGB vector... for tinting
    roll = random(2*PI*.001);
    tx = (iSpriteType % 8)*128;
    ty = (iSpriteType / 8)*128;
    itsImage.beginDraw();
    itsImage.background(0,0,0,0);
    
    itsImage.copy(discs, tx, ty, 128, 128, 1, 1, 128, 128);
    itsImage.endDraw();
    // println("Sprite = " + iSpriteType + " tx=" + tx + " ty="+ty);
  }
  
  void update()
  {
    cycle = (millis()*.001 - cycleStart) / kfSweepTime;
    if (cycle > 1) {
      cycle -= (int) cycle;
      // paramTick();
      if (vPos.x+fRadius < 0 || vPos.y-fRadius > 0)
        randomize();
    }
    roll += vVel.mag()*100*PI/180;
  }

  void dodraw(PGraphics oc)
  {
    oc.pushMatrix();
    oc.translate(vPos.x, vPos.y);
    oc.rotate(roll * PI/180.0);
    oc.scale(fRadius, fRadius);

   //  oc.blend(discs, tx, ty, 128, 128, vPos.x-64, vPos.y-64, 128, 128, BLEND);
    // 
    // itsImage.copy(discs, tx, ty, 128, 128, 0, 0, 128, 128);

    if (cycle >= .75)
      oc.tint(255, (int) (255*(1-cycle)*4));
    else if (cycle < .25)
      oc.tint(255, (int) (255*cycle*4));
    else
      oc.tint(255);
    oc.image(itsImage, 0, 0); // -65 to center..
    oc.popMatrix();
  }
}

Sprite[] cList;

void ParamTick()
{
  // Increment global param settings...
}

void SetupCell()
{
  discs = loadImage("discs.png");
  // masks = loadImage("hindibuttons_mask.jpg");
  // discs.mask(masks);
  cList = new Sprite[kMaxSprites];
  for (int i = 0; i < kMaxSprites; ++i)
  {
    cList[i] = new Sprite(i);
  }
}

float kGravAngle = 0;
float kGravWeight = 0.005;
float rSpin = .98 * .001 * 3.14159f/360;

void UpdatePositions()
{
  int i,j;
  for (i = 0; i < kMaxSprites; ++i)
  {
    Sprite iSpr = cList[i];
    iSpr.vVel.x += random(-0.5, .5);
    iSpr.vVel.y += random(-0.5, .5);
    iSpr.vVel.x *= kDamp;
    iSpr.vVel.y *= kDamp;
    iSpr.vPos.x += iSpr.vVel.x;
    iSpr.vPos.y += iSpr.vVel.y;
  }
/*  
//  println("Updating pos a");
  for (i = 0; i < kMaxSprites; ++i)
  {
    Sprite iSpr = cList[i];
    float a = atan2(iSpr.vPos.y,iSpr.vPos.x);
    float d = iSpr.vPos.mag();
    iSpr.vPos.x = cos(a+rSpin)*d;
    iSpr.vPos.x = sin(a+rSpin)*d;
    iSpr.vFce.x = sin(kGravAngle)*kGravWeight;
    iSpr.vFce.y = -cos(kGravAngle)*kGravWeight;
  }
  for (i = 0; i < kMaxSprites; ++i)
  {
    Sprite iSpr = cList[i];
    for (j= i+1; j < kMaxSprites; ++j) 
    {
      Sprite jSpr = cList[j];
      if (iSpr.vPos.x+iSpr.fRadius > jSpr.vPos.x-jSpr.fRadius &&
          iSpr.vPos.x-iSpr.fRadius < jSpr.vPos.x+jSpr.fRadius &&
          iSpr.vPos.y+iSpr.fRadius > jSpr.vPos.y-jSpr.fRadius &&
          iSpr.vPos.y-iSpr.fRadius < jSpr.vPos.y+jSpr.fRadius)
      {
        float dx = iSpr.vPos.x - jSpr.vPos.x;
        float dy = iSpr.vPos.y - jSpr.vPos.y;
        float fdist = sqrt(dx*dx+dy*dy);
        float maxDist = iSpr.fRadius + jSpr.fRadius;
        float dmax = maxDist - fdist;
        if (dmax > 0 && fdist > 0) 
        {
          float fscale = dmax/maxDist;
          fscale *= fscale;
          fscale *= kSpeed/fdist;
          iSpr.vFce.x += dx*fscale;
          iSpr.vFce.y += dy*fscale;
        }
      }
    }
    float dx = 0-(iSpr.vPos.x+iSpr.vVel.x);
    float dy = 0-(iSpr.vPos.y+iSpr.vVel.y);
    float fdist = sqrt(dx*dx+dy*dy);
    float dmax = fdist - (scopeRadius - iSpr.fRadius*2);
    if (dmax > 0 && fdist > 0) {
          float fscale = dmax/(iSpr.fRadius*2);
          fscale *= fscale;
          fscale *= kSpeed/fdist;
          iSpr.vFce.x += dx*fscale;
          iSpr.vFce.y += dy*fscale;
    }
  } 

  for (i = 0; i < kMaxSprites; ++i)
  {
    Sprite iSpr = cList[i];
    iSpr.vVel.x += iSpr.vFce.x;
    iSpr.vVel.y += iSpr.vFce.y;
    iSpr.vVel.x *= kDamp;
    iSpr.vVel.y *= kDamp;
    iSpr.vPos.x += iSpr.vVel.x;
    iSpr.vPos.y += iSpr.vVel.y;
  }
  */
/*  println("Updating pos d"); */
}

void DrawCell(PGraphics oc)
{
  float tm = (millis() % 1000) / 1000.0;

  // println("draw cell");

  oc.beginDraw();
  oc.smooth();
  oc.background(0);

  UpdatePositions();
  
  // println("draw cell u");
  for (int i = 0; i < kMaxSprites; ++i)
    cList[i].update();
  // println("draw cell d");
  for (int i = 0; i < kMaxSprites; ++i)
    cList[i].dodraw(oc);

  // println("draw cell f");
  
/*  for (int i = 0; i < kMaxTextures; ++i) 
  {
    int dx = (i % 5) * 90;
    int dy = (i / 5) * 90;
    int sx = (i % 4) * 128;
    int sy = (i / 4) * 128;
    oc.blend(discs, sx, sy, 128, 128, dx, dy, 128, 128, BLEND);
  }
*/

  // oc.filter(BLUR);
  // oc.blend(0,0,objectCellWidth,objectCellHeight,-2,2,objectCellWidth+3,objectCellHeight-5,1);
  oc.endDraw();
}
		
void SetupMirror()
{
    mirrorRadians = 2*PI / (nbrSides*2);

    objectCellWidth = scopeRadius;
    objectCellHeight = ceil(sin(mirrorRadians)*scopeRadius);
    objectCell = createGraphics(objectCellWidth, objectCellHeight, P2D);
    wedgePG = createGraphics(objectCellWidth, objectCellHeight, P2D);
  
    wedgePG.beginDraw();
      wedgePG.smooth();
      wedgePG.background(0);
      wedgePG.fill(255);
      wedgePG.stroke(255);  
      wedgePG.beginShape();
      wedgePG.vertex(0,0);
      wedgePG.curveVertex(scopeRadius,0);
      wedgePG.curveVertex(scopeRadius,0);
      wedgePG.curveVertex(cos(mirrorRadians*.5)*scopeRadius, sin(mirrorRadians*.5)*scopeRadius);
      wedgePG.curveVertex(cos(mirrorRadians)*scopeRadius, sin(mirrorRadians)*scopeRadius);
      wedgePG.curveVertex(cos(mirrorRadians)*scopeRadius, sin(mirrorRadians)*scopeRadius);
      wedgePG.endShape(CLOSE);
    wedgePG.endDraw();
}

void draw() 
{
  background(0);
  
  DrawCell(objectCell);

  if (usesMirrors)
    objectCell.mask(wedgePG);

  pushMatrix();
    translate(width/2, height/2);
    if (usesMirrors)
    {
      rotate(millis() * .00005);    // rotating of scope as a whole
      for (int i = 0; i < nbrSides; ++i)
      {
        // for each reflection
        pushMatrix();
          rotate(mirrorRadians*i*2);
          image(objectCell, 0, 0);
          scale(1,-1);
          image(objectCell, 0, 0);
        popMatrix();
      }
    }
    else {
        image(objectCell, 0, 0);
    }
  popMatrix();
  // println("done draw");
}

void keyPressed() {
  if (key == 'm') 
  {
    usesMirrors = !usesMirrors;
    println("MIRRORS " + (usesMirrors? "ON" : "OFF"));
  }
  else if (key >= '2' && key <= '9') {
    nbrSides = key - '0';
    SetupMirror();
  }
  else if (key >= 'a' && key <= 'l') {
    nbrSides = 10 + key - 'a';
    SetupMirror();
  }
}



