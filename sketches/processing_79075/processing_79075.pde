
String words[] = {"YES","NO","ALWAYS","NEVER","MAYBE","SOMETIMES","INVALID","TRY AGAIN","???","...","YES AND NO","Very","Not At All","Extremely","Ask Yourself"};
boolean mode;
void setup()
{
  size(500,500);
  background(255);
  mode = false;
  textSize(50);
  StrokeWeight(10);
  noloop();
}
void draw()
{
  if(mode == true)
  {
    background(255);
    ball1();
    textBox1();
  }
  else if (mode == false)
  {
    background(int(random(256)),int(random(256)),int(random(256)));
    ball2();
    textBox2();
  }
}
void mouseClicked()
{
  if(mouseX > 100 && mouseX < 400 && mouseY > 25 && mouseY <325)
  {
    mode =! mode;
    redraw();
  }
}
void ball1()
{
  strokeWeight(10);
  fill(0);
  ellipse(250,175,300,300);
  fill(255);
  ellipse(250,90,150,100);
  ellipse(250,70,50,25);
  ellipse(250,100,70,35);
}
void ball2()
{
  strokeWeight(10);
  fill(int(random(256)),int(random(256)),int(random(256)));
  ellipse(250,175,300,300);
  fill(255);
  ellipse(250,90,150,100);
  ellipse(250,70,50,25);
  ellipse(250,100,70,35);
}
void textBox1()
{
  rect(0,350,500,150);
  fill(0);
  text("ASK A QUESTION\nI DARE YOU",45,405);
}
void textBox2()
{
  rect(0,350,500,150);
  fill(int(random(256)),int(random(256)),int(random(256)));
  text(words[int(random(0,15))],45,405);
}
