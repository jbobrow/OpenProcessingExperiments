
String[] x= {
  "outlook not so good", "don't count on it", "my sources say no ,without a doubt", "reply hazy, try again", "it is certain ,my reply is no", "as I see it yes ,most likely ,you may rely on it", "cannot predict now", "better not tell you now", "very doubtful ,outlook good", "yes definitely", "concentrate and ask again"
};
boolean answer=true;
void setup()
{
  noLoop();
  size(500, 500);
  noStroke();
}
void draw()
{
  background(255);
  fill(0);
  ellipse(250, 250, 450, 450);
  if (answer==true)
  {    
    Ball();
  }
  else if (answer!=true) {
    Ball2();
  }
}
void mouseClicked()
{
  answer=!answer;
  redraw();
}

void Ball()
{
  background(255);
  fill(0);
  ellipse(250, 250, 450, 450);
  fill(255);
  ellipse(250, 250, 250, 250);
  strokeWeight(10);
  stroke(0);
  ellipse(250, 190, 100, 100);
  ellipse(250, 300, 120, 120);
}
void Ball2()
{
  background(255);
  fill(0);
  ellipse(250, 250, 450, 450);
  textAlign(CENTER);
  fill(255);
  text(x[int (random(-1, 8))], 250, 250);
}


