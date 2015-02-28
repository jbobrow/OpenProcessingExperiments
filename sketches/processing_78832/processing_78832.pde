
//Steven G. ,CP! mods 14-15, Eight Ball

boolean mode = false;
void setup()
{
  size(600, 600);
  noLoop();
  textSize(19);
}
void draw()
{
  String[] answers = {"outlook not so good", "don't count on it", "my sources say no","without a doubt" ,"reply hazy, try again" ,"it is certain" ,"my reply is no" ,"as I see it yes" ,"most likely" ,"you may rely on it" ,"cannot predict now"  ,"better not tell you now" ,"very doubtful" ,"outlook good"  ,"yes definitely" ,"concentrate and ask again"};
  background(255);
  if (mode == true)
  {
    fill(random(255),random(255),random(255),175);
    ellipse(300, 300, 300, 300);
    textAlign(CENTER);
    fill(0);
    text(answers[int(random(answers.length))],305,305);
  }
  else
  {
    fill(0);
    ellipse(300, 300, 300, 300);
  }
}
void mousePressed()
{
  if (mouseX > 150 && mouseY > 150 && mouseX < 450 && mouseY < 450)
  {
    mode = !mode;
    redraw();
  }
}
