
  int h=0;
  
  void setup(){
   size(400,400);
  background(255);
  
  
  }
  
  void draw(){
  
  
   for(int x=0; x<height; x+=20) {
   fill(0,random(210),0);
      rect(x,h,20,20);
       }   
  
       h=h+20;   
  }
  
    
