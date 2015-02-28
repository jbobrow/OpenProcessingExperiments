
class Spot {
  
  
  float x;
  float y;
  float mx;
  float my;
  float sz;
  float mouseDist;
  float mouseDistMapped;
  
  
  
  Spot(float xPos, float yPos, float spotSize){
    x=xPos;
    y=yPos;
    sz=spotSize;
    
  }
  
    void update(float mousePosX, float mousePosY){
    mx = mousePosX;
    my = mousePosY;
    mouseDist = dist(x, y, mx, my);
    mouseDist = constrain(mouseDist, 0, 200);
    mouseDistMapped = map(mouseDist, 0, 200, 1.3, 0.2);
  }
  
  void display(){
    
    fill(mx,my,x);
    ellipse (x,y,sz * mouseDistMapped, sz * mouseDistMapped); 
    
  }
  
  
}


