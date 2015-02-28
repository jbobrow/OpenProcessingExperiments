
import processing.pdf.*;

void setup()
{
  size(800,800, PDF, "Sketch1.pdf");
}

void draw()
{
  for (int x=0;x<500;x++)
  {
    //line(0,0,random((width/2),(height/2)), random((width/2),(height/2)));
    line(width, 0, random(0,400),random(400,800));
    line(0, 0, random(400,800),random(400,800));
    
  }
  
  // Exit the program 
  println("Finished.");
  exit();
  
  
}


