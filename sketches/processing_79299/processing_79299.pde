
//Lisa L, CP1 Mods 16/17, Magic Eight Ball

String[] answers = {
  "outlook not so good", "don't count on it", 
  "my sources say no", "without a doubt", "reply hazy, try again", 
  "it is certain", "my reply is no", "as I see it yes", 
  "most likely", "you may rely on it", "cannot predict now", 
  "better not tell you now", "very doubtful", "outlook good", 
  "yes definitely", "concentrate and ask again"
};
boolean mode = true;
void setup()
{
  noLoop();
  size(350, 350);
  background(183, 177, 177);
  smooth();
}
void draw()
{
  noStroke();
  //shadow
  fill(106, 99, 99);
  ellipse(245, 280, 250, 40);
  //ball
  fill(0);
  ellipse(175, 175, 250, 250);
  if (mode==true)
  {
    fill(255);
    ellipse(175, 105, 125, 95);
    stroke(0);
    strokeWeight(5);
    ellipse(175, 85, 48, 28);
    ellipse(175, 117, 60, 35);
  }
  else
  {
    fill(2,94,118);
    ellipse(175, 105, 125, 95);
    fill(77, 215, 255);
    triangle(135, 75, 215, 75, 175, 140);
    int i = int(random(0,16));
    fill(255);
    textAlign(CENTER);
    textSize(16);
    text(answers[i],175,180);
  }
}
void mouseClicked()
{
  mode=!mode;
  redraw();
}
