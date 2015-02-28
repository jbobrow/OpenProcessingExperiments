
DynTree[] testTrees;
DynTree[] backgroundTrees;
PImage background;
float globalZoom=1.0;
color skyColor;
int treeNumber=5;

void setup()
{
  smooth();
  colorMode(HSB,100);
  skyColor = color(60,15,100);
  background(skyColor);
  size(1900,1080);
  
  
  WindMan.initSinCos();
  
  
  
  testTrees= new DynTree[treeNumber];
  
  backgroundTrees= new DynTree[treeNumber*10];
  grassLayer(color(100),200,1);
//  for(int i = 0; i<treeNumber*10;i++)
//  {
//    backgroundTrees[i] = new DynTree(new PVector(random(width),height*0.9));
//    backgroundTrees[i].woodFill=color(1,2,3);
//    backgroundTrees[i].woodStroke=color(50);
//    backgroundTrees[i].trunkThickness*=0.5;
//    backgroundTrees[i].leafSaturation=0;
//    backgroundTrees[i].leafBrightness=0;
//    backgroundTrees[i].init();
//    backgroundTrees[i].update();
//  }
  
  fill(0);
  rect(0,height*0.89,width,height);
  grassLayer(color(0),100,1);
  
  save("background.jpg");
  
  background = loadImage("background.jpg");
  
  
  for(int i = 0; i<treeNumber;i++)
  {
    testTrees[i] = new DynTree(new PVector(i*(width/treeNumber),height*0.9));
    testTrees[i].init();
  }
  
  
  
}

void draw()
{
  background(skyColor);
  image(background,0,0);
 
  for(int i = 0; i<treeNumber;i++)
  {
    testTrees[i].update();
    
  }
}

void keyPressed()
{
  if(key==CODED)
  {
    if(keyCode==UP)
    {
      WindMan.windAmount+=0.1;
    }
    else if(keyCode==DOWN)
    {
      WindMan.windAmount-=0.1;
    }
  }
}


class Branch 
{
  // BRANCH PARAMETERS
  Branch[] children = new Branch[0];
  DynTree Hometree;
  float size;
  float thickness;
  float angle;
  int level;
  int levelmax = 7;
  PVector curveControl1;
  PVector curveControl2;
  float windPhase;
  Leaf leaf;
  boolean hasLeaf = false;
  float frameAngle = 0;
    
  //////////////////////////////////////////////////////////////////////
  // BRANCH CONSTRUCTOR 
  //////////////////////////////////////////////////////////////////////
  
  Branch(DynTree htree, float sz,float an, float th, int lvl, int lmax)
  {
    windPhase=random(1000);
    //Init variables
    Hometree = htree;
    size=sz;
    angle=an;
    thickness=th;
    level = lvl;
    levelmax = lmax;
    
    //Compute self
    frameAngle=angle;
    curveControl1 = new PVector(random(-size,size),random(-size,size));
    curveControl2 = new PVector(random(-size,size),random(-size,size)-size);
    
    // Compute children
    int childrenCount = round(random(Hometree.minChildCount,Hometree.maxChildCount));
    if(level<levelmax)
    {
      children = new Branch[childrenCount];
      for(int i=0;i<childrenCount;i++)
      {
        int branchLevelDiff = round(random(Hometree.minLevelIncrease,Hometree.maxLevelIncrease));
        if(random(1)<Hometree.chanceOfNoLevelIncrease)
        {
          branchLevelDiff=0;
        }
        
        float branchAngle = random(-Hometree.maxAngle,Hometree.maxAngle);
        
        float branchSize = size;
        float branchThickness = thickness;
        for (int j = 0;j<branchLevelDiff;j++)
        {
          branchSize*=random(Hometree.minSizeRatio,Hometree.maxSizeRatio);
          branchThickness*=random(Hometree.minThickRatio,Hometree.maxThickRatio);
        }
        children[i]=new Branch(Hometree,branchSize,branchAngle,branchThickness,branchLevelDiff+level,levelmax);
      }
    }
    if(level>=levelmax)
    {
      //LEAF AND FRUITS!
      
      float leafChance=0;
      float leafTint = random(10);
      float leafBrightnessModifier=0;
      float leafSizeModifier=1;
      color leafColor=color(random(Hometree.leafTintMin,Hometree.leafTintMax),Hometree.leafSaturation,Hometree.leafBrightness);
      if(saturation(leafColor)==0)
      {
        
      }
      
      if(random(100)>leafChance)
      {
        leaf = new Leaf(leafColor,random(2)+5,random(15)+15);
        leaf.Hometree=Hometree;
        hasLeaf=true;
      }
    }
  }
  
    
  //////////////////////////////////////////////////////////////////////
  // BRANCH UPDATE
  //////////////////////////////////////////////////////////////////////
  
  void update()
  {
    frameAngle=angle;
    if(level<5)
    {
      frameAngle += WindMan.windAngleOffset(size,thickness,millis(),windPhase);
    }
    pushMatrix();
    rotate(frameAngle);
    strokeWeight(thickness);
    if(level==0 || Hometree.woodFill==color(1,2,3))
    {
      noFill();
    }
    curve(curveControl1.x,curveControl1.y,0,0,0,-size,curveControl2.x,curveControl2.y);
    translate(0,-size);
    if(children.length>0)
    {
      rotate((Hometree.parentAnglePercentage-1)*frameAngle);
      for (int c = 0;c<children.length;c++)
      {
     
        children[c].update();
      }
    }
    else if (hasLeaf)
    {
      leaf.update();
    }
    popMatrix();
  }
  
  void staticUpdate()
  {
    
  }
}


class Grass
{
  PVector start;
  float size;
  float maxDisplacementPerStep=0;
  float maxDisplacementSpeed=0.05;
  float thickness;
  color tint;
  
  Grass(PVector s, float sz, float t, color ti)
  {
    start = s;
    size = sz;
    thickness = t;
    tint=ti;
    
    float movingX = start.x;
    
    for(int i =0; i<size;i++)
    {
      strokeWeight(thickness*(1-(float(i)/size)));
      //strokeWeight(5);
      stroke(tint);
      point(movingX,start.y-i);
      maxDisplacementPerStep+=random(-maxDisplacementSpeed,maxDisplacementSpeed);
      movingX+=maxDisplacementPerStep;
    }
  }
}
void grassLayer(color grassTint, float gHeight, float gHeightVar)
{
  float grassHeightVariation=gHeightVar;
  float grassHeight=gHeight;
  
  for(float k = -50;k<width+50;k+=random(0.5,1))
  {
    resetMatrix();
    PVector grassStart = new PVector(k,height*0.89);
    Grass grass = new Grass(grassStart,grassHeight+random(-40,40),random(4,12),grassTint);
    grassHeight += random(-grassHeightVariation,grassHeightVariation);
    grassHeight = min(max(grassHeight,20),500);
  }
}
class Leaf
{
  DynTree Hometree;
  color leafColor;
  float leafWidth;
  float leafLength;
  float frameAngle=0;
  
  Leaf(color _leafColor, float _leafWidth, float _leafLength)
  {
    leafColor=_leafColor;
    leafWidth=_leafWidth;
    leafLength=_leafLength;
  }
  
  void update()
  {
    pushMatrix();
    frameAngle = WindMan.windAngleOffset(leafLength*5,10,millis(),0);
    rotate(frameAngle*15);
    translate(0,-leafLength/2.0);
    fill(leafColor);
    noStroke();
    ellipse(0,0,leafWidth,leafLength);
    fill(Hometree.woodFill);
    stroke(Hometree.woodStroke);
    popMatrix();
  }
}
class DynTree
{
  //////////////////////////////////////////////////////////////////////
  // TRUNKS PARAMS 
  //////////////////////////////////////////////////////////////////////
  
  Branch trunk;
  PVector trunkStart;
  
  randomParam trunkSize = new randomParam(150,300);
  randomParam trunkAngle = new randomParam(PI/10.0);
  
  float trunkThickness;
  float trunkSizeToThicknessRatio = 1.0/10.0; 
  
   //////////////////////////////////////////////////////////////////////
  // TREE PARAMS
  //////////////////////////////////////////////////////////////////////
  
  int treeLevelMax;
  
  float minTreeLevel= 4;
  float maxTreeLevel= 7;
  
  float minChildCount=2;
  float maxChildCount=4;
  
  float minSizeRatio=0.7;
  float maxSizeRatio=0.9;
  
  float minThickRatio= 0.5;
  float maxThickRatio= 0.9;
  
  float maxAngle=PI/3.0;
  
  float parentAnglePercentage = 0.5;
  
  float maxChildrenSize = 1000;
  
  int minLevelIncrease= 1;
  int maxLevelIncrease =3; 
  
  float chanceOfNoLevelIncrease = 0.02;
  
  color woodFill=color(100);
  color woodStroke=color(0);
  float leafTintMin=0;
  float leafTintMax=15;
  float leafSaturation=100;
  float leafBrightness=100;
  
  //////////////////////////////////////////////////////////////////////
  // CONSTRUCTOR 
  //////////////////////////////////////////////////////////////////////
  
  DynTree(PVector trunkOrigin)
  {
    trunkStart = trunkOrigin;
    trunkSize.compute();
    trunkAngle.compute();
    trunkThickness = trunkSize.val*trunkSizeToThicknessRatio;
    treeLevelMax = round(lerp(minTreeLevel,maxTreeLevel,(trunkSize.val-trunkSize.min)/(trunkSize.max-trunkSize.min)));
  }
  
  void init()
  {
    trunk = new Branch(this,trunkSize.val,trunkAngle.val,trunkThickness,0,treeLevelMax);
  }
  
  //////////////////////////////////////////////////////////////////////
  // UPDATE 
  //////////////////////////////////////////////////////////////////////
  
  void update()
  {
    pushMatrix();
    translate(trunkStart.x,trunkStart.y);
    trunk.update();
    popMatrix();
  }
  
}
public class randomParam
{
  public float val;
  public float min;
  public float max;
  
  randomParam(float _min,float _max)
  {
    min=_min;
    max=_max;
  }
  
  randomParam(float _max)
  {
     min=0.0;
     max=_max;
  }
  
  float compute()
  {
    val=random(min,max);
    return val;
  }
  
  int iCompute()
  {
    val=round(random(min,max));
    return int(val);
  }
  
  int iVal()
  {
    return int(val);
  }
}
static class WindMan
{
  static float windAmount = 1.5;
  static float k = 0.4;
  static float m = 0.0015;
  
  /**
sincoslookup taken from http://wiki.processing.org/index.php/Sin/Cos_look-up_table
@author toxi (http://www.processinghacks.com/user/toxi)
*/
 
  // declare arrays and params for storing sin/cos values 
  static float sinLUT[];
  static float cosLUT[];
  // set table precision to 0.5 degrees
  static float SC_PRECISION = 0.01;
  // caculate reciprocal for conversions
  static float SC_INV_PREC = 1.0/SC_PRECISION;
  // compute required table length
  static int SC_PERIOD = (int) (360f * SC_INV_PREC);
   
  // init sin/cos tables with values
  // should be called from setup()
  static void initSinCos() 
  {
    sinLUT = new float[SC_PERIOD];
    cosLUT = new float[SC_PERIOD];
    for (int i = 0; i < SC_PERIOD; i++) 
    {
      sinLUT[i] = (float) sin(i * DEG_TO_RAD * SC_PRECISION);
      cosLUT[i] = (float) cos(i * DEG_TO_RAD * SC_PRECISION);
    }
  }
  
  static float windAngleOffset(float branchSize,float branchThickness, float time,float windPhase)
  {
    
    float a = degrees((1.0/branchSize)*time*k+windPhase)*SC_INV_PREC;
    
    return sinLUT[int((a+SC_PERIOD)%SC_PERIOD)]*branchSize*windAmount*m*(1.0/(branchThickness+10));
    
  }
}


