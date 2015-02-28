
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 40;
int patternSeperationY = 30;
 
 
void setup(){
  size(500,500);
  smooth();
   
  //the white box simply shows you the space your pattern gets drawn in
  fill(0,70,70,120);
  noStroke();
  rect(0,0,500,500);
  stroke(50);
   
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
   
  rect(0,0,50,50);
  //line(0,50,50,0);
   
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


