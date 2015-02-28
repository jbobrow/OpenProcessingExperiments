
//Samantha G CP1 mods 14-15 User Input Pizza
void setup()
{
  size(700, 700);
  background(160,203,168);
  //pizza dough
  fill(232, 216, 138);
  ellipse(350, 350, 700, 700);
  fill(230, 232, 138);
  ellipse(350, 350, 600, 600);
}
void draw()
{
}
void mousePressed()
{
  //pepperoni
  if (mouseButton == LEFT)
  {
    fill(227, 118, 50);
    ellipse(mouseX, mouseY, 50, 50);
  }
  //garlic
  if (mouseButton==RIGHT)
  {
    fill(240, 236, 208);
    rect(mouseX, mouseY, 10, 10);
  }
}
void keyPressed()
{
  //olives
  if (key == 'w')
  {
    fill(0);
    ellipse(mouseX, mouseY, 70, 45);
  }
  if (key == 'e')
  {
    erase();
  }
}
void erase()
{
  background(214, 147, 224);
  fill(232, 216, 138);
  ellipse(350, 350, 700, 700);
  fill(230, 232, 138);
  ellipse(350, 350, 600, 600);
}
