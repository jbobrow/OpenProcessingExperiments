
//Lucky Lui 8 ball Computer Programming 1

String[] answers = 
{ 
  "yes", "no", "maybe", "of course", 
  "no way", "never", "definetely", 
  "not now", "Don't Bother", "hi", "don't wory about it", "out of order",
  "try again", "in the future", "probably not",
  "haha, JOKES"
};

boolean mode=true;

void setup()
{

  noLoop();
  smooth();
  size(500, 500);
  background(0);
}
void draw()
{
  int x=int(random(15));
  fill(75, 27, 240);
  stroke(0);
  ellipse(250, 250, 350, 350);
  if (mode==true)
  {
    fill(255);
    ellipse(250, 125, 150, 100);
    fill(0);
    textSize(100);
    textAlign(CENTER);
    text("8", 250, 160);
  }
  else if (mode==false)
  {
    fill(277, 2, 224);
    triangle(250, 200, 150, 110, 350, 110);
    textSize(25);
    textAlign(CENTER);
    text(answers[x], 250, 250);
  }
}
void mousePressed()
{
  mode=!mode;
  redraw();
}
