
//Hayley G, CP1, 14-15

String answers [] = {
  "The odds are in your favor", "Things are looking up", "Absolutely", "Not in your wildest dreams", "Never", "Keep trying", "Someday", "Ask again later"
};
int num;
boolean mode = false;
void setup ()
{
  size (500,500);
  background(30,144,255);
  smooth();
  noLoop();
  textAlign(CENTER);
}

void draw ()
{
  num = int (random(8));
  stroke(0);
  fill(0);
  ellipse(250,250,350,350);
  if (mode == true)
  {
    fill(255);
    ellipse(250,250,250,250);
    fill(0);
    textSize(18);
    text(answers[num],250,250);
  }
  else if (mode == false)
  {
  fill(255);
  ellipse(250,150,150,70);
  fill(0);
  textSize(30);
  text("8",250,150);
  }
}

void mouseClicked()
{
  mode = ! mode;
}

void mouseReleased()
{
  redraw();
}
