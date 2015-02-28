
import processing.pdf.*;


int shapeNumber = 23;
int rowNumber = 20;

int initialShapeX = 0;
int initialShapeY = 0;
int initialShapeSize= 5;
int initialShapeGrowth= 2;
int initialShapeDistance = 5 ;
int initialShapeTransparency = 255;
int initialMulti = 1;

int ShapeX = initialShapeX;
int ShapeY = initialShapeY;
int ShapeSize = initialShapeSize;
int ShapeGrowth = initialShapeGrowth;
int ShapeDistance = initialShapeDistance;
int ShapeTransparency = initialShapeTransparency;
int Multi = initialMulti;


int TranslateX = 10;
int TranslateY = 10;

void setup () {

  size(1000, 500);
  background(30);
  translate(200, 10);
  smooth();



  for (int i = 0; i < rowNumber; i++) {

    ShapeX = initialShapeX + ShapeSize * Multi + 10;
    Multi = Multi + 1; 
    ShapeY = ShapeY + ShapeSize;
    ShapeTransparency = initialShapeTransparency; 
    ShapeDistance = initialShapeSize + 10;
    ShapeSize = initialShapeSize;   




    for (int j = 0; j < shapeNumber; j++) {
      fill(51, 95, 255, ShapeTransparency);
      ellipse(ShapeX, ShapeY, ShapeSize, ShapeSize);
      fill(0, 150);
      triangle(ShapeX - ShapeSize/2.5, ShapeY, ShapeX + ShapeSize/5, ShapeY - ShapeSize/2.5, ShapeX + ShapeSize/5 , ShapeY + ShapeSize/2.5);
      ShapeX = ShapeX + ShapeDistance;
      ShapeSize = ShapeSize + ShapeGrowth;
      ShapeTransparency = ShapeTransparency - 5;
      ShapeDistance = ShapeSize + 10;
    }
  }
  Multi = 1;
  ShapeY = initialShapeY;

  translate(0, -30);
  rotate(PI);
  for (int k = 0; k < rowNumber; k++) {

    ShapeX = initialShapeX - ShapeSize * Multi + 10;
    Multi = Multi + 1; 
    ShapeY = ShapeY - ShapeSize;
    ShapeTransparency = initialShapeTransparency; 
    ShapeDistance = initialShapeSize + 10;
    ShapeSize = initialShapeSize;   




    for (int l = 0; l < shapeNumber; l++) {
      fill(51, 95, 255, ShapeTransparency);
      ellipse(ShapeX, ShapeY, ShapeSize, ShapeSize);
      fill(0, 150);
      triangle(ShapeX - ShapeSize/2.5, ShapeY, ShapeX + ShapeSize/5, ShapeY - ShapeSize/2.5, ShapeX + ShapeSize/5 , ShapeY + ShapeSize/2.5);
      ShapeX = ShapeX + ShapeDistance;
      ShapeSize = ShapeSize + ShapeGrowth;
      ShapeTransparency = ShapeTransparency - 5;
      ShapeDistance = ShapeSize + 10;
       
    }
  }

}

void draw() {
 
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
