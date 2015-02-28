
import processing.pdf.*;

void setup (){
  size(1000, 500);
  background(255);
  
  int pLineShapeNumber = 50;
  int pShapeNumber = 20;
  int pShapeX = -15;
  int pShapeY = 0;
  int pShapeWidth = 10;
  int pShapeHeight = 10;
  int pShapeDistanceX = 10;
  int pShapeDistanceY = 10;
  int pShapeGrowth = 10; 
  int pLineDiff = 20;
  float pTrans = 100;
  int Weight = 0;
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
  
  
 
  translate(20, 20);
  smooth();
  for(int i = 0; i < lineShapeNumber; i++){
    Weight = Weight + weightGain;
    strokeWeight(Weight);
    
 
  fill(0, 0, 0, pTrans); 
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
       
   shapeX = shapeX + shapeDistanceX;
        shapeWidth = shapeWidth + shapeGrowth;
        shapeHeight = shapeHeight + shapeGrowth;
        shapeDistanceX = shapeDistanceX + 10;
        pTrans = pTrans + .4;
        ellipse(shapeX, shapeY, shapeWidth, shapeHeight);
       
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

