
int[]  patternPixels, maskPixels;
float [] outfloatData, infloatData, patternB, patternR, patternG;
int patternHeight, currentLine, depthMaskWidth, depthMaskHeight, nbeColors, zeroSize, patternLine, patternWidth;
int dpi, screenDistance, minDepth, zeroDepth, maxDepth;
float coeff;
PImage imageFinale, depthMask, pattern;
Boolean rendered;

void setup() {
  rendered=false;
  nbeColors = 500;  
  minDepth=15;
  maxDepth=25;
  zeroDepth=16;
  screenDistance=17;
  dpi=150;
  coeff=2.5;
  zeroSize = depthToOffset(zeroDepth) + 1;
  size(982, 800, P3D); 
  background(0);
  fill(80);
  noStroke();
}
void draw() {
  // Lights
  if (!rendered)spotLight(255, 255, 255, width/2, height/2, 600, 0, 0, -1, PI/2, 2);
  if (mousePressed) {
    translate(mouseX, mouseY, -50);
    sphere(30);
  }
}
void keyPressed() {
  if (rendered) {
    background(0);
    rendered=false;
  }
  else {
    rendered=true;
    filter(BLUR);
    filter(BLUR);
    loadPixels();   
    Generate() ;
    imageFinale.updatePixels();
    lights();
    image(imageFinale, 0, 0);
  }
}
void Generate() 
{  
  currentLine=0;
  String nt=str(int(1+random(4)));
  pattern=loadImage("pattern"+nt+".jpg");  
  patternWidth = pattern.width;
  patternHeight = pattern.height;
  patternPixels = pattern.pixels;
  patternR = new float[patternWidth+1];
  patternG = new float[patternWidth+1];
  patternB = new float[patternWidth+1];  
  depthMaskWidth = 800;
  depthMaskHeight = 800;
  depthMask=new PImage(800, 800);
  depthMask=get(zeroSize/2, 0, 800, 800 );
  imageFinale = new PImage(width, height);
  imageFinale.loadPixels();
  outfloatData = new float[width];  
  infloatData = new float[depthMaskWidth]; 
  depthMask.loadPixels();
  //depthMask.resize(800, int(800*(float)800/(800+zeroSize)));
  maskPixels = depthMask.pixels;
  
  while (currentLine<depthMaskHeight) {
    int startingPoint = 0;
    int currentPointColor ;
    float redComp ;
    float blueComp ;
    float greenComp ;
    int finalPointColor ;
    startingPoint = 0;
    while (startingPoint < patternWidth)
    {
      patternLine = currentLine % patternHeight;
      currentPointColor = patternPixels[patternLine * patternWidth + startingPoint];
      patternR[startingPoint] = red(currentPointColor) / 255;
      patternB[startingPoint] = blue(currentPointColor) / 255;
      patternG[startingPoint] =green(currentPointColor) / 255;
      startingPoint++;
    }
    patternR[patternWidth] = patternR[0];
    patternG[patternWidth] = patternG[0];
    patternB[patternWidth] = patternB[0];
    startingPoint = 0;
    while (startingPoint < depthMaskWidth)
    {                
      currentPointColor = maskPixels[currentLine * depthMaskWidth + startingPoint];
      infloatData[startingPoint] = (red(currentPointColor)+blue(currentPointColor)+green(currentPointColor)) / nbeColors;
      startingPoint++;
    }
    startingPoint = 0;
    while (startingPoint < zeroSize)
    {
      outfloatData[startingPoint] = (float)patternWidth * startingPoint / zeroSize;
      startingPoint++;
    }
    startingPoint = 0;
    while (startingPoint < depthMaskWidth-1)
    {
      outfloatData[startingPoint + zeroSize] = patternWidth * findIndex(startingPoint, infloatData);
      startingPoint++;
    }
    startingPoint = 0;
    while (startingPoint < depthMaskWidth + zeroSize)
    {
      redComp = interpolate(patternR, outfloatData[startingPoint]) * 255;
      blueComp = interpolate(patternB, outfloatData[startingPoint]) * 255;
      greenComp = interpolate(patternG, outfloatData[startingPoint]) * 255;
      finalPointColor = color(redComp, greenComp, blueComp);
      imageFinale.pixels[startingPoint+ currentLine*(depthMaskWidth + zeroSize)]= finalPointColor;
      startingPoint++;
    }
    currentLine ++;
  }
}

float interpolate(float []tab, float value)
{
  float fract;
  float ret=0;
  fract = value - int(value);
  ret = tab[int(value)] * (1 - fract) + tab[(int(value) + 1)] * fract;
  return ret;
}

int depthToOffset(float depth)
{
  return int(depth * coeff * dpi / (depth + screenDistance));
}

float findIndex(float value, float[] data)
{
  float depth;
  int offset=0;
  float interpolation;
  while (value - offset >= 0 ) {
    value-=offset;
    interpolation = interpolate(data, value);
    if (interpolation <= 0)
    {
      depth = zeroDepth;
    }
    else
    {
      depth = minDepth + (maxDepth-minDepth  ) * interpolation;
      //depth = maxDepth + (minDepth - maxDepth) * interpolation;
    }
    offset = depthToOffset(depth);
    if (value - offset < 0)
    {
      return 1 + (float)(value - offset) / depthToOffset(zeroDepth);
    }
  }
  return 0;
}


