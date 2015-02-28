
import processing.pdf.*;

void setup()
{
  size(800,800, PDF, "Sketch1.pdf");
  background(0);
}

void draw()
{
  for (int y=0;y<800;y=y+50)
  {
    for (int x=0;x<100;x++)
    {
      noFill();
      stroke(random(255),255,255);
      rect(0,y,100*x,5*x);
    }
  
  }
  // Exit the program 
  println("Finished.");
  exit();
  
}


