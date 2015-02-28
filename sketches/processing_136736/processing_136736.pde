
void setup()
 
{
  size(600, 600);
  smooth();
  frameRate(10);
  background(random(225,245), 255, 255, random(10));

}
 
void draw()
{
  noStroke();
  fill(random(255), random(255), random(255), random(180,205));
  ellipse(random(400*1.4), random(600*1.4), 12, 12);
}



