
class MyBox 
{ 
  PVector initPos  = new PVector(); 
  PVector scaleRatio = new PVector(); 
  float rotX, rotY, rotZ;  
  float[] coords = { 
    /*+z front*/  -1, -1,  1,  1, -1,  1,  1,  1,  1, -1,  1,  1,  
    /*-z back*/    1, -1, -1, -1, -1, -1, -1,  1, -1,  1,  1, -1,  
    /*+y bottom*/ -1,  1,  1 , 1,  1,  1,  1,  1, -1 ,-1,  1, -1,  
    /*-y top*/    -1, -1, -1,  1, -1, -1,  1, -1,  1, -1, -1,  1,  
    /*+x right*/   1, -1,  1,  1, -1, -1,  1,  1, -1,  1,  1,  1,  
    /*-x left*/   -1, -1, -1, -1, -1,  1, -1,  1,  1, -1,  1, -1  
  }; 
 
   
  MyBox(PVector _initPos) 
  { 
    initPos = _initPos; 
//    rotX = _rotX; 
//    rotY = _rotY; 
//    rotZ = _rotZ; 
  } 
  
  void live(PVector newDim) 
  { 
    pushMatrix();
    scaleRatio = newDim;
    //noStroke();
    noFill();
    stroke(#000000, 50); 
    rotateX(rotX); 
    rotateY(rotY); 
    rotateZ(rotZ); 
    translate(newDim.x/2, newDim.y/2, newDim.z/2);
    for(int i = 0; i <= 60; i+=12){    
        beginShape(QUADS);  
        vertex((coords[i]+initPos.x)*scaleRatio.x/2, (coords[i+1]+initPos.y)*scaleRatio.y/2,  (coords[i+2]+initPos.z)*scaleRatio.z/2); 
        vertex((coords[i+3]+initPos.x)*scaleRatio.x/2, (coords[i+4]+initPos.y)*scaleRatio.y/2,  (coords[i+5]+initPos.z)*scaleRatio.z/2);  
        vertex((coords[i+6]+initPos.x)*scaleRatio.x/2, (coords[i+7]+initPos.y)*scaleRatio.y/2,  (coords[i+8]+initPos.z)*scaleRatio.z/2);  
        vertex((coords[i+9]+initPos.x)*scaleRatio.x/2, (coords[i+10]+initPos.y)*scaleRatio.y/2,  (coords[i+11]+initPos.z)*scaleRatio.z/2); 
        endShape();  
      }
    popMatrix();
  } 
   
  
} 


