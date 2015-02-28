
boolean mode = false;
void setup()
{
  size(500, 500);
  noLoop();
}
void draw()
{
  background(255);
  if (mode == false)
  {
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("Ask the Magic 8-ball a Yes/No Question", 250, 450);
    ellipse(250, 250, 300, 300);
    fill(255);
    ellipse(250, 175, 100, 100);
    fill(0);
    textAlign(CENTER);
    textSize(50);
    text("8", 250, 190);
  }
  else
  {
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("Ask the Magic 8-ball a Yes/No Question", 250, 450);
    ellipse(250, 250, 300, 300);
    fill(255);
    triangle(175, 125, 325, 125, 250, 255);
    int p = int(random(0, 16));
    if (p==0)
    {
      fill(255);
      textSize(20);
      textAlign(CENTER);
      text("OOH THIZ IZ BAD", 250, 300);
    }
    if (p==1)
    {
      fill(255);
      textSize(20);
      textAlign(CENTER);
      text("Don't count on it", 250, 300);
    }
    if (p==2)
    {
      fill(255);
      textSize(20);
      textAlign(CENTER);
      text("NOPE.AVI", 250, 300);
    }
    if (p==3)
    {
      fill(255);
      textSize(20);
      textAlign(CENTER);
      text("Without a doubt", 250, 300);
    }
    if (p==4)
    {
      fill(255);
      textSize(20);
      textAlign(CENTER);
      text("Your mind is too KLUTTERED", 250, 300);
    }
    if (p==5)
    {
      fill(255);
      textSize(20);
      textAlign(CENTER);
      text("It is certain", 250, 300);
    }
    if (p==6)
    {
      fill(255);
      textSize(20);
      textAlign(CENTER);
      text("My reply is no", 250, 300);
    }
    if (p==7)
    {
      fill(255);
      textSize(20);
      textAlign(CENTER);
      text("As I see it, yes", 250, 300);
    }
    if (p==8)
    {
      fill(255);
      textSize(20);
      textAlign(CENTER);
      text("Most likely", 250, 300);
    }
    if (p==9)
    {
      fill(255);
      textSize(20);
      textAlign(CENTER);
      text("You may rely on it", 250, 300);
    }
    if (p==10)
    {
      fill(255);
      textSize(20);
      textAlign(CENTER);
      text("My head hurts, try later", 250, 300);
    }
    if (p==11)
    {
      fill(255);
      textSize(20);
      textAlign(CENTER);
      text("Your question is bad", 250, 300);
      text("And you should feel bad", 250,330);
    }
    if (p==12)
    {
      fill(255);
      textSize(20);
      textAlign(CENTER);
      text("Very doubtful", 250, 300);
    }
    if (p==13)
    {
      fill(255);
      textSize(20);
      textAlign(CENTER);
      text("VERY GOOD", 250, 300);
    }
    if (p==14)
    {
      fill(255);
      textSize(20);
      textAlign(CENTER);
      text("Yes, definitely", 250, 300);
    }
    if (p==15)
    {
      fill(255);
      textSize(20);
      textAlign(CENTER);
      text("MAGIC8BALL.exe", 250, 300);
      text("has stopped working", 250, 330);
    }
  }
}
void mouseClicked()
{
  mode = !mode;
  redraw();
}
