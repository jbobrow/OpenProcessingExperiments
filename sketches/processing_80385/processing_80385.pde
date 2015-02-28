
boolean mode = true;
String answers [] = {
  "outlook not so good", "don't count on it", "my sources say no", "without a doubt", "reply hazy, try again", "it is certain", "my reply is no", "as I see it yes", "most likely", "you may rely on it", "cannot predict now", "better not tell you now", "very doubtful", "outlook good", "yes definitely", "concentrate and ask again"
};
void setup()
{
  size(500, 530);
  background(0,0,255);
  textAlign(CENTER);
  textSize(20);
  smooth();
  noLoop();
}
void draw()
{

  int i = int(random(16));
  fill(0);
  ellipse(250, 250, 390, 390);
  if (mode == true)
  {
    fill(255,0,0);
    rect(0, 455, 500, 120);
    fill(255);
    ellipse(250, 120, 150, 90);
    text("Think of a yes/no question then click anywhere\n to get an answer", 250, 475);
    noFill();
    strokeWeight(5);
    ellipse(250, 100, 60, 20);
    ellipse(250, 130, 90, 40);
    strokeWeight(1);
  }
  else if (mode == false)
  {

    fill(0,255, 0);
    triangle(170, 80, 330, 80, 250, 170);
    fill(255);
    text(answers[i], 250, 250);
    fill(255, 0, 0);
    rect(0, 455, 500, 120);
    fill(255);
    text("Click anywhere to\n ask another question", 250, 475);
  }
}
void mousePressed()
{
  if (mouseX > 0 && mouseX < 500 && mouseY > 0 && mouseY < 520)
  {
    mode = !mode;
    redraw();
  }
}


