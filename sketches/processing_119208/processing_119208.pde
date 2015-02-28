
void setup()
{
size(500,500);
}
void draw()
{
  background(0);

translate(40,40);
ellipse(mouseX,mouseY,50,50);
translate(40,40);
ellipse(mouseY,mouseX,50,50);
translate(50,50);
ellipse(mouseX,mouseY,50,50);
translate(50,50);
ellipse(mouseY,mouseX,50,50);
 translate(30,30);
ellipse(mouseX,mouseY,50,50);
translate(30,30);
ellipse(mouseY,mouseX,50,50);
}
