
//Dan-Tran COng-Huyen, Magic Eight Ball, CP1 16/17
boolean mode;
String answers[] = {
"outlook not so good",
"don't count on it",
"without a doubt","reply hazy, try again",
"it is certain",
"my reply is no",
"you may rely on it",
"cannot predict now",
"better not tell you now",
"very doubtful",
"outlook good",
"concentrate and ask again"};
void setup()
{
  size (500, 500);
  noLoop();
}
void draw()
{
  background(227, 98, 98);
  if (mode == false)
  {
    fill(0);
    stroke(0);
    ellipse(250, 250, 300, 300);
    stroke(255);
    fill(255);
    noStroke();
    ellipse(250, 145, 100, 70);
    noFill();
    stroke(0);
    strokeWeight(2);
    ellipse(250, 125, 25, 20);
    ellipse(250, 150, 37, 30);
  }
  else
  {
    int i = int(random(11));
    stroke(0);
    fill(0);
    ellipse(250, 250, 300, 300);
    fill(99, 203, 201);
    noStroke();
    triangle(182, 130, 312, 130, 250, 190);
    textAlign(CENTER);
    fill(255);
    textSize(25);
    text(answers[i],250,250);
  }
}
void mouseClicked()
{
  if (mouseX > 182 && mouseX < 312 && mouseY > 130 && mouseY < 190)
  {
    mode = !mode;
    redraw();
  }
}
