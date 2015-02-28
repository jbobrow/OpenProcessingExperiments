


// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
  
  
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
  
  
void setup(){
  size(250,500);
    
  
  background(21,171,195);
    
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
 
  //This is here so the program keeps running and the screengrab will work
}
  
  
void yourFunction(){
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
    
  stroke(36,198,224);
  fill(50,30);
  int ellipseheight=50;
   
  for(int positionx=0; positionx<height; positionx=positionx+3){
      ellipseMode(CORNER);
      ellipse(positionx,0,ellipseheight,100);
      
    }
    scale(.5);
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
 

