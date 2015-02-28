
/**
This example draws a color wheel that is controlled by the mouse.

This uses the basic approach we used to drawing regular polygons
to create a circle made up of triangles. We then use HSB color
and map the hue to the angle of the triangle for the fill. 

The x dimension of the mouse controls the number of slices in the wheel.

C. Andrews
2014-01-08
**/


int radius = 250; // radius of the circle

void setup(){
 size(600,600); 
  background(255);
  // set the hue range to 2 PI
  colorMode(HSB, TWO_PI, 100,100);
}


void draw(){
   background(0, 0,100);
  
  // center the shape in the canvas
  translate(width/2, height/2);
  
  // map the number of slices to mouseX
  // we are translating the full range of values (0-width) to a smaller
  // 3-200
  int numDivisions = (int)map(mouseX, 0, width, 3,200);
  float angle = TWO_PI / numDivisions;
 

  for (int i = 0; i < numDivisions; i++){
    // our triangle is made up of two neighboring points on the circumfrence
    // and the center point at the origin
    
    float x1 = cos(angle * i) * radius;
    float y1 = sin(angle * i) * radius;
    float x2 = cos(angle * (i+1)) * radius;
    float y2 = sin(angle * (i+1)) * radius;
    fill(angle*i, 100,100);
    stroke(angle*i, 100,100);
    triangle(0,0,x1,y1,x2,y2);
  }
  
}


