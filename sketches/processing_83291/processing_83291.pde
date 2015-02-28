
void setup()
{
size(700,400);
background(0,0,0);
smooth();
}
void draw()
{
  noStroke();
  fill(random(0,255), random(255), random(255));
  
  ellipse(random(width),random(height),50,50);
  fill(0,0,0);
  textSize(75);
  textAlign(CENTER);
  text("GOATS!", 350,200);
}
