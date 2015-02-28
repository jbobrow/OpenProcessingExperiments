
class Point
{
  float x;
  float y;
}

class Body
{
  Point[] iNodes;
  Point[] oNodes;
  float innerRad, outerRad;
  int nodeCount;
  float xPos, yPos;
  
  Body(float xP, float yP, float innerR, float outerR, int nodes,int ran)
  {
    float theta = TWO_PI/nodes;
   
    this.xPos = xP;
    this.yPos = yP;
   
    innerRad = innerR;
    outerRad = outerR;
    nodeCount = nodes;
    this.iNodes = new Point[nodes]; 
    this.oNodes = new Point[nodes];
    
    for(int i = 0; i< nodeCount; i++)
    {
      this.oNodes[i] = new Point();
      this.oNodes[i].x = this.xPos + cos(i*theta)*this.outerRad + random(-ran,ran); 
      this.oNodes[i].y = this.yPos + sin(i*theta)*this.outerRad + random(-ran,ran);
      
      this.iNodes[i] = new Point();
      this.iNodes[i].x = this.xPos + cos((theta/2)+(i*theta))*this.innerRad + random(-ran,ran); 
      this.iNodes[i].y = this.yPos + sin((theta/2)+(i*theta))*this.innerRad + random(-ran,ran);
      
    //  println("THETA:"+theta+"  innerX:"+iNodes[i].x+" innerY:"+iNodes[i].y+" outerX:"+oNodes[i].x+" outerY:"+oNodes[i].y);
    }
  }
  
  void drawMe()
  {
  //  stroke(0);
   // beginShape();
    
    for(int i = 0; i < nodeCount; i++)
    {
      int minPos;
      
      if(i == 0)
        minPos = nodeCount-1;
      else
        minPos = i-1;
        
     
     float lastMidX =lerp(this.oNodes[i].x, this.iNodes[minPos].x,0.5);
     float lastMidY =lerp(this.oNodes[i].y, this.iNodes[minPos].y, 0.5);
     
     float midX = lerp(this.oNodes[i].x, this.iNodes[i].x,0.5);
     float midY = lerp(this.oNodes[i].y, this.iNodes[i].y,0.5);
     
     float nextMidX = lerp(this.oNodes[(i+1)%nodeCount].x, this.iNodes[i].x,0.5);
     float nextMidY = lerp(this.oNodes[(i+1)%nodeCount].y, this.iNodes[i].y,0.5);
     
    // fill(255);
    // ellipse(this.oNodes[i].x,this.oNodes[i].y,4,4);
    // ellipse(this.iNodes[i].x,this.iNodes[i].y,4,4);
     
    // fill(255,0,0);
     //ellipse(midX,midY,4,4);
     //fill(0,0255);
     //ellipse(lastMidX,lastMidY,4,4);

      noFill();
      color col3 = lerpColor(col1,col2,abs(cos(frameCount/100.0)));
  //stroke(col3,5);
     stroke(col3,opaqueness);
     bezier(lastMidX, lastMidY, this.oNodes[i].x,this.oNodes[i].y,this.oNodes[i].x,this.oNodes[i].y,midX,midY);
     bezier(nextMidX,nextMidY,this.iNodes[i].x,this.iNodes[i].y,this.iNodes[i].x,this.iNodes[i].y,midX, midY);
    }
   // endShape(CLOSE);
  }
  
}

