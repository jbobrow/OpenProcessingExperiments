
class Cubo
{
  PVector initPos  = new PVector();
  PVector scaleRatio = new PVector();
  Photo p;
  PImage tImg;
  int id;
  int rndr; // 0 cubes , 1 texts
  
  float[] coords = {
    /*+z front*/-1, -1,  1, 1, -1,  1, 1,  1,  1, -1,  1,  1, 
    /*-z back*/  1, -1, -1, -1, -1, -1,-1,  1, -1, 1,  1, -1, 
    /*+y bottom*/ -1,  1,  1 ,1,  1,  1, 1,  1, -1 ,-1,  1, -1, 
    /*-y top*/   -1, -1, -1, 1, -1, -1, 1, -1,  1, -1, -1,  1, 
    /*+x right*/ 1, -1,  1, 1, -1, -1, 1,  1, -1, 1,  1,  1, 
    /*-x left*/-1, -1, -1, -1, -1,  1, -1,  1,  1, -1,  1, -1 
  };


  Cubo(PVector _initPos, PVector _scaleRatio, int _id)
  {
    initPos = _initPos;
    scaleRatio = _scaleRatio;
    id = _id;
    tImg = tempImage;
    rndr = 0;
  }
 
 
  
  void render()
  {      
      if(id <= photos.size()-1){
          p = (Photo) photos.get(id);   
          
          switch (rndr) { 
              case 0:            
              p.doLoad();
              if(p.loaded) 
                tImg = p.imgHolder;
              
              
              
              noStroke();
              noFill();
              rotateY(radians(90));
              for(int i = 0; i <= 60; i+=12){          
                  beginShape(QUADS);
                  texture(tImg);
                  vertex(coords[i]*scaleRatio.x, coords[i+1]*scaleRatio.y, coords[i+2]*scaleRatio.z, 0, 0);
                  vertex(coords[i+3]*scaleRatio.x, coords[i+4]*scaleRatio.y, coords[i+5]*scaleRatio.z, 1, 0); 
                  vertex(coords[i+6]*scaleRatio.x, coords[i+7]*scaleRatio.y, coords[i+8]*scaleRatio.z, 1, 1); 
                  vertex(coords[i+9]*scaleRatio.x, coords[i+10]*scaleRatio.y, coords[i+11]*scaleRatio.z, 0, 1);
                  endShape();          
              }  
              break;
              
              case 1: 
              textSize(.4); 
              fill(0);
              String temp = p.desc;
              float tempW = textWidth(temp);
              pushMatrix();
              //translate(0,-10,0);
              rotateY(radians(-90));
              rotateZ(radians(-90));
              text(temp,0,0,0); 
              popMatrix();
              break;
          
          }
        }
   }

  void setRndr(int _rndr){
    rndr = _rndr;
  }
}

