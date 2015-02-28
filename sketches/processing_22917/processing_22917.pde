
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY = 50;


void setup(){
  size(500,500);
  background(245, 0, 0,60);
  
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
  //This is here so the program keeps running and the screengrab will work
  fill(mouseX,mouseY,0);
}


void yourFunction(){
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  
  noStroke();
  fill(255, 38, 0);
  bezier(50, 0, -20, -20, 70, 70, 0, 50);
  bezier(0, 50, -20, -20, 70, 70, 50, 0);
  fill(255, 64, 0);
  bezier(50, 0, -10, -10, 60, 60, 0, 50);
  bezier(0, 50, -10, -10, 60, 60, 50, 0);
  fill(255, 94, 0);
  bezier(50, 0, 0, 0, 50, 50, 0, 50);
  bezier(0, 50, 0, 0, 50, 50, 50, 0);
  fill(255, 126, 0);
  bezier(50, 0, 10, 10, 40, 40, 0, 50);
  bezier(0, 50, 10, 10, 40, 40, 50, 0);
  fill(255, 160, 0);
  bezier(50, 0, 20, 20, 30, 30, 0, 50);
  bezier(0, 50, 20, 20, 30, 30, 50, 0);
  
 
  
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

