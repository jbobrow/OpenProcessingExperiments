
String[] answers = {
  "yes", "no", "maybe"
};
boolean mode = false;

void setup()
{
  background(0);
  size(500, 500);
  noLoop();
}
void draw()
{
  if (mode == false)
  {
    fill(100);
    ellipse(250, 250, 300, 300);
    fill(255);
    rect(130, 375, 250, 150); 
    ellipse(250, 250, 150, 150);
    fill(0);
    textSize(15);
    text("think of a question", 190, 450);
  } 
  else if (mode == true)
  {
    noStroke();
    fill(250, 75, 150);
    textSize(18);
    text(answers[int(random(3))], 250, 250);
    triangle(150, 150, 350, 150, 250, 230);
    fill(255);
  }
}
void mousePressed()
{
  {
    mode = !mode;
  }
  redraw();
}
