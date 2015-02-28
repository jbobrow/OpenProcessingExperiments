
void setup(){
  size (500,500);
  background(255);
  
double shapeNumber = 8.5;
  int rowNumber = 5;
  float rowDistance = 25;
  
  float xShape = -20;
  float yShape = -20;
  int widthShape = 25;
  int heightShape = 15;
  int shapeTransparency = 100;
  float rotateDivision = 5;
  
  translate(width/2, height/2);
  
  fill(255,0,0, shapeTransparency);
  
  
  for(int i = 0; i < rowNumber; i++){
    xShape = xShape + rowDistance;
    yShape = yShape + rowDistance;
    shapeNumber = shapeNumber * 2;
    rotateDivision = rotateDivision * 1.75;
    for (int j = 0; j < shapeNumber; j++){
    rotate(PI/rotateDivision);
    rect(xShape, yShape, widthShape, heightShape);
    
    }
  
  }}

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

