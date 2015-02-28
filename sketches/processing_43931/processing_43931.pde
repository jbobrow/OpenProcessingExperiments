
class Block {
  float x;
  float y;
  float w ;
  float h ;
  int c = 0;

  Block(float xpos, float ypos, float wi, float he ) {
    this.x=xpos;
    this.y=ypos;
    this.w=wi;
    this.h=he;
   
    
  } 
  public float getX(){
     return  x; 
  }
  public float getY(){
    return y; 
  }
  public float getW(){
    return w; 
  }
  public float getH(){
    return h; 
  }
  void display() {
    rectMode(CENTER);
    fill(0,200);
    stroke(0);
    rect(x, y, w, h);
    
  }
}

