
void setup()
{
  size(600,600);
  background(0,0,0);

}
void draw()
{
  stroke(255);
  strokeWeight(5);
  point(random(width),random(height));
  fill(0,5);
  rect(0,0,width,height);
  fill(4,169,52);
  triangle(300,100,100,600,500,600);
}

