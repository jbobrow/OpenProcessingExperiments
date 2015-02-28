
//import processing.opengl.*;

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Written by v3ga - http://www.v3ga.net
// Updated to processing 118 by Martin Antolini
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

int       W=500;
int       H=275;

Branch[]  BranchArray;
Tree[]    TreeArray;
int       TreeNb, TreeIndex=-1;
PFont     Font,Font_; 
int       startDragX, startDragY;
float     rY0,rY, rYspeed, rX;
float     rxTarget,ryTarget; 
float     y,z,yTarget,zTarget,yStart,zStart,yDest,zDest;

Spline    testSpline;
Spline     tmpSpline;
float     tmpAngle;


//----------------------------
// setup()
//----------------------------

void setup()
{
  size(W,H,P3D/*,OPENGL*/);
  rectMode(CENTER);

  TreeNb = 4;
  TreeArray = new Tree[TreeNb];

  String Wordz0[] = {
    "++++", "++++",  "++++", "++++", "++++", "++++",  "++++", "++++","++++", "++++",  "++++", "++++"  };
  TreeArray[0] = new Tree(Wordz0);

  String Wordz1[] = {
    "Tentacle>01", "Tentacle>02", "Tentacle>03", "Tentacle>04", "Tentacle>05", "Tentacle>06", "Tentacle>07", "Tentacle>08", "Tentacle>09"  };
  TreeArray[1] = new Tree(Wordz1);

  String Wordz2[] = {
    "Made with", "Processing",  "by -v3ga-", "in March 2003"  };
  TreeArray[2] = new Tree(Wordz2);

  String Wordz3[] = {
    "A collection of ", "Processing",  "sketches", "2002 - 2003", "programmed by", "v3ga", "converted to Beta","by Martin Antolini"  };
  TreeArray[3] = new Tree(Wordz3);



  Font  = loadFont("Meta-Bold.vlw");
  Font_ = loadFont("Meta.vlw");


  fill(180,180,180);
  stroke(180,180,180);
//  smooth();
  noFill();

  yStart    = 600.0;
  yDest     = 10.0;
  yTarget   = yDest;
  y         = yStart;

  zStart    = -1500.0;
  zDest     = -565.0;
  zTarget   = zDest;
  z         = zStart;

  rX        = -PI/6;
  rxTarget  = rX;
  rYspeed   = -PI/200; 


  for (int i=0 ; i<TreeNb ; i++)
    for (int n=0 ; n<TreeArray[i].mBranchNb ; n++)
      TreeArray[i].mBranch[n].splineWord = new Spline(10,TreeArray[i].mBranch[n].Title);
}

//----------------------------
// loop()
//----------------------------


void draw()
{
    background(255);

  
  if ( Math_abs(yStart-y)<0.5 && Math_abs(zStart-z)<0.5 )
  {
    TreeIndex = (TreeIndex == TreeNb-1) ? 0 : TreeIndex+1;
    yTarget = yDest;
    zTarget = zDest;
    rY = PI/4.0;
  }

  // *************** Drawing

  //Center  
  translate(0.5*W, 0.5*H+150*2.5, 400);
  //View
  rX += (rxTarget - rX)/5.0; 
  rotateX(rX);
  y += (yTarget - y)/6.0;
  z += (zTarget - z)/6.0;
  translate(0,y,z); 
  //Model
  rY += (ryTarget - rY)/20.0;
  rotateY(rY);
  TreeArray[TreeIndex].Draw();
}

//----------------------------
// Mouse 
//----------------------------
void mouseDragged()
{
  ryTarget = rY0 + (mouseX - startDragX)*PI/400.0;
}

void mousePressed()
{
  startDragX = mouseX;
  startDragY = mouseY;
  rY0 = rY;
}

void mouseReleased()
{

}

//----------------------------
// Keyboard
//----------------------------
void keyPressed()
{
  switch (key)
  {
  case 'a':
  case 'A':
    rxTarget -= PI/20;
    rxTarget = Math_Clip(rxTarget, -PI/6, 0.0);
    break;
  case 'q':
  case 'Q':
    rxTarget += PI/20;
    rxTarget = Math_Clip(rxTarget, -PI/6, 0.0);
    break;
  case '+':
    yTarget = yStart;
    zTarget = zStart;
    break;
  }
}
//----------------------------
// class Spline
//----------------------------
class Spline
{
  int ARCLENGTH_RES = 10;
  float ARCLENGTH_STEP = 1.0/(float)(ARCLENGTH_RES -1);

  String Word;
  float[] controlP;
  float step;
  int res;
  int nbLines;
  float length[];
  float lengthTotal;

  Spline(int res, String Word)
  {
    this.res = res;
    this.controlP = new float[2*4];  // cubic spline
    this.step = 1.0/(float)(res-1);
    this.nbLines = res-1;
    this.length = new float[ARCLENGTH_RES];
    this.Word = Word;
  }

  void setControlP(float[] p)
  {
    for (int i=0; i<p.length ; i++)
    {
      this.controlP[i] = p[i];
    }
  }

  float t2,t3,t_1,t_12,t_13;
  float getX(float t)
  {
    t2   = t*t;
    t3   = t2*t;
    t_1  = 1-t;
    t_12 = t_1*t_1;
    t_13 = t_12*t_1;
    return ( t_13*controlP[0] + 3*t*t_12*controlP[2] + 3*t2*t_1*controlP[4] + t3*controlP[6] );
  }

  float getY(float t)
  {
    t2   = t*t;
    t3   = t2*t;
    t_1  = 1-t;
    t_12 = t_1*t_1;
    t_13 = t_12*t_1;

    return ( t_13*controlP[1] + 3*t*t_12*controlP[3] + 3*t2*t_1*controlP[5] + t3*controlP[7] );
  }

  float normalX, normalY;
  float getTangentX(float t)
  {
    t2 = t*t;
    t_1 = 1-t;
    t_12 = t_1*t_1;
    return ( -3*t_12*controlP[0] + 3*(3*t2 - 4*t +1)*controlP[2] + 3*t*(2-3*t)*controlP[4] + 3*t2*controlP[6] );  
  }

  float getTangentY(float t)
  {
    t2 = t*t;
    t_1 = 1-t;
    t_12 = t_1*t_1;
    return ( -3*t_12*controlP[1] + 3*(3*t2 - 4*t +1)*controlP[3] + 3*t*(2-3*t)*controlP[5] + 3*t2*controlP[7] );  

  }

  float t,n,x,y;
  float x1,x2,y1,y2;

  void getLengthSamples()
  {
    float segmentLength;
    length[0] = 0.0f;
    for (int i=1 ; i<ARCLENGTH_RES ; i++)
    {
      t= (i-1)*ARCLENGTH_STEP;
      x1 = getX(t);
      y1 = getY(t);
      t= i*ARCLENGTH_STEP;
      x2 = getX(t);
      y2 = getY(t);
      segmentLength = sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1)); 
      length[i] = length[i-1] + segmentLength;

    }
    lengthTotal = length[ARCLENGTH_RES-1];
  }

  void drawLetterAt(float s, int c)
  {

    float alpha;
    float l = s*lengthTotal;
    float dl;
    float u,uStart;
    dl = 0.0f;
    u =0.0f;

    for (int i=1 ; i<ARCLENGTH_RES ; i++)
    {
      if (l>=length[i-1] && l<=length[i])
      {
        uStart = ((float)(i-1))*ARCLENGTH_STEP;
        dl = length[i] - length[i-1];
        u = ((l - length[i-1])/dl)*ARCLENGTH_STEP + uStart; 
        break;
      }
    }

    pushMatrix();

    normalX = getTangentX(u);
    normalY = getTangentY(u);
    normalX /= norm(normalX , normalY) ;
    alpha = (float) Math.acos(normalX); 
    if (normalY<0) alpha = -alpha;

    translate(getX(u),getY(u));
    rotateZ(alpha);

    fill(255,0,0);
    textFont(Font, 20);
    text(Word.charAt(c), 0.0, 5.0);

    popMatrix();
  }

  void DrawWord()
  {

    getLengthSamples();
    for (int n=0 ; n<Word.length() ; n++) drawLetterAt(n*1.0f/(float)(Word.length()-1), n);
  }

  void DrawCurve()
  {
    for (int i=0; i<nbLines; i++)
    {
      t = i*step;
      stroke (200 + ((255-200)/(float)nbLines)*i);
      line ( getX(t), getY(t), getX(t+step), getY(t+step));
    }
  }


}
//----------------------------
// class Branch
//----------------------------
class Branch
{
  String   Title;
  float[]  CurvePoints;
  float    rYstart      = 0.0;
  float    txtAngle,txtAngleStart;
  Spline  splineWord;

  Branch(String Title, float rY)
  {
    this.Title          = Title;
    this.rYstart        = rY*PI/180.0;
    this.txtAngleStart  = ((float)Math.random())*360.0*PI/180.0;

    CurvePoints = new float[4*2];  // 4 control points
    CurvePoints[0] =  0.0; // (0.0, 0.0)
    CurvePoints[1] =  0.0;
    CurvePoints[2] =  0.0; // (0.0, 20.0)
    CurvePoints[3] = -150.0;
    CurvePoints[4] = 10.0; // (10.0, 20.0)
    CurvePoints[5] = -150.0;
    CurvePoints[6] = 60.0; // (30.0, 20.0)
    CurvePoints[7] = -120.0;
  }


  void Draw()
  {
    int R,G,B;
    float cosR,cosR2,alpha,n,dx,dy;

    // animate control Points
    CurvePoints[6] = 60+10*cos(txtAngle*PI/180.0+txtAngleStart);
    CurvePoints[7] = -150+20*cos(txtAngle*PI/180.0+txtAngleStart*2.0);


    // update Spline attached to this branch (to ensure continuity)

    splineWord.controlP[0] = CurvePoints[6];
    splineWord.controlP[1] = CurvePoints[7];

    splineWord.controlP[2] = CurvePoints[6] + (CurvePoints[6] - CurvePoints[4]);
    splineWord.controlP[3] = CurvePoints[7] + (CurvePoints[7] - CurvePoints[5]);

    splineWord.controlP[4] = 150;
    splineWord.controlP[5] = -150 -  30*sin(txtAngle*PI/180.0+txtAngleStart);

    splineWord.controlP[6] = 180+ 10*cos(txtAngle*PI/180.0+txtAngleStart);
    splineWord.controlP[7] = -100+ 50*sin(txtAngle*PI/180.0);


    txtAngle+=1.0;
    if (txtAngle>360) txtAngle -= 360;


    pushMatrix();
    rotateY(this.rYstart);

    stroke(200);
    noFill();
    bezier(CurvePoints[0], CurvePoints[1], CurvePoints[2], CurvePoints[3], CurvePoints[4], CurvePoints[5], CurvePoints[6], CurvePoints[7]);

    splineWord.DrawCurve();   
    splineWord.DrawWord();
    popMatrix(); 
  }
}

//----------------------------
// class Tree
//----------------------------
class Tree
{

  Branch[]  mBranch;
  int       mBranchNb;

  Tree(String[] w)
  {
    this.mBranchNb = w.length;
    this.mBranch   = new Branch[mBranchNb];
    for (int i=0; i<mBranchNb; i++)
    {
      this.mBranch[i] = new Branch(w[i], 360.0/w.length*i);
    }
  }

  void Draw()
  {
    for (int i=0 ; i<mBranchNb; i++)
    {
      if (i==0) {
        textFont(Font, 20);
      } 
      else {
        textFont(Font_, 20); 
      }
      this.mBranch[i].Draw();
    } 
  }
}

//------------------------------------------------------------
// Math_Clip()
//------------------------------------------------------------
float Math_Clip(float val, float lo, float hi)
{
  if (val<lo) return lo;
  if (val>hi) return hi;
  return val;
}

int Math_Clip(int val, int lo, int hi)
{
  if (val<lo) return lo;
  if (val>hi) return hi;
  return val;
}

float Math_abs(float val)
{
  if (val > 0.0) return val;
  if (val < 0.0) return -val;
  return val; 
}

float norm(float x, float y)
{
  return sqrt(x*x + y*y);
}

