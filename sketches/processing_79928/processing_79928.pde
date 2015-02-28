
//Jimmy C; CP1; Block 6

boolean mode = true;
String[] answers = {"YES","NO","MAYBE"};

void setup()
{
  size (500, 500);
  textAlign(CENTER);
  noLoop();
  textSize(20);
}

void draw()
{
  background (int(random(0,255)),int(random(0,255)),int(random(0,255)));;
  if (mode == true)
  {
    Qmode();
  }
  else
  {
    Amode();
  }
}

void Qmode()
{
  fill(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  ellipse(250, 250, 300, 300);
  fill(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  triangle(250,100,120,325,380,325);
  fill(255);
  text ("Ask a Question", 250, 250);
}

void Amode()
{
  fill(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  ellipse(250, 250, 300, 300);
  fill(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  triangle(250,100,120,325,380,325);
  fill(255);
  text ( answers [int(random(0,3))] , 250, 250);
}

void mouseClicked()
{
  mode = !mode;
  redraw();
}
