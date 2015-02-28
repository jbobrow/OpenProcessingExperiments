
class Plot{
  float axisWidth ;
  float axisHeight;
  float drawWidth;
  float drawHeight;
  Plot(float axisWidthd,float axisHeightd, float drawWidthd, float drawHeightd){
    axisWidth = axisWidthd;
    axisHeight = axisHeightd;
    drawWidth = drawWidthd;
    drawHeight = drawHeightd;
  }
    Dot getPointForWindowInPlot(Dot myPoint){
      float x = map(myPoint.x,0,axisWidth,0,drawWidth);
      float y = map(myPoint.y,0, axisHeight,0,drawHeight);
      y = (y*-1)+drawHeight;
      Dot newPoint = new Dot(x,y);
      return newPoint;
    }
}


