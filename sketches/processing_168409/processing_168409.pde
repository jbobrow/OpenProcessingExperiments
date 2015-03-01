
void setup()
{
  size(500,500);
  background(0);
  ellipseMode(CENTER);
  rectMode(CENTER);
  fill(255);
  noStroke();
}

void draw()
{
   //background(0);
  
  //Ellipse in Center
  fill(millis()/75.0);
  ellipse(250,250,100,100);
  
  //Rotating Rectangle
  fill(200);
  translate(250,250);
  rotate(radians(second()*20.0));
  stroke(0);
  strokeWeight(2);
  rect(65,250,25,1500);
}
