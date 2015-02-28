
//////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
  size(500,500);
  smooth();
   
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
   
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
 
 ellipse(50,50,85,85);  
 ellipse(50,50,45,45);
 ellipse(50,18,20,20);
 ellipse(50,82,20,20);
 ellipse(18,50,20,20);
 ellipse(82,50,20,20);
 ellipse(27,27,20,20);
 ellipse(27,73,20,20);
 ellipse(73,27,20,20);
 ellipse(73,73,20,20);
 line(50,28,50,72);
 line(45,28,50,72);
 line(55,28,50,72);
 line(40,30,50,72);
 line(60,30,50,72);
 
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


