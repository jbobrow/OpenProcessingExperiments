
/**
 * Translate. 
 * 
 * The translate() function allows objects to be moved
 * to any location within the window. The first parameter
 * sets the x-axis offset and the second parameter sets the
 * y-axis offset. 
 */
 
float x, y;
float size = 40.0;

void setup() 
{
  size(300,300);
  noStroke();
  frameRate(10);
  smooth();
}

void draw() 
{
  background(102);
  
  x = x + 5;
  
  if (x > width + size) {
    x = -size;
  } 
  
   
 
for ( int i = 0; i < 200; i = i+40 ) {
 fill(#FFEA24);
 ellipse(150+i, 145, 15,15);

}
  
  pushMatrix();
  translate(x, 250);
  rotate (radians(90));
  fill(102);
  rect(-115, -90, 20,width);
  fill(#FFEA24);
  ellipse(-100, -100, 100,100);
  fill(102);
  ellipse(-125, -90, 15,15);
 
  
  fill(102);
  triangle (-100, -100, -50,-150, -150, -150);
 
popMatrix();

}

