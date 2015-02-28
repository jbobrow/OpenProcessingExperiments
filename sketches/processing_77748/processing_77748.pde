
class Plot
{
  float x,y,w,h;
  float ymin,ymax;
  Plot(float tx, float ty, float tw, float th)
  {
    x = tx;
    y = ty;
    w = tw;
    h = th;
  }
  void yrange(float yin, float yax)
  {
    ymin = yin;
    ymax = yax;
  }
  
  void graph(float[] data)
  {
    beginShape();
    for(int i=0 ; i<data.length ; i++)
    {
      float plotx = map(i,0,data.length,x,x+w);
      float ploty = map(data[i],ymin,ymax,y+h,y);
      vertex(plotx,ploty);
    }
    endShape();
  }
  void bar(float[] data)
  {
    for(int i=0 ; i<data.length ; i++)
    {
      float plotx = map(i,0,data.length,x,x+w);
      float ploty = map(data[i],ymin,ymax,y+h,y);
      line(plotx,y+h,plotx,ploty);
    }
  }
  void label(int labs[],int space)
  {
    for(int i=0 ; i<labs.length ; i+=space)
    {
      float plotx = map(i,0,labs.length,x,x+w);
      text( nf(labs[i],2), plotx,y+h);
    }
  }
}


