
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 75;
int patternSeperationY = 75;

 
 
void setup(){
  size(500,500);
  smooth();
 
   
  //the white box simply shows you the space your pattern gets drawn in
  fill(200,200,0);
  rect(0,0,500,500);
  stroke(25);
   
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
   
stroke(200,0,255);
quad(38, 31, 86, 20, 69, 63, 30, 76);
quad(48, 41, 96, 31, 79, 73, 40, 86);
quad(58, 51, 106, 41, 89, 83, 50, 96);
quad(68, 61, 116, 51, 99, 93, 60, 106);
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

