
import processing.pdf.*;


void setup (){
  size(1000, 500);
  background(30);
  
  int pLineShapeNumber = 25;
  int pShapeNumber = 25;
  int pShapeX = 0;
  int pShapeY = -20;
  int pShapeWidth = 10;
  int pShapeHeight = 10;
  int pShapeDistanceX = 20;
  int pShapeDistanceY = 20;
  int pShapeGrowth = 2; 
  int pLineDiff = 40;
  float pTrans = 150;
  int Weight = 1;
  int weightGain = 0;
  int initialShapeTransparency = 255;
  
  int lineShapeNumber = pLineShapeNumber;
  int shapeNumber = pShapeNumber;
  int shapeX = pShapeX;
  int shapeY = pShapeY;
  int shapeWidth = pShapeWidth;
  int shapeHeight = pShapeHeight;
  int shapeDistanceX = pShapeDistanceX;
  int shapeDistanceY =  pShapeDistanceY;
  int shapeGrowth = pShapeGrowth; 
  int lineDiff = pLineDiff;
  int ShapeTransparency = initialShapeTransparency; 
  
  
  
  
  translate(20, 20);
  smooth();
  for(int i = 0; i < lineShapeNumber; i++){
    Weight = Weight + weightGain;
    strokeWeight(Weight);
  
  
  lineShapeNumber = pLineShapeNumber; 
   shapeNumber = pShapeNumber;
   shapeX = pShapeX;
   shapeY = shapeY + shapeDistanceY;
   shapeWidth =  pShapeWidth;
   shapeHeight = pShapeHeight;
   shapeDistanceX = pShapeDistanceX;
   shapeDistanceY = pShapeDistanceY;
   shapeGrowth = pShapeGrowth;
   shapeDistanceY = shapeDistanceY + lineDiff;
    ShapeTransparency = initialShapeTransparency;
   

for( int j = 0; j < shapeNumber; j++){ 
       
 fill(51, 95, 255, ShapeTransparency);
 ellipse(shapeX, shapeY, shapeWidth, shapeHeight);
        shapeX = shapeX + shapeDistanceX;
        shapeWidth = shapeWidth + shapeGrowth;
        shapeHeight = shapeHeight + shapeGrowth;
        shapeDistanceX = shapeWidth + 10;
        shapeDistanceY = lineDiff;
        pTrans = pTrans + 0;
        ShapeTransparency = ShapeTransparency - 11;
    }
  }
}

void draw(){
    


}

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}
        
