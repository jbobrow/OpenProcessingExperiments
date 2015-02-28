

///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
  
  
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY = 50;
  
  
void setup(){
  size(500,1000);
  
  background(0);
    
  //the white box simply shows you the space your pattern gets drawn in
 
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
  
  
}

  //This is here so the program keeps running and the screengrab will work

  
  
void yourFunction(){
    
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
    
stroke(150);
strokeWeight(7);

line(0,0,500,0);
line(0,0,0,1000);
fill(255);
noStroke();
ellipse(0,0,10,10);





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
}

                
                                
