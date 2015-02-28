
/////////////////////////////////////
//////DSDN142 Project 1 Sketch 2/////
///////Nichola Prokop 300232923//////
/////////////////////////////////////
 
import processing.pdf.*; 

int patternSeperationX = 100;
int patternSeperationY = 100;

 
void setup(){
  size(400,800);
  background (27,134,154);
beginRecord(PDF, "pro1des2.pdf");
   
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
  fill(54,115,82);
triangle(10,10,40,10,10,40);
triangle(60,40,60,70,30,70);

fill(70,160,72);
quad(90,10,90,90,60,70,60,40);

fill(37,98,101);
quad(40,10,70,10,10,70,10,40);
quad(10,90,30,70,60,70,90,90);
  

   
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



