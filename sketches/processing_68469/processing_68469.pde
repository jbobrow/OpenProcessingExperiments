
void setup()
{
size(500,500);
smooth();
noFill();
strokeWeight(5);
}
void draw()
{
  background(255);
stroke(0,0,255);
ellipse(100,200,100,100);
stroke(0,0,0);
ellipse(205,200,100,100);
stroke(255,0,0);
ellipse(mouseX,mouseY,100,100);
stroke(255,255,0);
ellipse(153,270,100,100);
stroke(0,255,0);
ellipse(258,270,100,100);
}


