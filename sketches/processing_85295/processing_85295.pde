
void setup()
{
  size(700, 500);
  background(250);
  smooth();
}



void draw()
{

//background(mouseX,mouseY,mouseX,mouseY);
fill(255);

ellipse(100,250,50,mouseY);
ellipse(200,250,50,mouseY);
ellipse(300,250,50,mouseY);
ellipse(400,250,50,mouseY);
ellipse(500,250,50,mouseY);
ellipse(600,250,50,mouseY);
println(mouseX);

}


