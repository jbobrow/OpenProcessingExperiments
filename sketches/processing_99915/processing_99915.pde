
float redAmount;
float greenAmount;
float blueAmount;
void setup()
{
  size(800, 700);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}
void draw()
{
  redAmount=0;
  greenAmount=random(255);
  blueAmount=random(255);
  strokeWeight(4);
  stroke(redAmount,greenAmount,blueAmount);
  line(0,0,mouseX,mouseY);
  ellipse(mouseX,mouseY,50,50);
  fill(redAmount,greenAmount,blueAmount);
}
