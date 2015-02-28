
float y = 0.0;
void setup()
{
//creates size of screen.image
  size(250,250);
//creates smooth lines
  smooth();
//white background colour
  background(#FFFFFF);
  
}
void draw() {
//colour of the shape
  fill(#FF5544);
//thickness of the lines of the pattern
  strokeWeight(0.6);
//sets the position of the shape
  translate(250,250);
//colour of the stroke
  stroke (78,50,234);
//position of shape
   ellipse (0-y, 0-y, 100, 100);
 
   
   y += 0.9;
   if (y>250){
     y = -30.0;
   }
}

                
                
