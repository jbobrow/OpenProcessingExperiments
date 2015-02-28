



int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,790);
  
 
 rect(100, 280, 295, 295); 
triangle(220, 295, 248, 250, 276, 295);
rect(150, 325, 195, 195);
rect(200, 375, 95, 95);
rect(231, 295, 35, 85);

  
 
  
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



