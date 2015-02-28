
// Lines by Rupert Russell
size(1000, 300);
smooth();
background(#333333);  // Grey background

float x = 20;
float y = 20;
float colourOfPoint = 0;
boolean getBrighter = true;
float step = random(1, 6);
// float step = 1.672;   // try un commenting this line

println("step " + step);

strokeWeight(20);

for (int z = 0; z < 14 ; z = z + 1)
{
    for (float i = 20; i < 980 ; i = i + 0.7)
    {
      stroke(colourOfPoint);
  
      if(getBrighter){
          colourOfPoint = colourOfPoint + step;
          if(colourOfPoint > 255){ 
              getBrighter = false;
          }
      }
  
      if(!getBrighter){
          colourOfPoint = colourOfPoint - step;
          if(colourOfPoint < 0){ 
              getBrighter = true;
          }
      }  
 
      point(i, y);  // Draw the point

    }
   
    y = y + 20;  // Move down the screen and draw the next line
    
}
