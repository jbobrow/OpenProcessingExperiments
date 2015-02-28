
int h=0;
  
  void setup(){
   size(600,600);
  background(10);
  
  
  }
  
  void draw(){
  
  
   for(int x=0; x<height; x+=10) {
   fill(255);
      rect(random(height),random(height),2,2);
       }   
  
       h=h+10;   
  }
