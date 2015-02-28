
/*
A spiral is basically
a circle where the radius
is increasing all the time
as we draw it
*/

float inc; //we use this to increment our angle
float xPos;
float yPos;
float rad; // the radius of our circle (it will be increasing)

void setup(){
  size(600,600);
  smooth();
  background (0);
 
  inc = 50; //we start at angle 0, try other values
  rad = 50;
}

void draw(){
  translate(mouseX, mouseY); 
   stroke(random(255), random(255), random(255), 100);
   strokeWeight(random(1,20));
   
  

  //every frame we determine the xPos and yPos by using sin and cos functions.
  //as default, sin and cos takes radians values.
  // sin and cos ALWAYS return numbers between -1 and 1.
  // we can multiply that -1 to 1 result by a radius
  xPos = cos(radians(inc)) * rad; // so now we get results between -radius and radius
  yPos = sin(radians(inc)) * rad;
  
  println(xPos);
  
  line (0,0,xPos, yPos);
  ellipse(xPos, yPos, 0, 0);
  
  //we increase both the radius and the angle
  //note how the angles used to draw remain the same all the time even though the radius is changing
  //play around with this values to alter the shape of the spiral
  inc += 107;
  rad += 19;
  
  

}

