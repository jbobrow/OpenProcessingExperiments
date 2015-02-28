
float angle = 0; 

void setup() { 
  size(600, 400); 
  strokeWeight(2);  
}

void draw() { 
  // clear the background
  background(0); 
  // set no fill so that we only draw the outlines
  // of shapes
  noFill(); 
  // set the stroke to white
  stroke(255); 
  // draw rectangles from the centre
  rectMode(CENTER); 
  // set the colour mode to HSB - colours from 
  // now on specified in hue, saturation and brightness
  colorMode(HSB);
  // move the origin to the centre of the window
  translate(width/2,height/2);
 
  int counter =0 ; 
  // loop round 60 times
  while(counter<60) { 
    
    // set the stroke colour dependent of how far 
    // through the loop we are 
    stroke(180+counter,255,255);
    // draw a rectangle 
    rect(0,0,200,200); 
    // rotate the coordinate system by the value
    // stored in the variable angle
    rotate(radians(angle)); 
    // scale the coordinate system to be 96% of what it was
    scale(0.96,0.96); 
    
    // add one to counter
    counter++; 
  }

  // increase the angle by 0.1 degrees every frame - this 
  // is what creates the animation
  angle += 0.1;  

}
