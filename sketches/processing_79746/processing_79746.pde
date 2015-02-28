
//Jinhe Weber, CP1, Mods 16-17
String answers [] =
{"Outlook not so good.", "Don't count on it.", "My sources say no.", "Without a doubt.", "Reply hazy, try again.", "It is certain.", "My reply is no.", "As I see it, yes.", "Most likely.", "You may rely on it.", "Cannot predict now.", "Better not tell you now.", "Very doubtful.", "Outlook good.", "Yes, definitely.", "Concentrate and ask again."
};
int num; 
boolean mode = false;
void setup()
{
  size (450,450);
  background(215,148,245);
  smooth();
  noLoop();
  textAlign(CENTER);
}
void draw()
{
  fill(255);
  num = int (random(16));
  fill(0);
  ellipse (225,225,350,350);
  if (mode == true)
  {
    fill(47,11,72);
    ellipse(225,225,235,235);
    fill(255);
    textSize(17);
    text(answers[num],225,225);
  }
  else if (mode == false)
  {
    fill(255);
    ellipse (225,100,150,100);
    fill(0);
    textSize(75);
    text("8",225,120);
  }
}
void mouseClicked()
{
  mode = ! mode;
}
void mouseReleased()
{
  redraw();
}
