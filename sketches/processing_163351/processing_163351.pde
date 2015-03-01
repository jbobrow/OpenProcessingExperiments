
int xPos = 300;
int yPos = 300;
float xLength = 50;
float yLength = 50;
PImage space;
 
void setup(){
 size(1024,478);
  space = loadImage("http://www.gospelapplied.com/wp-content/uploads/2013/09/hell-fire-1.jpg");
  background(space);
 }
 
void draw(){
  background(space);
   ellipse(xPos, yPos,xLength, yLength);
  
  // going Right
  if(keyCode== RIGHT){
    xPos = xPos + 5;
    if(keyPressed == true){
      fill(0);
    }else{
      fill(50,250,150);
    }
    
// going Left  
}else if(keyCode== LEFT){
    xPos = xPos - 5;
      if(keyPressed == true){
      fill(0);
    }else{
      fill(0,50,255);
    }
    
    // Going Up
  }else if(keyCode== UP){
    yPos = yPos - 5;
      if(keyPressed == true){
      fill(0);
    }else{
      fill(25,50,75);
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
