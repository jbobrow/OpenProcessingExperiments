
import processing.pdf.*;

void setup (){
  size(1000, 500);
  background(30);
  
  int pLineShapeNumber = 15;
  int pShapeNumber = 28;
  int pShapeX = 0;
  int pShapeY = -20;
  int pShapeWidth = 15;
  int pShapeHeight = 15;
  int pShapeDistanceX = 30;
  int pShapeDistanceY = 30;
  int pShapeGrowth = 5; 
  int pLineDiff = 20;
  float pTrans = 25;
  int Weight = 2;
  int weightGain = 0;
  
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
  
  
  
  translate(55, 95);
  smooth();
  for(int i = 0; i < lineShapeNumber; i++){
    Weight = Weight + weightGain;
    strokeWeight(Weight);
  fill(255, 0, 0, pTrans); 
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

for( int j = 0; j < shapeNumber; j++){ 
       
  ellipse(shapeX, shapeY, shapeWidth, shapeHeight);
        shapeX = shapeX + shapeDistanceX;
        shapeWidth = shapeWidth + shapeGrowth;
        shapeHeight = shapeHeight + shapeGrowth;
        
        shapeDistanceY = lineDiff;
        pTrans = pTrans + 0;
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

                
