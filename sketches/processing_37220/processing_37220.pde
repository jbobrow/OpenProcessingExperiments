
class Effect{
  
  float x,y;
  float addx = 1;
  float addy = 1;
  int R,G,B;
  
  Effect(float _x,float _y,int _R,int _G,int _B){
    
    x = _x;
    y = _y;
    R = _R;
    G = _G;
    B = _B;
    
  }
  
  void disp(){
    noStroke();
    fill(R,G,B,255-addx/2);
    ellipse(x,y,addx,addy);
    
  }
  
  void update(){
    
    addx = addx + 5 + addx/50;
    addy = addy + 5 + addy/50;
    
  }
  
  boolean finish(){
    
    if(x+addx >width && y+addy > height){
      
      return true;
      
    }else{
      
      return false;
    }
    
  }
}



  
  

