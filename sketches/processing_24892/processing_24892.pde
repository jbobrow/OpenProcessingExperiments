
/////////////////////////////////////
//////DSDN142 Project 1 Sketch 1/////
///////Nichola Prokop 300232923//////
/////////////////////////////////////
 
import processing.pdf.*;
 
int patternSeperationX = 100;
int patternSeperationY = 100;
import processing.pdf.*; 
 
void setup(){
  size(400,800);
  background (254,61,43);
beginRecord(PDF, "pro1des1.pdf");
   
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
  
}
 
 
void yourFunction(){

  
  noStroke();
  
  fill(167,55,53);
  quad (10, 90, 10, 10, 90, 10, 90, 90);
  
  fill(253,126,29);
  quad (10, 90, 10, 10, 30, 10, 30, 70);
  
  fill(35,87,100);
  quad (10, 90, 30, 70, 90, 70, 90, 90);
  

   
}
 
void keyPressed()

{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}
{
if(key == 's' || key == 'S')
{
endRecord();
}
}



