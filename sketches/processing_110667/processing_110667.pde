
int WID = 800;  // screen dimensions
int HEI = 600;

int petalNo = 150;  // number of petals on screen

float[] petalX = new float[petalNo];  // arrays of petal positions
float[] petalY = new float[petalNo];
float[] petalCurve = new float[petalNo];  //array of petal curves/sizes
float[] petalAngle = new float[petalNo];  // array of petal starting angles
float[] petalRotate = new float[petalNo];  // array of petal rotation speeds
float[] petalScale = new float[petalNo];  // array of petal scales
float[] petalScaleStep = new float[petalNo];  // array of petal fading speed
int[] petalColour = new int[petalNo];  // array of petal colours
float[] petalOpacity = new float[petalNo];  // array of fog opacity for each petal

color[] palette = {#FAC9CC, #FAB5CA, #FF9DAF, #F4B8C2, #FFB1BE};  // petal colours

void setup()
{
  size(WID,HEI);
  background(240);
  noStroke();
  
  for(int i=0; i<petalNo; i++)  // using loop to setup petal initial properties
  {
    petalSetup(i);  // see method description below
  }
}

void draw()
{
  background(240);  // refreshing screen
  for(int i=0; i<petalNo; i++)  // using loop to draw petals and update petal properties
  {
    petalDraw(i);  // draw petal (see method description below)
    petalAngle[i] += petalRotate[i];  // update petal angle
    if(petalScale[i]>=0)  // while petal scale is non-negative
    {
      petalScale[i] -= petalScaleStep[i];  // decrease scale
      petalOpacity[i] = 255-255*petalScale[i];  // increase opacity of fog over petal
    }
    else  // when scale reaches zero
    {
      petalSetup(i);  // generate a new petal
    }
  }
}

void petalSetup(int p)  // method: generate a new petal by filling out correspending array slots
{
  petalX[p] = random(WID);  // random X and Y coordinates across the screen
  petalY[p] = random(HEI);
  petalCurve[p] = random(60,90);  // random size of the bezier curve
  petalAngle[p] = random(360);  // random starting angle
  petalRotate[p] = random(-2,2);  // random rotation speed and direction
  petalScale[p] = 1;  // initial scale
  petalScaleStep[p] = random(0.001, 0.01);  // random scaling down step
  petalColour[p] = int(random(palette.length));  // random colour index
  petalOpacity[p] = 0;  // starting fog-over-petal opacity
}

void petalDraw(int p)  // method to draw a petal to screen
{
  petalX[p] += random(-0.1,0.1);  // create a slight vibration by modifying the coordinates slightly
  petalY[p] += random(-0.1,0.1);
  pushMatrix();  // begin transformation block
  translate(petalX[p]-petalCurve[p]*0.2,petalY[p]-petalCurve[p]*0.2);  // move origin to a new location
  rotate(radians(petalAngle[p]));  // rotate the petal
  scale(petalScale[p]);  // scale the petal
  translate(-petalX[p]+petalCurve[p]*0.2,-petalY[p]+petalCurve[p]*0.2);  // move the origin back
  fill(palette[petalColour[p]]);  // set colour
  // draw petal
  bezier(petalX[p],petalY[p],petalX[p]-petalCurve[p],petalY[p]-petalCurve[p]*1.5,petalX[p]+petalCurve[p],petalY[p]-petalCurve[p]*1.5,petalX[p],petalY[p]);
  fill(240,petalOpacity[p]);  // set colour to background with transparency component
  // draw the same shape over the petal
  bezier(petalX[p],petalY[p],petalX[p]-petalCurve[p],petalY[p]-petalCurve[p]*1.5,petalX[p]+petalCurve[p],petalY[p]-petalCurve[p]*1.5,petalX[p],petalY[p]);
  popMatrix();  // close transformation block
}
