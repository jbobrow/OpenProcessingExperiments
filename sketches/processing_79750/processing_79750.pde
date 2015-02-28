
//Jarvis Law,Magic8Ball,CP1 mod 16-17
String[] answers= {
  "Yes, you will", "No, you're not. Don't worry", "Ask me again later... I'm a little busy", "You tell me", "Count on it", "For sure", "Not likely", "Ask me again when you're alone"
};
boolean mode=false;
int x=0;
void setup()
{
  size(500, 500);
  background(255, 0, 0);
  mode=false;
  smooth();
  noLoop();
  textAlign(CENTER);
}
void draw()
{
  if (mode==true)
  {
    background(255, 0, 0);
    fill(0);
    ellipse(250, 250, 400, 400);
    fill(255);
    ellipse(250, 200, 300, 280);
    fill(169,0,242);
    triangle(250,250,200,200,300,200);
    text(answers[x]+ ".", 250, 370);
    x++;
    if (x>answers.length-1)
    {
      x=0;
    }
  }
  else
  {
    strokeWeight(7);
    background(255, 0, 0);
    fill(0);
    ellipse(250, 250, 400, 400);
    fill(255);
    ellipse(250, 200, 300, 280);
    ellipse(250, 125, 48, 28);
    ellipse(250, 157, 60, 35);
    textSize(15);
    text("Ask a question and then click here.", 250, 380);
  }
}
void mouseClicked()
{
  mode=!mode;
  redraw();
}
