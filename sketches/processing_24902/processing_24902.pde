
/////////////////////////////////////
//////DSDN142 Project 1 Sketch 4/////
///////Nichola Prokop 300232923//////
/////////////////////////////////////
 
import processing.pdf.*; 

int patternSeperationX = 100;
int patternSeperationY = 100;

 
void setup(){
  size(400,800);
  background (167,55,53);
beginRecord(PDF, "pro1des4.pdf");
   
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
  fill(252,183,0);
  triangle(10,10,90,10,50,40);
  triangle(10,20,40,50,10,80);
  triangle(10,90,50,60,90,90);
  triangle(90,20,90,80,60,50);
  
  fill(253,126,29);
  quad(10,90,90,90,63,70,37,70);
  quad(63,10,90,10,50,40,38,32);
  quad(10,60,30,40,40,50,10,80);
  
  fill(254,200,74);
  quad(90,20,90,80,70,60,70,40);
  

   
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



