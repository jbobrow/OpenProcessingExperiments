
String[] answers = {"yes", "no", "maybe"};
boolean mode = false;
void setup()
{
  background(0);
  size(800, 600);
  noLoop();
}
void draw()
{
  if (mode == false)
  {
    fill(100);
    ellipse(150, 150, 300, 300);
    fill(255);
    rect(200, 250, 200, 75);
    fill(0);
    textSize(15);
    text("think of a question",240, 300);
  }
  else if (mode == true)
  {
    noStroke();
    fill(150, 7, 230);
    triangle(150, 250, 75, 90, 225, 90);
    fill(255);
    textSize(18);
    text(answers[int(random(3))], 150, 150);
  }
}
void mousePressed()
{
  {
    mode = !mode;
  }
  redraw();
}
