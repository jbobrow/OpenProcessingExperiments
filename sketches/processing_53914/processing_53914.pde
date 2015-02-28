

          
int circleSize = 0;
int circleX = 350;
int circleY = 350;
 
 
 
void setup() {
  size(250,250);
  smooth();
  background(0);
}
 
void draw() {
  background(50);
  stroke(0);
  fill(175);
  // Use the variables to specify the location of an ellipse.
 fill(255,200,200);
  ellipse(circleX,circleY,circleSize,circleSize);
   
  // An assignment operation that increments the value of circleSize by 1.
  circleSize = circleSize + 2;
 
}      
