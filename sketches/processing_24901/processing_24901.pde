
/////////////////////////////////////
//////DSDN142 Project 1 Sketch 3/////
///////Nichola Prokop 300232923//////
/////////////////////////////////////
 
import processing.pdf.*; 

int patternSeperationX = 100;
int patternSeperationY = 100;

 
void setup(){
  size(400,800);
  background (47,108,111);
beginRecord(PDF, "pro1des3.pdf");
   
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
  
//Back//  
  fill(220,181,52);
quad(10,10,90,10,90,40,10,40);
quad(60,40,90,40,90,60,60,60);
quad(10,50,50,50,50,90,10,90);
quad(50,70,90,70,90,90,50,90);

//Floor//
  fill(109,70,5);
quad(10,40,60,40,80,20,10,20);
quad(60,60,80,40,90,40,90,60);
quad(10,90,30,70,90,70,90,90);

//Wall//
  fill(249,226,50);
quad(10,10,30,10,30,20,10,40);
quad(60,40,80,20,80,40,60,60);
quad(10,50,30,50,30,70,10,90);
  

   
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



