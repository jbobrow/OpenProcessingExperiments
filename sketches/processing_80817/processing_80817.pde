
//Emily Fong, CP1 Mods 4-5, Magic 8 Ball

boolean mode = false;
String [] answers = {
  "it is certain", "as I see it yes", "most likely", "you may rely on it", "outlook good", "yes, definitely", 
  "outlook not so good", "don't count on it", "my sources say no", "my reply is no", "very doubtful", 
  "reply hazy, try again", "cannot predict now", "better not tell you now", "concentrate and ask again"
};
void setup()
{
  size(300, 300);
  background(0);
  fill(194, 190, 228);
  ellipse(150, 150, 250, 250);
  textAlign (CENTER);
  noLoop();
}
void draw()
{
  if (mode == true)
  {
    fill (0);
    int index = int(random(answers.length));
    text(answers[index], 150, 150);
  }
  else
  {
    fill(194, 190, 228);
    ellipse(150, 150, 250, 250);
  }
}
void mousePressed()
{
  mode=!mode;
  redraw();
}
