
//Sydney C. CP1 Mods:4/5, Magic Eight Ball
boolean mode = false;
void setup()
{
  size(300, 300);
  noLoop();
  smooth();
  background(255);
}

void draw()
{
  if (mode == false)
  {
    noStroke();
    fill(255);
    rect(20, 20, 260, 260);
    fill(0);
    ellipse(150, 150, 260, 260);
    fill(255);
    ellipse(150, 50, 110, 40);
    stroke(2);
    ellipse(150, 40, 40, 10);
    ellipse(150, 55, 60, 20);
    textSize(15);
    textAlign(CENTER);
    text("Ask me something,\nthen click on me!",150,150);
  }
  else
  {
    fill(0);
    ellipse(150, 150, 260, 260);
    fill(255);
    String answers[] = loadStrings("uhhh.txt");
    text(answers[int(random(answers.length))], 150, 150);
  }
}

void mousePressed()
{
  mode=!mode;
  redraw();
}



