
float xStart = -1.5*PI;
float xEnd = 1.5*PI;
float yScale = 150;
float xDelta = PI/20;

void setup(){
  size(1000,500);
  frameRate(30);
}

void draw(){
  
  background(255);
  smooth();
  
  PVector[] graphPoints = sinePlot(xStart, xEnd, 1000, 500, yScale);
  drawHistogram(graphPoints, 500);
  float[] delta = flowGraph(xStart, xEnd, yScale, xDelta);
  xStart = delta[0];
  xEnd = delta[1];
}

PVector sinePoint(float x, int Height, float yScale){
  PVector location = new PVector();
  
  location.x = round(x);
  location.y = round((Height/2) - (yScale*sin(x)));
  
  return location;
}

PVector[] sinePlot(float xStart, float xEnd, int Width, int Height, float yScale){
  PVector[] graphPoints = new PVector[Width];
  float xScale = (xEnd - xStart) / Width;
  float x = xStart;
  for(int i = 0; i < Width; i++){
    graphPoints[i] = sinePoint(x, Height, yScale);
    x += xScale;
  }
  return graphPoints;
}

void drawConnections(PVector[] graphPoints){
  for(int i = 1; i < graphPoints.length; i++){
    line(i-1, graphPoints[i-1].y, i, graphPoints[i].y);
  }
}

void drawHistogram(PVector[] graphPoints, int Height){
  for(int i = 0; i < graphPoints.length; i+=16){
    line(i, Height/2, i, graphPoints[i].y);
    //line(i, Height/2, (i+graphPoints[i].y)* 0.5, graphPoints[i].y);
  }
}

float[] flowGraph(float xStart, float xEnd, float yScale, float xDelta){
  xStart += xDelta;
  xEnd += xDelta;
  float[] delta = {xStart, xEnd, yScale};
  return delta;
}



