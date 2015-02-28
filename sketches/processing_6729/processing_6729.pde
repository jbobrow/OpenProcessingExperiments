
/*****************************************************************************
 * animation of rolling hillsides using perlin noise.
 ******************************************************************************/

int width=800;
int height=600;
MountainRange m1;
MountainRange m2;
//MountainRange m3;
//MountainRange m4;
//MountainRange m5;
//MountainRange m6;
int cntr = 0;
int fadeMargin = 200;

void setup()
{
  size(800,600);
  m1 = new MountainRange(.005, 120+200, 600, color(93,107,166));
  m2 = new MountainRange(.003, 200, 450, color(77,91,151));
  //m3 = new MountainRange(.008, 60, 200, color(61,76,131));
  //m4 = new MountainRange(.0065, 50, 190, color(55,69,122));
  //m5 = new MountainRange(.004, 30, 150, color(46,55,93));
  //m6 = new MountainRange(.002, 10, 130, color(12,16,35));
  background(#FFFFFF);
}

void draw()
{
  //background(110,119,172);
  if(cntr < width+height) {
  m1.drawMountains();
  m2.drawMountains();
  //m3.drawMountains();
  //m4.drawMountains();
  //m5.drawMountains();
  //m6.drawMountains();
  }
  strokeWeight(4);
  stroke(#ffffff);
  point(cntr, 1);
  cntr++;
}

class MountainRange{
  int mD; //records the position in the array to place new height value
  float mT; //records time passed for noise.  The lower the time, the smoother the transistions (like lower land)
  float mInc; // amount to incrament time by
  float mMin; //lowest elevation of the mountains
  float mMax; //highest elevation of the mountains
  color mC; //holds the color of the mountain range
  float mR; // read value
  float mG; // green value for color
  float mB; // blue value for color
  int[] rangeHeights;

  MountainRange( float newInc, float mountainMin, float mountainMax, color newMC){
    mD=0;// place in range
    mT=random(0,1000);
    mInc=newInc;
    mMin = mountainMin;
    mMax = mountainMax;
    mC = newMC;
    
    rangeHeights = new int[width];
    /*for(int i=0; i<width; i++){ 
      rangeHeights[i] = (int)(height-noise(mT)*(mMax-mMin)-mMin);
      mT+=mInc; 
    }*/
    // Itterate until you find a low point in the range and draw from there
    /*while((int)(height-noise(mT)*(mMax-mMin)-mMin) > mountainMin-10) {
      mT+= mInc;
    }*/
  }

  void drawMountains(){
    stroke(mC);
    strokeWeight(1);
    noFill();
    if(mD < width) {
      rangeHeights[mD] = (int)(height-noise(mT)*(mMax-mMin)-mMin);
    }
    mD++;
    for(int i=0; i<rangeHeights.length; i++)
    {
      fade(i, rangeHeights[i], mR, mG, mB, (mD-i + 1));
    }
    mT+= mInc;
  } 
  
  void fade(float x, float y, float r, float g, float b, int loc) {
  float length = height - y;
    if(x < fadeMargin) {
        stroke(r, g, b, 255*(length-loc)/length*x/fadeMargin);
    }
    else if( x > width-fadeMargin ) {
      stroke(r, g, b, 255*(length-loc)/length*(width-x)/fadeMargin);
    }
    else {
      stroke(r, g, b, 255*(length-loc)/length);
    }
    point(x,y+loc);
  //}
}
}

