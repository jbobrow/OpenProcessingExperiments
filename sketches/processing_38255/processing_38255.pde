
class Ripple{
  float x;
  float y;
  public float r;
  public int c = 255;
  
  Ripple(float new_x, float new_y, float new_r){
    x = new_x;
    y = new_y;
    r = new_r;
  }
  
  void update(){
    r++;
  }
  
  boolean finished(){
    c--;
    if(c < 0 ){
      return true;
    }else{
     return false;
    }
  }
  
  void rippleDraw(){
    noFill();
    stroke(0,0,255,c);
    strokeWeight(2);
    ellipse(x,y,r,r);
    
    if(x - 0 < r){
      ellipse(-x,y,r-5,r-5);
    }
    
    if(width - x < r){
      ellipse(width*2-x,y,r-5,r-5);
    }
    
    if(y - 0 < r){
      ellipse(x,-y,r-5,r-5);
    }
    
    if(height - y < r){
      ellipse(x,height*2,r-5,r-5);
    }
  }
}
  

