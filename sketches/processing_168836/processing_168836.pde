
/*
Fractal list generation using regular ArrayLists rather than linkedLists
 
 Math and code adapted from:
 http://rectangleworld.com/blog/archives/538
 */

int subdivSteps = 14;
//int dataSize = int(pow(2, subdivSteps)+1);
//xyPt data[] = new xyPt[dataSize];

int screenHeight= 256;
int screenWidth = 1024;

void setup()
{

  size(screenWidth,screenHeight);
  background(150,250,150);
  
}

void draw()
{
  xyPt[] data2 = createFractalList(subdivSteps);
  int dataSize = int(pow(2, subdivSteps)+1);

  //printLineData(data2, dataSize);
  normalizeCurveData(data2,dataSize);
  drawCurveData(data2, dataSize);
}

void drawCurveData(xyPt[] data, int dataSize)
{
  fill(150,250,150,24);
  noStroke();
  rect(0,0,screenWidth,screenHeight);
  stroke(random(200.0), random(100.0), random(200.0), 64);
  
  for (int i = 0; i < dataSize-1; i++) {
    line(data[i].x*screenWidth, data[i].y*screenHeight, data[i+1].x*screenWidth,data[i+1].y*screenHeight);
  }

}




void normalizeCurveData(xyPt[] data, int dataSize)
{
  float minY = 2.0;
  float maxY = -2.0;
  for (int i = 0; i < dataSize; i++) {
    if (data[i].y < minY)
      minY = data[i].y;
    else if (data[i].y > maxY)
      maxY = data[i].y;
  }

  float coefficient = 1.0 / (maxY-minY); 

  if (maxY != minY){
    for (int i = 0; i < dataSize; i++) {
      data[i].y = coefficient*(data[i].y - minY);
    }
  }else{
    for (int i = 0; i < dataSize; i++) {
      data[i].y = 0.5;
    }    
  }
}

void printLineData(xyPt[] data, int dataSize)
{
  // debug - print out list
  for (int i = 0; i < dataSize; i++) {
    println(i+": "+data[i].x+ ", " + data[i].y);
  }
}

xyPt[] createFractalList(int numSteps) 
{
  // returns 2^numSteps sized data lists of x,y points which can be used to draw


  int dataSize = int(pow(2, numSteps)+1);
  xyPt data[] = new xyPt[dataSize];
  float yValue = 0.5;
  data[0] = new xyPt(0.0, yValue);
  data[dataSize-1] = new xyPt(1.0, yValue);

  int stepSize, guideStepSize;
  float newX, newY, dx, split;

  for (int step = 0; step < numSteps; step++)
  {
    //println("step = "+step);
    stepSize = int( pow(2, (numSteps-step)) );
    guideStepSize = stepSize / 2;
    for (int j = int (stepSize*0.5); j < dataSize-1; j+=stepSize)
    {
      //print(j + ", ");

      // prev is -guideStepSize, next is +guideStepSize
      dx = data[j+guideStepSize].x - data[j-guideStepSize].x;
      split = random(0.333, 0.666);
      newX = split*data[j+guideStepSize].x + (1-split)*data[j-guideStepSize].x;
      newY = split*data[j+guideStepSize].y + (1-split)*data[j-guideStepSize].y;
      newY += dx*(random(2.0)-1);
      data[j] = new xyPt(newX, newY);
    }

    //print("\n");
  }

  return data;
}



class xyPt{
  public float x,y;
  xyPt()
  {
     x = 0.0;
     y = 0.0;
  }
  xyPt(float in_x, float in_y)
  {
    x = in_x;
    y = in_y;
  }
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
}



