


public class RectClass{
  
  private float rectWidth = 20;
  private float gPosX,gPosY;

  RectClass(float posX){

    gPosX = posX;
    gPosY = height/2;
 
  }
  
  void rectDraw(){
    fill(255,0,0);
    rect(gPosX,gPosY,rectWidth,rectWidth);
  }
  
  
  void updata(){
    
    float distance = dist(gPosX,gPosY,mouseX,mouseY);
    
    if(distance<20 && dragFlag==true){
      gPosX = mouseX;
      gPosY = mouseY;
    }
  
  }



}


