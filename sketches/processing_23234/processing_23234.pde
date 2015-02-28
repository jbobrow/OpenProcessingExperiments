
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
  
  
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
  
  
void setup(){
  size(500,500);
    
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  //rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  smooth();
    
  for(int i = 0; i < width/patternSeperationX+1; i++){
      for(int j = 0; j < height/patternSeperationY+1; j++){
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
}
  
  
void yourFunction(){
    
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
    
   int number = 11;
   fill(0, 0.5);
   stroke(0);
   for(int x = 0; x < number; x++){
     if(x<11){
        curve(0, 0, 0, x*10, 100, 50, 100, 400);
            
       if(x>5){
        curve(200, 600, 100, x*10, 100, (x+4)*10, 400, 100);
                 }
     }
   }
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

