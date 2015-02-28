
// Abby Zhang mod 4,5 Cp1
boolean mode;
String [] answers= {"outlook not so good", "don't count on it", "my sources say no", "without a doubt", "reply hazy, try again", "it is certain", "my reply is no","as I see it yes", "most likely", "you may rely on it", "cannot predict now", "better not tell you now", "very doubtful", "outlook good","yes definitely", "concentrate and ask again"};
void setup()
{
  mode = false;
  size(200,250);
  frameRate(5);
  noLoop();
}
void draw()
{
  background(255,255,255);
  fill(0,0,255);
  rect(0,200,200,250);
  fill(0,0,0);
  if(mode==false)
  {
    fill(0,0,0);
    ellipse(100,100,150,150);
    fill(255,255,255);
    ellipse(100,50,60,40);
    noFill();
    stroke(4);
    ellipse(100,40,20,15);
    ellipse(100,57,25,20);
    text("Think of a yes/no question", 25,220);
    text("on then click on the ball", 30,240);
  }
  else
  {
    fill(0,0,0);
    ellipse(100,100,150,150);
    text("Click on the ball",55,220);
    text("to ask another question",40,240);
    fill(255,255,255);
    text(answers[int(random(0,16))],55,100);
  }
}
void mouseClicked()
{
  mode= !mode;
  redraw();
}
