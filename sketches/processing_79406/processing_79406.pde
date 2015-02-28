
//Allison Wong, MagicEightBall, CP1 mods 4-5
//http://allisonprogrammingsite.webs.com/

boolean mode;
void setup()
{
  size(600,600);
  noLoop();
  textSize(21);
}
void draw()
{
  String[] answers = {"outlook not so good", "don't count on it", "my sources say no", "without a doubt", "reply hazy", "try again", "it is certain", "my reply is no", "as I see it yes", "most likely", "you may rely on it", "cannot predict now", "better not tell you now", "very doubtful", "outlook good", "yes definitely", "concentrate and ask again"};
  background(175,61,88);
  if (mode == true)
  {
    fill(random(255),random(255),random(255),175);
    ellipse(300,300,300,300);
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
  if (mouseX > 25 && mouseX < 75 && mouseY > 25 && mouseY < 75)
  {
    mode = !mode;
    redraw();
  }
}
