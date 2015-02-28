
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 35   ;
int patternSeperationY = 35   ;
 
 
void setup(){
  size(500,500);
  background(0);
  //the white box simply shows you the space your pattern gets drawn in

   
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

}
 
 
void yourFunction(){
   
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  smooth();
  fill(255);
  quad(10,40,40,40,50,50,20,50);
  quad(13,37,40,40,50,50,20,45);
  quad(17,33,40,40,50,50,20,43);
  quad(20,27,40,40,50,50,20,39);
  quad(25,20,40,40,50,50,20,33);

 

   
  
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

