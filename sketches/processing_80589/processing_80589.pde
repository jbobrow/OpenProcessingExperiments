
void setup()
{
  size(400,400);
  background(#F791DA);
  smooth();
}
void draw()
{
  background(#F791DA);
  fill(mouseY,mouseX,mouseY);
  ellipse(mouseX,mouseY,mouseX,mouseY);


}

