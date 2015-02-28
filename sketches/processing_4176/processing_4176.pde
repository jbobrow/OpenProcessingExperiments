
class Building
{
  PVector initPos  = new PVector();
  PVector scaleRatio = new PVector(1,1,1);
  float rotX, rotY, rotZ; 
  int txTure = int(random(6));
  float[] coords = {
    /*+z front*/  -1, -1,  1,  1, -1,  1,  1,  1,  1, -1,  1,  1, 
    /*-z back*/    1, -1, -1, -1, -1, -1, -1,  1, -1,  1,  1, -1, 
    /*+y bottom*/ -1,  1,  1 , 1,  1,  1,  1,  1, -1 ,-1,  1, -1, 
    /*-y top*/    -1, -1, -1,  1, -1, -1,  1, -1,  1, -1, -1,  1, 
    /*+x right*/   1, -1,  1,  1, -1, -1,  1,  1, -1,  1,  1,  1, 
    /*-x left*/   -1, -1, -1, -1, -1,  1, -1,  1,  1, -1,  1, -1 
  };

  Building()
  {
    
  }
  
  Building(PVector _initPos, PVector _scaleRatio, float _rotX, float _rotY, float _rotZ)
  {
    initPos = _initPos;
    scaleRatio = _scaleRatio;
    rotX = _rotX;
    rotY = _rotY;
    rotZ = _rotZ;
  }
 
  void build()
  {
    
    noStroke();
    rotateX(rotX);
    rotateY(rotY);
    rotateZ(rotZ);
    for(int i = 0; i <= 60; i+=12){   
        beginShape(QUADS); 
        texture(surface[txTure]);
        vertex((coords[i]+initPos.x)*scaleRatio.x, (coords[i+1]+initPos.y)*scaleRatio.y,  (coords[i+2]+initPos.z)*scaleRatio.z, 0, 0);
        vertex((coords[i+3]+initPos.x)*scaleRatio.x, (coords[i+4]+initPos.y)*scaleRatio.y,  (coords[i+5]+initPos.z)*scaleRatio.z, 1, 0); 
        vertex((coords[i+6]+initPos.x)*scaleRatio.x, (coords[i+7]+initPos.y)*scaleRatio.y,  (coords[i+8]+initPos.z)*scaleRatio.z, 1, 1); 
        vertex((coords[i+9]+initPos.x)*scaleRatio.x, (coords[i+10]+initPos.y)*scaleRatio.y,  (coords[i+11]+initPos.z)*scaleRatio.z, 0, 1);
        endShape(); 
      } 
  }
  
 
}

