
int stripeWidth = 20; 
int stripeSpacing = 40; 
int numberOfStripes= 40; 
int stripeRandomness = 20; 
 
void setup() 
{
  size(500, 500);
  background(255, 220, 210);
}
 
void draw()
{
  noLoop();
 
  fill(100);
  noStroke();
  background(238, 220, 247);
 
  for(int i=0; i < numberOfStripes; i++)
  { 
    fill(random(255), random(20), random(39), 150);
    rect(i*stripeSpacing, 0, stripeWidth + random(-stripeRandomness,stripeRandomness), 500); 
  }
}
 
void mousePressed()
{
  redraw();
}
