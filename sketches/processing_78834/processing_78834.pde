
//Benson L, CP1 Mods 14-15, Magic Eight Ball
boolean mode = false;
String[] answers = {"outlook not so good", "don't count on it", "my sources say no", "without a doubt", "reply hazy, try again", "it is certain", "my reply is no", "as I see it yes", "most likely", "you may rely on it", "cannot predict now", "better not tell\nyou now", "very doubtful", "outlook good", "yes definitely", "concentrate and\nask again", "try again later"};
void setup()
{
  size(400, 500);
  background(0, 200, 5);
  noLoop();
  textSize(27);
  textAlign(CENTER);
}
void draw()
{
  int i = int(random(17));
  fill(0);
  ellipse(200, 200, 350, 350);
  fill(255,0,0);
  rect(0,400,400,100);
  if (mode == false)
  {
    fill(255);
    ellipse(200, 80, 175, 100);
    ellipse(200, 55, 80, 25);
    ellipse(200, 85, 95, 37);
    text("Think of a yes/no question\nthen click on the eight",200,435);
  }
  else
  {
    fill(207, 76, 216);
    triangle(105, 55, 295, 55, 200, 130);
    fill(255);
    text(answers[i], 200, 200);
    text("Click on the purple triangle\nto ask another question",200,435);
  }
}
void mousePressed()
{
  if (mouseX < 290 && mouseX > 110 && mouseY < 130 && mouseY > 30)
  {
    mode = !mode;
    redraw();
  }
}
