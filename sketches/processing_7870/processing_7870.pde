
class POV{
  float x, y;

  float elevation;
  float azimuth;
  float distance;

  POV (float sentDistance){
    distance     = sentDistance;
    azimuth      = 0.0;
   // elevation    = 0.0;
    elevation    = 1.3; //0.0
  }
  
  void exist(){
    setCamera();
  }

  void setCamera(){  
    translate(xMid,yMid,distance);
    rotateX(elevation);
    rotateZ(azimuth);
  }
}

