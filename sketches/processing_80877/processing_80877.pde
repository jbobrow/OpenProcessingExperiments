
String[] answers = {
  "yes", "no", "maybe", "definitely", "obviously not"
}; 
boolean mode = false;
void setup()
{
  background(100);
  size (600, 600);
  noLoop();
}

void draw()
{
  if (mode == false)
  {
    fill(0);
    ellipse (300, 300, 300, 300);
    fill(255);
    rect(200, 250, 200, 75);
    fill(0);
    textSize(15);
    text("think of a question", 240, 300);
  }
  else if (mode==true)
  {
    noStroke();
    fill(150, 0, 255);
    triangle(150, 250, 300, 450, 450, 250);
    fill(200);
    text(answers[int(random(5))], 300, 300);
  }
}

void mousePressed()
{
  {
    mode = !mode;
  }
  redraw();
}
