
int xPos = 300;
int yPos = 300;
float xLength = 50;
float yLength = 50;

 
void setup(){
 size(1024,478);
 
 }
 
void draw(){
   ellipse(xPos, yPos,xLength, yLength);
  
  // going Right
  if(keyCode== RIGHT){
    xPos = xPos + 5;
    if(keyPressed == true){
      fill(0);
    }else{
      fill(250,250,150);
    }
    
// going Left  
}else if(keyCode== LEFT){
    xPos = xPos - 5;
      if(keyPressed == true){
      fill(0);
    }else{
      fill(100,50,255);
    }
    
    // Going Up
  }else if(keyCode== UP){
    yPos = yPos - 5;
      if(keyPressed == true){
      fill(0);
    }else{
      fill(90,575,155);
    }
  
// Going Down
}else if(keyCode== DOWN){
    yPos = yPos + 5;
      if(keyPressed == true){
      fill(0);
    }else{
      fill(100,15,200);
    }
  }
}
