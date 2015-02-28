
import processing.pdf.*;

void setup() {

  size(1024, 768, PDF, "wallpaper.pdf");

   //size(1024, 768);

  smooth();
}


void draw()
{
  // Draw something good here
  noLoop();
  noStroke();
  background(#111128);
  for (int r = 0; r <= width; r++)
  {
    for (int c = 0; c <= height; c++)
    {
      
     
      float randNum = round(random(1,100));
         if (c%5==0 && r%5==0)
         {

            fill(100+randNum,200+randNum,155);
            rect(c*15, r*15, 20, 20);
         }
         if (c%5==0 && r%5==0)
         {

            fill(240+randNum,40+randNum,80);
            rect(c*20, r*10, 20, 20);
         }

    }
   }


}


  // Exit the program


  /*
  exit() here makes the sketch similar to static mode
   the draw function is called only once so don't do anything
   interactive or dynamically animated, your output should be produced
   instantaneously
   */

//exit();
