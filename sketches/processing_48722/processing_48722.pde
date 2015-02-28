
class Cell{
  
  PImage bitmap;
  float xoffset,yoffset;
  float zoffset,zoffsetTarget;
  float r,g,b;
  
  Cell(PImage bitmap, float xoffset, float yoffset){
    this.bitmap = bitmap;
    this.xoffset = xoffset;
    this.yoffset = yoffset;
    zoffset = 0;
  }
  
  void display(){
    pushMatrix();
    translate(xoffset,yoffset,zoffset);
    tint(r,g,b);
    image(bitmap,0,0);
    popMatrix();
  }
  
  void update(float zoffsetTarget,color cellColor){
    
    this.zoffsetTarget = zoffsetTarget;
    zoffset = lerp(zoffset,zoffsetTarget,0.1);
    
    r = lerp(r,red(cellColor),0.1);
    g = lerp(g,green(cellColor),0.1);
    b = lerp(b,blue(cellColor),0.1);
  }
}

