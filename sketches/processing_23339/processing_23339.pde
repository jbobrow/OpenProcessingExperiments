
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 10;
int patternSeperationY = 10;


void setup(){
  size(500,500);
  background(0);
  
  int x = 0;
  int y = 0;
    
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction(x, y);
        popMatrix();
        y++;
      }
      x++;
  }
  
}


void draw()
{
  //This is here so the program keeps running and the screengrab will work
}


void yourFunction(int x, int y){
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  
    //variables for each triangle randomly 
    float x1 = random(0, 100);
    float x2 = random(0, 100);
    float x3 = random(0, 100);
    float y1 = random(0, 100);
    float y2 = random(0, 100);
    float y3 = random(0, 100);
    
    noStroke();
    
    int alpha = (x + y)/500;
    
    fill(255, alpha);
    triangle(x1, y1, x2, y2, x3, y3);
  
     
    
    
        


        
    
    
    
  
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
