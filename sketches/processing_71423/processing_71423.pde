
void setup()
{
  size(300,300);
  background(0,0,0);
}
void draw()
{

}
void mouseMoved()
{
  ellipse(mouseX,mouseY,10,10);
  strokeWeight(3);
  stroke(147,112,219);
  fill(219,112,147);
  ellipse(300-mouseX,mouseY,10,10);
  stroke(0,250,154);
  fill(0,255,255);
  ellipse(mouseX,300-mouseY,10,10);
  stroke(255,140,0);
  fill(199,21,133);
  ellipse(300-mouseX,300-mouseY,10,10);
  stroke(255,215,0);
  fill(70,130,180);
  ellipse(100-mouseX,mouseY,20,20);
  stroke(176,48,96);
  fill(230,230,250);
  ellipse(mouseX,100-mouseY,20,20);
  stroke(210,105,30);
  fill(32,178,170);
  
}
int num = 5;
{
    num = 5;
}
{
    num = 5;
}
{
    num = num + 10;
}
