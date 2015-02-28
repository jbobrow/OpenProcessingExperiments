
void setup()
{
  size(250, 250);
  background(250);
  smooth();
}



void draw()
{

//background(mouseX,mouseY,mouseX,mouseY);
fill(255);
ellipse(125,200,mouseX,mouseY);
ellipse(125,50,mouseX,mouseY);

println(mouseX);

}


