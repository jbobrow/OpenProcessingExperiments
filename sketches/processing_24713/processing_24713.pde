
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 //modified by Jessica Campbell//
//import processing.pdf.*;
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
  size(400,800);
 // beginRecord(PDF,"final1.pdf");
  
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
    background(247,255,221);
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
  //endRecord();
   
}
 
 
void draw()
{
  
}
 
 
void yourFunction(){
  smooth();
  noStroke();
    fill(203,234,131);
  quad(0,50,35,35,50,0,50,50);
fill(174, 188, 141);
  quad(50,0,65,35,100,50,50,50);
fill(205,234,180);
  quad(100,50,65,65,50,100,50,50);
  fill(171,196,112);
  quad(50,100,35,65,0,50,50,50);
  
fill(205,234,180);
   quad(0,50,0,0,50,0,15,15);
   fill(171, 196, 112);
   quad(50,0,100,0,100,50,85,15);
   fill(203, 234, 131);
   quad(100,50,85,85,50,100,100,100);
   fill(174, 188, 141);
   quad(50,100,15,85,0,50,0,100);
   
  

   

}
 
void keyPressed()

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

