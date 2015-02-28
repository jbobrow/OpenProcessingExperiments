
void setup() 
{
  size(1024, 1024);
  //use this function in combination with exit() below to produce a pdf file 
  //size(1024, 768, PDF, "wallpaper.pdf");

  /*
  Alternatively use this function to test your output on screen so you can actually see what you are doing.
   DON' FORGET TO COMMENT THE exit(); down below if you are printing on screen.
   size(1024, 768);
   */
  smooth();
  background(255);
  frameRate(10);
  rectMode(CENTER);
 
}



void draw() 
{

  
  
  for (int i=1; i<1024; i++)
  {
    if (i >=256 && i<=768)
    {
      translate(1024,1024);
      rotate(PI);
      line(i, 256, i*4, 768);
    }
 
  }  

}






