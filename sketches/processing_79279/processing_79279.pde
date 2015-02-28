
//Bozhong H. Magic Eight Ball CP1 14-15
int a=60;
int i=0;
boolean mode = false;
String[] lines = {
  "outlook not so good", 
  "don't count on it", 
  "my sources say no", 
  "without a doubt", 
  "reply hazy", "try again", 
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
  "concentrate and ask again"
};
void setup()
{
  size(400, 400);
  background(255);
  noLoop();
}
void draw()
{

  ball();
  button();
  words();
}
void button()
{
  fill(a);
  stroke(0);
  rectMode(CENTER);
  rect(200, 200, 150, 150);
}
void mousePressed()
{
  if(mouseX>100&&mouseX<250&&mouseY>125&&mouseY<275)
  {
  a=127;
  mode=true;
  redraw();
  }
}
void mouseReleased()
{
  a=60;
  mode=false;
  redraw();
}
void ball()
{
  fill(0, 0, 255);
  ellipse(200, 200, 300, 300);
}
void words()
{
  if (mode==true)
  {
    i=int(random(17));
    textAlign(CENTER);
    fill(0);
    text(lines[i], 200, 200);
  }
}



