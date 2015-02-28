
class Boy{
  
  //properties
  float xpos;
  float ypos;
  int width = 50;
  int height = 50;
  float speed;
  
  //setup
  Boy(float x, float y,float s){
      xpos = x;
      ypos = y;
      speed = 5;
    
  }//end of setup
  
  void draw(){
    image(images3[frame],xpos,ypos);
    xpos+=speed;
   
    if(xpos>500){
      reset();
    }
     
  }//end of draw
  
  void reset(){
    
    ypos = random(320,450);
    xpos = random(-10,500); 
  }

}//end of class

