
// Generative pattern
 
 
 
// Declare and initialize two float variables
float circleX = -50;
float circleY = -50;
float R = random(400);
 
void setup() {
  size(900,400);
  smooth();
  background(0);
  //frameRate(2000);

}
 
void draw() {
   strokeWeight(0.5);
  stroke(255);
  noFill(); 
   
 
  line(circleX, circleY, circleX+circleY, circleX+circleY);
  
  // This will make the to the right on the next pass --
  // each move will increase from 0 to 30 pixels to the right
  circleX = circleX + (frameCount % 30);
  //Keep it in range
  circleX = circleX % width;
   
  // Move circle down + keep it in range
  circleY = circleY + (frameCount % 30);
  circleY = circleY % height;
  noStroke();
  fill(0, random(0, 10));
  rect(random(900),random(400),R,R);

  
}


