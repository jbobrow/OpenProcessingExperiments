
class Cloud{
  float cX;
  float cY;
  float cW;
  float cH;
  PImage cloud;
  
  Cloud() {
    
  }
  
  
   void build(float cX1, float cY1, float cW1, float cH1) {
     cX = cX1;
    cY = cY1;
    cW = cW1;
    cH = cH1;
    imageMode(CENTER);
    cloud = loadImage("cloud.gif");
      image(cloud,cX,cY,cW,cH); 
}
 
  }

