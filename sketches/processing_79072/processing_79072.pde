
boolean mode = false;
String[] answers = {
  "yes", "NO", "What kind of quesiton is that?!", "Ask again", "most likely", "probably...not", "difinitely", "only time can tell", "what?", "doubtful"
};
void setup()
{
  size(300, 300);
  noLoop();
}
void draw()
{
  background (84, 218, 224);
  if (mode == true)
  {
    fill(0);
    ellipse(150, 120, 200, 200);
    fill(192,91,232);
    triangle(150,50,200,100,100,100);
    fill(255);
    textSize(20);
    textAlign(CENTER);
    int index = int(random(answers.length));
    text(answers[index], 150, 150);
  }
  else 
  {
    fill(0);
    ellipse(150, 120, 200, 200);
    fill(255);
    ellipse(150, 50, 80, 60);
    ellipse(150, 35, 30, 10);
    ellipse(150, 50, 40, 20);
    textSize(30);
    textAlign(CENTER);
    text("Ask Me a Question", 150,260);
  }
}
void mouseClicked()
{
  mode =! mode;
  redraw();
}
