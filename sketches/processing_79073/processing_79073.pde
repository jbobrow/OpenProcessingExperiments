
//Jenny H. CP1 Mods 14/15, Eight Ball
String lines [] = {"outlook not so good", "don't count on it", "my sources say no", "without a doubt", "reply hazy, try again", "it is certain", "my reply is no", "as I see it, yes", "most likely", "you may reply on it", "cannot predict now", "better not tell you now", "very doubtful", "outlook good", "yes definitely", "concentrate and ask again"};
boolean mode = false;
void setup ()
{
  size (500, 500);
  background (255);
  smooth ();
  noLoop();
}
void draw ()
{
  if (mode == false)
  {
    fill (0);
    ellipse (250, 250, 300, 300);
    fill (255);
    ellipse (250, 170, 170, 120);
    noFill ();
    ellipse (250, 140, 100, 40);
    ellipse (250, 190, 110, 60);
  }
  else 
  {
    fill (0);
    ellipse (250, 250, 300, 300);
    fill (255, 0, 0);
    triangle (150, 150, 350, 150, 250, 200);
    fill (255);
    textSize (15);
    int i = int(random (0, 16));
    text (lines [i], 200, 250);
  }
}

void mouseClicked()
{
  mode = !mode;
  redraw();
}
