

void setup()
// setup - runs one time
  {
  
  size (500,500);

  
  smooth();
// smooth all drawing

  
  ellipseMode(CENTER);
  // draw all ellipses from their center point
  }


void draw()
  // draw - runs once a frame
  {
  
   
  fill(0,0,0,10);
// fill all shapes with a solid black color with a very low opacity
  
  rect(0,0,width,height);
//a rectangle will be shown that is the size of the whole screen
  

  fill(random(0,255), random(0,255), random(0,255));
//fill the shapes w/ a random color from 

  ellipse(random(0,width), random(0,height), 10, 10);
//draws a small ellipse size 10X10 at random areas   
}


