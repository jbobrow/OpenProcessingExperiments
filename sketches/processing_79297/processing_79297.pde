
int i=0;
String[] answers = {
  "Outlook not so good", "Don't count on it", "My sources say no", "Without a doubt", "Reply hazy, try again", "It is certain", "My reply is no", "As I see it yes", "Most likely", "You may rely on it", "Cannot predict now", "Better not tell you now", "Very doubtful", "Outlook good", "Yes definitely", "Concentrate and ask again"
};
boolean mode = false;
void setup()
{
  noLoop();
  size(400, 400);
}
void draw()
{
  if (mode==true)
  {
    background(197);
    fill(0);
    ellipse(200, 175, 300, 300);
    fill(255);
    ellipse(200, 125, 150, 150);
    fill(95, 48, 240);
    triangle(150, 100, 250, 100, 200, 150);
    fill(200, 200, 200, 200);
    rect(0, 250, 400, 250);
    textSize(18);
    fill(255, 0, 0);
    text("The 8 Ball says: "+ answers[i] +".", 10, 300);
    textSize(13);
    text("Click again to ask another question. ", 10, 350);
    i++;
    if (i>answers.length-1)
    {
      i=0;
    }
  }
  else
  {
    background(197);
    stroke(255);
    fill(0);
    ellipse(200, 175, 300, 300);
    fill(255);
    ellipse(200, 125, 150, 150);
    fill(0);
    textSize(100);
    text("8", 167, 150);
    fill(200, 200, 200, 200);
    rect(0, 250, 400, 250);
    textSize(20);
    fill(255, 0, 0);
    text("Think of a question and ", 80, 315);
    text("then click the mouse.",82,340);
  }
}
void mousePressed()
{
  mode = !mode;
  redraw();
}
