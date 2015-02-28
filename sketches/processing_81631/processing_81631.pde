
//Eugene Liang, Magic 8 Ball, CP1, Mods 16-17


String[] answers = {"I know I'm no help","I don't know", "Probably", "Stop asking me!", "rule: ask three before me", "let me think...", "try Googling it", "I refuse to help!", "Do you realize you're talking to a ball?", "Don't expect so much out of me!", "So much pressure, I can't think", "I hate this job...", "Go away"};
boolean mode = true;
void setup()
{
  size (600,600);
  frameRate(5);
  noLoop();
} 

void draw()
{
  fill(0);
  ellipse(300,300,500,500);
  if(mode == true)
  {
    fill(255);
    ellipse(300,120,190,115);
    noFill();
    strokeWeight(3);
    ellipse(300,87,80,30);
    ellipse(300,133,120,60);
  }
  else
  {
    fill(255);
    triangle(300,220,215,85,385,85);
    textAlign(CENTER);
    int click = int(random(answers.length));
    text(answers[click],300,300);
  }
}
void mouseClicked()
{
  mode = !mode;
  redraw();
}
