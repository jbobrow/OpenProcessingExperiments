
String[] answers = { 
  "outlook not so good", "don't count on it", "my sources say no", "without a doubt", "reply hazy, try again", "it is certain", "my reply is no", "as I see it yes", "most likely", "you may rely on it", "cannot predict now", "better not tell you now", "very doubtful", "outlook good", "yes definitely", "concentrate and ask again"
}; 

boolean mode = false;

void setup ()
{
  size(500, 500);
  noLoop();
}

void draw ()
{
  background(255);
  mode = !mode;
  if (mode == true)
  {
    fill(0);
    ellipse(250, 200, 300, 300);
    fill(255);
    ellipse(250, 125, 150, 150);
    strokeWeight(7);
    ellipse(250, 85, 65, 70);
    ellipse(250, 155, 70, 80);
    fill(255, 0, 0);
    rect(10, 400, 480, 90);
    fill(0);
    textSize(30);
    text("Ask your question and click here", 10, 450);
  }
  else
  {
    fill(0);
    ellipse(250, 200, 300, 300);
    fill(255);
    ellipse(250, 125, 150, 150);
    fill(207, 37, 227);
    triangle(200, 100, 300, 100, 252, 175);
    int x = int(random(16));
    text(answers[x], 115, 40);
    fill(255, 0, 0);
    rect(10, 400, 480, 90);
    fill(0);
    textSize(28);
    text("Click here to ask another question", 20, 450);
  }
}

void mousePressed()
{
  if (mouseX > 10 && mouseX < 490 && mouseY > 400 && mouseY < 490)
  {
    redraw();
  }
}
