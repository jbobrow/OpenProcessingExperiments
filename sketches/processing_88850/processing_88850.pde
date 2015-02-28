
float x = random(10, 300);
float y = 25;
void setup()
{
  size(300, 300);
  smooth();
  

}
void draw()
{
  println("x is" + x);
  for(float x = width/2; x < width - 10; x++)
  {
  if(width/2 + height/2 > width/2 - 10 + height/2 - 10)
  {
  rectMode(CENTER);
  rect(x, height/3, x, 20);
   line(x, x, x, y);
  line(x, x, x, x);
  ellipseMode(CENTER);
  ellipse(x, y, x/2, x*0.3);
  beginShape();
  vertex(100, 150);
  vertex(200, 220);
  vertex(200, 10);
  endShape();
  
  }
  
  }
  
}
