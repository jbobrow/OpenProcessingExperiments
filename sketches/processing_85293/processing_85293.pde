
void setup()
{
  size(500, 500);
  background(250);
  smooth();
}



void draw()
{

//background(mouseX,mouseY,mouseX,mouseY);
fill(255);
ellipse(250,250,mouseX,mouseY);
println(mouseX);

}


