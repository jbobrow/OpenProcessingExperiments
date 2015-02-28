
boolean mode=true;
String answers[]= {
  "outlook not so good", "don't count on it", "my sources say no", "without a doubt", "reply hazy, try again", "it is certain", "my reply is no", "as I see it yes", "most likely", "you may rely on it", "cannot predict now", "better not tell you now", "very doubtful", "outlook good", "yes definitely", "concentrate and ask again"
};
int i=4;

void setup()
{
  noLoop();
  noStroke();
  size(500, 500);

  //background
  fill(80);
  rect(0, 0, 500, 150);
  fill(160, 42, 0);
  rect(0, 150, 500, 120);
  fill(206, 88, 0);
  rect(0, 110, 500, 40);
  fill(0, 150, 0);
  rect(0, 270, 500, 230);

  //ball
  fill(0);
  ellipse(250, 270, 250, 250);
}

void draw()
{
  //Mode
  if (mode==true)
  {
    //background
    fill(80);
    rect(0, 0, 500, 150);
    fill(160, 42, 0);
    rect(0, 150, 500, 120);
    fill(206, 88, 0);
    rect(0, 110, 500, 40);
    fill(0, 150, 0);
    rect(0, 270, 500, 230);

    //ball
    fill(0);
    ellipse(250, 270, 250, 250);
    fill(255);
    ellipse(250, 230, 126, 126);
    fill(0);
    textSize(70);
    textAlign(CENTER);
    text("8", 250, 250);
    fill(255);
    textSize(16);
    text("Think of a question and click the 8 to get an answer", 250, 50);
  }
  else
  { 
    //background
    fill(80);
    rect(0, 0, 500, 150);
    fill(160, 42, 0);
    rect(0, 150, 500, 120);
    fill(206, 88, 0);
    rect(0, 110, 500, 40);
    fill(0, 150, 0);
    rect(0, 270, 500, 230);

    //ball
    fill(0);
    ellipse(250, 270, 250, 250);
    fill(255);
    ellipse(250, 230, 126, 126);
    textSize(25);
    textAlign(CENTER);
    text("8 Ball says: "+ answers[i], 250, 430);
    fill(0);
    textSize(10);
    text("Click to ask again", 250, 230);
  }
}

void mousePressed()
{
  if (dist(mouseX, mouseY, 250, 230)<63)
  {
    mode = !mode;
    redraw();
    i=int(random(0, 15));
  }
}
