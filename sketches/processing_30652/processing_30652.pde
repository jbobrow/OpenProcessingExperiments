
size (800,600); // set up window size
background (0);  // define background color
smooth(); // define the render to be smooth (anti-alias)

// varible for the sistem of shape
 stroke(0); 
 fill(255); 
 
int grid = 50;           
int stepSizeH = (int) (height/ grid); 
int stepSizeW = (int) (width/ grid); 

// the first loop is the sistem that generates where the shapes will de draw
for ( int h = 1; h < height; h = h + stepSizeH)
{
    // the first loop is the sistem that generates where the shapes will de draw
  for ( int w = 0; w < width; w = w + stepSizeW)
  {
      
        line (w,h+6, w,h);
        triangle (w+6,h,w,h,w,h+10);
       
        
    }
    

}

