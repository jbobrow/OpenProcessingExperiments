
void setup()
{
  size(500,500);
  background(150);
  
  fill(255, 235, 0);
  smooth();
  noStroke();
  ellipse(250, 250, 400, 400);

  fill(0);
  ellipse(200, 200, 75, 150);
  ellipse(300, 200, 75, 150);
  
  fill(250);
  noStroke();
  ellipse(200, 260, 30, 30);
  ellipse(300, 260, 30, 30);

  stroke(0);
  strokeWeight(10);
  noFill();
  smooth();
  bezier(125, 300, 200, 400, 300, 400, 375, 300);

}
void draw()
{
  
  
}

