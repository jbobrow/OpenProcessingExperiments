
size (800,600); // set up window size
background (0);  // define background color
smooth(); // define the render to be smooth (anti-alias)
noStroke();

// variables for the point
float pointSize = 100; // point size

// varibles for the point "loop"
int numberPoins = 50; // number of points

// varible for the sistem of shape
int numShapes = 5;
int stepSizeH = (int) (height/ numShapes);
int stepSizeW = (int) (width/ numShapes);

// the first loop is the sistem that generates where the shapes will de draw
for ( int h = 0; h < height; h = h + stepSizeH)
{
    // the first loop is the sistem that generates where the shapes will de draw
  for ( int w = 0; w < width; w = w + stepSizeW)
  {
       stroke(random(255),random(255),random(0), random(50,255) );
        // this s the structure for the "shape" - a rectangle made of multiple points
        for ( int i = 0; i < numberPoins; i = i +1)
        {
          strokeWeight( random(pointSize));
          point (random(w,w+stepSizeW), random(h,h+stepSizeH));
        }
    }
    
}

                
