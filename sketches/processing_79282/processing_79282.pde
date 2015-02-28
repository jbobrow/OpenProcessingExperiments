
//Justin J. Eight Ball, CP1, Mods 16/17
String answers[] = {
  "outlook not so good", "maaaaaaaybe", "not gonna happen", "without a doubt", "reply hazy, try again", "it is certain", "NOWAI", "as I see it yes", "most likely", "you may rely on it", "cannot predict now", "You're CRAAAAAAAAAZY!", "very doubtful", "outlook good", "Of course, DUH!", "concentrate and ask again"
};
boolean mode=false;
void setup()
{
  noLoop();
  size (300, 300);
  noStroke();
  textAlign(CENTER);
}
void draw()
{
  background(0);
  mode = !mode;
  if (mode==true)
  {
    fill(196, 61, 61);
    ellipse (150, 150, 200, 200);
    fill(255);
    textSize(11);
    text("Think of a yes or no question and then click the 8.", 150, 30);
    ellipse (150, 225, 50, 50);
    fill(196, 61, 61);
    textSize(36);
    text("8", 150, 238);
  }
  else  //(mode==false)
  {
    int index = int(random(15));
    fill(196, 61, 61);
    ellipse (150, 150, 200, 200);
    fill(255);
    triangle(100,70,200,70,150,110);
    textSize(11);
    text("Click the 8 to start over.", 150, 30);
    text(answers[index], 150, 150);
    ellipse (150, 225, 50, 50);
    fill(196, 61, 61);
    textSize(36);
    text("8", 150, 238);
  }
}
void mousePressed()
{
  if (dist(mouseX, mouseY, 150, 225) < 25)
  {
    redraw();
  }
}
