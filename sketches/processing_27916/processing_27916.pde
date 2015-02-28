
class Exploder
{
  float xTheta=0, yTheta=0, zTheta=0;
  float xTheta2=0, yTheta2=0, zTheta2=0;
  float lastX, lastY, lastZ;
  float chaos = TWO_PI/16.0;
  float chaos2 = TWO_PI/5.0;
  float w = 15;
  float h = 15;
  boolean going = true;
  ArrayList points;
  
  
  color col1 = color(230,0,0);
  color col2 = color(0,190,0,0);
  
  Exploder(float x, float y, float z, float xT, float yT, float zT)
  {
    xTheta = xT;
    yTheta = yT;
    zTheta = zT;
    lastX = x;
    lastY = y;
    lastZ = z;
    
    points = new ArrayList();
  }
  
  void drawMe()
  {
    color colour = lerpColor(col1,col2,abs(cos(frameCount/50.0)));
  
    if(going)
    {  
      xTheta+=random(-chaos,chaos);
      yTheta+=random(-chaos,chaos);
      zTheta+=random(-chaos,chaos);
      
      xTheta2+=random(-chaos2,chaos2);
      yTheta2+=random(-chaos2,chaos2);
      zTheta2+=random(-chaos2,chaos2);
    
      lastX +=sin(xTheta)*h; 
      lastY +=sin(yTheta)*h; 
      lastZ +=sin(zTheta)*h;
      
      points.add(new Point(lastX, lastY, lastZ,xTheta2,yTheta2,zTheta2, colour));
    }
    
    for(int i = 0; i < points.size()-1; i++)
    {
      Point pt = (Point)points.get(i);
      Point pt1 = (Point)points.get((i+1));
      
      fill(pt1.myCol);
      
      beginShape(QUAD_STRIP);
        vertex(pt.x-cos(pt.xTheta)*w/2, pt.y-cos(pt.yTheta)*w/2,pt.z-cos(pt.zTheta)*w/2);
        vertex(pt1.x-cos(pt1.xTheta)*w/2, pt1.y-cos(pt1.yTheta)*w/2,pt1.z-cos(pt1.zTheta)*w/2);
        vertex(pt.x+cos(pt.xTheta)*w/2, pt.y+cos(pt.yTheta)*w/2,pt.z+cos(pt.zTheta)*w/2);
        vertex(pt1.x+cos(pt1.xTheta)*w/2, pt1.y+cos(pt1.yTheta)*w/2,pt1.z+cos(pt1.zTheta)*w/2);
       // vertex(pt.x,pt.y,pt.z);
      endShape();
     // line(pt.x,pt.y,pt.z,pt1.x,pt1.y,pt1.z);
    }
  }
}

