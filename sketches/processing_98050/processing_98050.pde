
void setup()
{
  size(500,400);
  background(255);
  stroke(0);
}
void draw()
{
  size(1000,400);
  background(255,200,255);
  stroke(0);
  strokeWeight(5);
  stroke(0);
  
  
  strokeWeight(0);
  stroke(255,0,0);
 
  
  noStroke();
  fill(200, 0, 0, 70);
  rect(mouseX,mouseY,50,50);
  stroke(2);
  fill(0,100,200,80);
  triangle(mouseY,10,mouseX,150,-mouseX,300);
  fill(100,0,200,80);
  ellipse(mouseY+50,30,mouseX-20,100);
  fill(0, 100, 0, 70);
  rect(mouseX+10,20,mouseY,50);
}


