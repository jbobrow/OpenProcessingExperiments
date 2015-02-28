
//Jonathan Huang, Cojmputer Programming 1, mods 16/17


String [] answers = {
  "outlook not so good", "don't count on it", "my sources say no", "without a doubt", "reply hazy, try again", "it is certain", "my reply is no", "as I see it yes", "most likely", "you may rely on it", "cannot predict now", "better not tell you now", "very doubtful", "outlook good", "yes definitely", "concentrate and ask again"
}; 
boolean mode = false;

void setup()
{
  size(500, 575);
  noLoop();
}

void draw()
{
  fill(255,0,0);
  rect(0,500,500,200);
  fill(0);
  int i = int(random(16));
  if ( mode == true)
  {
    fill(0);
    ellipse(250, 250, 325, 325);
    fill(255);
    ellipse(250, 185, 175, 175);
    fill(118, 45, 165);
    triangle(220, 170, 280, 170, 250, 200);
    fill(0);
    textSize(25);
    text(answers[i], 250, 525);
  }
  else
  {
    ellipse(250, 250, 325, 325);
    fill(255);
    ellipse(250, 185, 175, 175);
    fill(0);
    textSize(100);
    textAlign(CENTER);
    text("8", 250, 220);
    fill(0,255,0);
    rect(425, 425, 50, 50);
  }
}

void mousePressed()
{
  if (mouseX > 425 && mouseX< 475 && mouseY > 425 && mouseY < 475)
  {
    mode = !mode;
    redraw();
  }
}
