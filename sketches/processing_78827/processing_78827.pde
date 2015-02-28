
String[] answers = {"outlook not so good", "don't count on it", "my sources say no", "without a doubt", "reply hazy, try again", "it is certain", "my reply is no", "as I see it yes", "most likely", "you may rely on it", "cannot predict now", "better not tell you now", "very doubtful", "outlook good", "yes definitely", "concentrate and ask again","the answer is fried chicken","steven copied me","The number is 69","No, but you will be (Mg/Fe)₇Si₈O₂₂(OH)₂ \n if you're with me", "I know you like Al₂Si₂O₅(OH)₄ \n but without the -ite.", "You can get the answer by watching \nthe count censored on youtube.", " You shall give someone C₉H₁₀O tonight."};
boolean mode = false;
void setup()
{
  size(600, 600);
  noLoop();
}
void draw()
{
  background (255);
  if (mode == true)
  {
    fill(random(255),random(255),random(255));
    ellipse(300, 300, 300, 300);
    textAlign(CENTER);
    fill(255);
    text(answers[int(random(answers.length))], 300, 300);
  }
  else
  {
    fill(0);
    ellipse(300, 300, 300, 300);
  }
}
void mousePressed()
{
  if (mouseX > 250 && mouseX < 350 && mouseY > 250 && mouseY < 350)
  {
    mode = !mode;
  }
  redraw();
}



