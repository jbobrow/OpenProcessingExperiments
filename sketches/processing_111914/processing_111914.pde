
void setup(){
  
  size (600,600);
 
 drawLines();
  
}




void drawLines(){
 
 int positionX = 20;
 int positionY = 0;
 int lineHeight = height;
 int lineWidth = width;
 int lineSpacing = 20;
 
 for (int i=0; i<width; i++){
   line (positionX, positionY, positionX, positionY + lineHeight);
   positionX = positionX + 20;
 }
 
 positionX = 0;
 positionY = 20;
 
 for (int i=0; i<height; i++){
   line (positionX, positionY, positionX + lineWidth, positionY);
   positionY = positionY + 20;
 }
 
  
}


