
void setup()
{
  size(500, 500);
  background(255);
  smooth();
  
  noFill();
  gradientCreator(0, 250, 4, 0, 200, 1, 250, 0, 2); //first red value, second red value, speed of change, repeat for green and blue
  
  strokeWeight(1);
  stroke(0);

  //numShapes, numSides, theta (rotation/starting point), radius 1, radius 2
  shapeRotator(8, 2, 0, 5, 25); //inner lines
  shapeRotator(8, 3, 0, 25, 75); //small triangles
  shapeRotator(8, 5, 0, 75, 200); //center pentagons
  stroke(255);
  shapeRotator(8, 3, 0, 75, 200); //triangles in pentagons
  shapeRotator(32, 6, 0, 200, 400); //outer hexagons
  stroke(0);
  strokeWeight(2);
  shapeRotator(32, 2, 0, 200, 400); //outer lines
  strokeWeight(2);
  shapeRotator(16, 15, 0, 15, 400);//large rings
}

