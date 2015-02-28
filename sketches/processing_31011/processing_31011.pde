
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 25;
int patternSeperationY = 25;
 
 
void setup(){
  size(500,500);
   
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
   
  fill(0);
  rect(0,0,25,25);
  
  fill(255,48,108);
  rect(5,0,20,5);
  
  fill(191,36,81);
  rect(10,5,10,5);
  
  fill(127,24,54);
  rect(0,10,15,5);
  
  fill(127,24,54);
  rect(0,15,10,5);
  
  fill(191,36,81);
  rect(5,20,15,5);
  
   
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
                
