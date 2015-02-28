
String[] answers = {
  "outlook not so good", "don't count on it", "my sources say no", "without a doubt", "reply hazy, try again", "it is certain", "my reply is no", "as I see it yes", "most likely", "you may rely on it", "cannot predict now", "better not tell you now", "very doubtful", "outlook good", "yes definitely", "concentrate and ask again"
};
boolean answer;
void setup()
{

  size(600, 600);
  answer = false;
  noLoop();
}
void draw()
{
  int x = int(random(20));
  background(49, 222, 191);


  if (answer == true)
  {
    fill(0);
    ellipse(300, 300, 300, 300);
    fill(33, 234, 71);
    rect(200, 250, 200, 75);
    fill(0);
    textSize(15);
    text(answers[x], 240, 300);
  }
  else
  {
    fill(0);
    ellipse(300, 300, 300, 300);
    fill(255);
    ellipse(300, 200, 120, 80);
    stroke(0);
    strokeWeight(2);
    ellipse(300, 185, 45, 20);
    ellipse(300, 210, 55, 30);
  }
}
void mousePressed()
{
  if (mouseX>175 && mouseX < 425 && mouseY >175 && mouseY<425)
  {
    answer = !answer;
    redraw();
  }
}
  void mouseReleased()
  {
    answer = answer;
    redraw();
  }
