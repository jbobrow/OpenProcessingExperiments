
//Tina L., CP1 14/15 Magic 8 Ball
boolean mode = true;
void setup()
{
  background(246, 195, 247);
  size(400, 400);
  noLoop();
}
String[] answers = 
{
  "outlook not so good", 
  "don't count on it", 
  "my sources say no", 
  "without a doubt", 
  "reply hazy, try again", 
  "it is certain", 
  "my reply is no", 
  "as I see it yes", 
  "most likely", 
  "you may rely on it", 
  "cannot predict now", 
  "better not tell you now", 
  "very doubtful", 
  "outlook good", 
  "yes definitely", 
  "concentrate and ask again",
};
void draw()
{
  fill(0);
  ellipse(200, 200, 300, 300);
  if (mode == true)
  {
    fill(255);
    ellipse(200, 95, 150, 85);
    noFill();
    strokeWeight(2);
    ellipse(200,70,70,30);
    ellipse(200,105,90,40);
  }
  else
  {
    fill(158,70,255);
    triangle(110, 180, 290, 180, 200, 280);
    fill(255);
    textAlign(CENTER);
    int click = int(random(answers.length));
    text(answers[click],200,200);
  }
}
void mouseClicked()
{
  mode = !mode;
  redraw();
}
