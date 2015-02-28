

void setup()
{
  size (1000,800);
  background(random(0),201,27);
  smooth();
  

}
 void draw()
{
  fill(random(250),255,0);
  ellipse (123, 343,389,mouseX);
  fill(random(255),200,50);
  triangle(random(width), 300,553,500,mouseX,mouseY);
  stroke(random(260),291,80);
  strokeWeight(1);
  quad(176,193,72,122,175,300,mouseX,mouseY);
  
  
}


