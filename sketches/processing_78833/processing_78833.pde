
boolean mode = true;
String answers [] = {
  "outlook not so good", "don't count on it", "my sources say no", "without a doubt", "reply hazy, try again", "it is certain", "my reply is no", "as I see it yes", "most likely", "you may rely on it", "cannot predict now", "better not tell you now", "very doubtful", "outlook good", "yes definitely", "concentrate and ask again", "WHY WOULD YOU EVEN ASK THAT\nWHAT IS WRONG WITH YOU"
};
void setup()
{
  size(500, 520);
  background(192, 32, 201);
  textAlign(CENTER);
  textSize(23);
  smooth();
  noLoop();
}
void draw()
{

  int i = int(random(17));
  fill(0);
  ellipse(250, 250, 400, 400);
  if (mode == true)
  {
    rect(0, 455, 500, 120);
    fill(255);
    ellipse(250, 100, 140, 80);
    text("Think of a yes/no question then click on\nthe 8 on the ball to get an answer", 250, 475);
    noFill();
    strokeWeight(6);
    ellipse(250, 80, 60, 25);
    ellipse(250, 112, 90, 40);
    strokeWeight(1);
  }
  else if (mode == false)
  {

    fill(119, 14, 227);
    triangle(150, 90, 350, 90, 250, 150);
    fill(255);
    text(answers[i], 250, 250);
    fill(0);
    rect(0, 455, 500, 120);
    fill(255);
    text("Click on the triangle\nto ask another question", 250, 475);
  }
}
void mousePressed()
{
  if (mouseX > 180 && mouseX < 320 && mouseY > 60 && mouseY < 140)
  {
    mode = !mode;
    redraw();
  }
}
