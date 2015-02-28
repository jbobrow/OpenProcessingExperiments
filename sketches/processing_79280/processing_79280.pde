
//Brian C, Magic Eight Ball, CP1 Mods 16/17

boolean question = true;
String [] answers = {"outlook not so good", "don't count on it", "my sources say no", "without a doubt", "reply hazy, try again", "it is certain", "my reply is no", "as I see it yes", "most likely", "you may rely on it", "cannot predict now", "better not tell you now", "very doubtful", "outlook good", "yes definitely", "concentrate and ask again"};
void setup()
{
  size(250, 250);
  background(0);
  noLoop();
}
void draw()
{
  if (question == true)
  {
    stroke(255);
    fill(165, 48, 140); //purple
    ellipse(125, 125, 200, 200);
    fill(0); //top
    ellipse(125, 60, 100, 50);
    fill(0);
    ellipse(125, 47, 30, 15);
    ellipse(125, 65, 50, 20);
  }
  else if (question == false)
  {
    fill(0);
    textAlign(CENTER);
    text(answers[int(random(-1,16))],125,135);
  }
}
void mouseClicked()
{
  question = !question;
  redraw();
}
