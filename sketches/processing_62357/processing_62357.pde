
void setup()
{ 
  size(400, 600);
  //   background(random (255), random (255), random(255));
  smooth();
  frameRate(60);
} 


void draw() 
{
  noStroke();
  fill(25, 160, 185, 80); 
  rect( 0, 0, width, height/2 );

  fill(200, 25, 25, 30);
  rect(0, height/2, width, height/2);

  stroke(10, 25, 160);
  strokeWeight(6);
  fill(25, 160, 185, 30);
  ellipse( mouseX, mouseY, 30, 30 );

  strokeWeight(6);
  stroke(3, 250, 58);
  point ( random(width), random(height));

  stroke (60, 255, 245);
  strokeWeight(10);
  fill (25, 140, 154, 30);
  ellipse(mouseX, mouseY, 30, 30);
}


