
class Ear{
 float x, y, xs, ys;
 float d;
 color c; 
 //float f;

 Ear(float xPos, float yPos, float xSize, float ySize, float earDist, color earColor){
 
   x = xPos;
   y = yPos;
   xs = xSize;
   ys = ySize;
   d = earDist;
   c = earColor;  
  // f = freq;
 
}

void display(){

  
  //ear
  fill(c);
  ellipse(x-d/2,y,xs,ys);
  
  fill(c);
  ellipse(x+d/2,y,xs,ys);
  
  }
 }



