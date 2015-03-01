
//This definition creates a random spawn of small circles that start from the 0,0 corner,
//and expand slowly out, changing colour from black to a divided set of colours, with
//opposite colours on stroke and fill.

float a=0;
float b=0;
//Define two integer variables and set at 0

void setup(){
  size(200,200);
  //set up the canvas size to 200x200px
}

void draw(){
  float r=random(0,a);
  float r2=random(0,b);
  //Define two random variables that range between 0 and the variable a or b
  
  stroke(r,r,r2);
  fill(r2,r2,r);
  //Define the stroke to one RGB colour, decided using the random value
  //Define the fill of the circles to another RGB colour, using random values that will form
  //an inverse of the stroke colour
  
  ellipse(r,r2,10,10);
  //Draw the ellipses, using random values for the location, and 10 as the set size
  
  a+=0.1;
  b+=0.1;
  //Increase the vairables by 0.1 each time the draw command loops



}


