
void setup() 
{
  frameRate(2000);
  size(500,500);
  strokeWeight(random(10));
}
void draw() 
{
  stroke(random(400), random(400), random(400));
  fill(random(255+50), random(255+50), random(255+50));
  rect(random(400), random(400), random(400), random(400));
  ellipse(random(400), random(400), random(400), random(400));
  fill(0,0,0);
  rect(100,100, random(400), random(400));
}

