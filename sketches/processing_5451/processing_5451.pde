
class Block 
{ 
  PVector initPos  = new PVector(); 
  PVector scaleRatio = new PVector(1,1,1); 
  float rotX, rotY, rotZ;  
  String dailyVisits;
  String weekDay;
  //int txTure = int(random(6)); 
  float[] coords = { 
    /*+z front*/  -1, -1,  1,  1, -1,  1,  1,  1,  1, -1,  1,  1,  
    /*-z back*/    1, -1, -1, -1, -1, -1, -1,  1, -1,  1,  1, -1,  
    /*+y bottom*/ -1,  1,  1 , 1,  1,  1,  1,  1, -1 ,-1,  1, -1,  
    /*-y top*/    -1, -1, -1,  1, -1, -1,  1, -1,  1, -1, -1,  1,  
    /*+x right*/   1, -1,  1,  1, -1, -1,  1,  1, -1,  1,  1,  1,  
    /*-x left*/   -1, -1, -1, -1, -1,  1, -1,  1,  1, -1,  1, -1  
  }; 
 
  Block() 
  { 
     
  } 
   
  Block(PVector _initPos, PVector _scaleRatio, float _rotX, float _rotY, float _rotZ, String dv, String wd) 
  { 
    initPos = _initPos; 
    scaleRatio = _scaleRatio; 
    rotX = _rotX; 
    rotY = _rotY; 
    rotZ = _rotZ;
    dailyVisits = dv;
    weekDay = wd;
  } 
  
  void build() 
  {     
    for(int i = 0; i <= 60; i+=12){
      stroke(#000000);
      line(coords[i]+initPos.x, 0, coords[i+2]+initPos.z, coords[i]+initPos.x, 0, coords[i+2]+initPos.z+2); 
      float dv =  Float.parseFloat(dailyVisits);
      if(dv >= dataMax){
      fill(#24A4BC);
      }
      else fill(#ffffff);
      beginShape(QUADS);  
      vertex((coords[i]+initPos.x)*scaleRatio.x, (coords[i+1]+initPos.y)*scaleRatio.y,  (coords[i+2]+initPos.z)*scaleRatio.z); 
      vertex((coords[i+3]+initPos.x)*scaleRatio.x, (coords[i+4]+initPos.y)*scaleRatio.y,  (coords[i+5]+initPos.z)*scaleRatio.z);  
      vertex((coords[i+6]+initPos.x)*scaleRatio.x, (coords[i+7]+initPos.y)*scaleRatio.y,  (coords[i+8]+initPos.z)*scaleRatio.z);  
      vertex((coords[i+9]+initPos.x)*scaleRatio.x, (coords[i+10]+initPos.y)*scaleRatio.y,  (coords[i+11]+initPos.z)*scaleRatio.z); 
      endShape();  
  
      fill(#000000);
      textSize(0.45);
      pushMatrix();
      textAlign(CENTER);
      rotateX(HALF_PI);      
      text("Visits \n"+dailyVisits, initPos.x, 3, 0);
      pushMatrix();
      textSize(0.7);
      textAlign(RIGHT);
      rotateZ(-HALF_PI);
      text(weekDay, -5, initPos.x , 0);
      popMatrix();
      popMatrix();
    }  
    } 
} 


