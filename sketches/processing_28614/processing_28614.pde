
class Bubble{

    float x;
    float y;
    float diam;  
    float innerDiam;
    float rate = 9.2;
  
    Bubble(){}
    
    Bubble(float X, float Y, float Diam, float InnerDiam){
      this.x = X;
      this.y = Y;
      this.diam = Diam;
      this.innerDiam = InnerDiam;
    } 
  

    
    void drawBubble(){
      fill(#648991);
      ellipse(x,y,diam,diam);
      fill(#FFF8C8);
      ellipse(x,y,innerDiam,innerDiam);
    }
    
    void updateBubble(){
      y = y + rate;
      drawBubble();
    }
  
}

