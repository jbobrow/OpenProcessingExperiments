


int patternSeperationX = 66;
int patternSeperationY = 85;
  
  
void setup(){
  size(400,600);

  smooth();
    
  fill(205,140,149);
  rect(0,0,400,600);
  stroke(255);
    
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
    
}
  
  
void draw()
{
 
}
  
  
void yourFunction(){
  
  stroke(45,45,45);  
  triangle(0, 32, 33, 3, 32, 30);
  stroke(255);
  triangle(10, 40, 43, 10, 42, 40);
  stroke(#993366);
  triangle(20, 30, 53, 20, 52, 50);
  stroke(45,45,45);
  triangle(30, 40, 73, 30, 62, 60);
     
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


